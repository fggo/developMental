package com.kh.workman.collabo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class CollaboController {

	private Logger logger = LoggerFactory.getLogger(CollaboController.class);

	@Autowired
	CollaboService service;

	@Autowired
	MemberService memberService;

	@Autowired
	JavaMailSender mailSender;

	@Value("${gmail}")
	private String gmail;

//	  @RequestMapping("/collabo/main.do") public ModelAndView
//	  connectCollaboMain(ModelAndView mv) { mv.setViewName("collabo/main"); return
//	  mv; }

	@RequestMapping("/collabo/detail.do")
	public ModelAndView connectCollaboDetail(@RequestParam("collaboNo") int collaboNo) {
		CollaboTool collabo = service.selectCollaboTool(collaboNo);
		List<CollaboList> collaboLists = service.selectCollaboLists(collaboNo);
		List<CollaboCard> collaboCards = service.selectCollaboCards(collaboNo);
		List<Member> collaboMembers = service.selectCollaboMembers(collaboNo);

		List<Member> temp = memberService.selectAllMember();
		List<String> userIds = new ArrayList<String>();
		List<String> userProfiles = new ArrayList<String>();
		if (temp != null) {
			for (int i = 0; i < temp.size(); i++) {
				userIds.add(temp.get(i).getId());
				userProfiles.add(temp.get(i).getProfile());
			}
		}
		logger.debug("" + userIds.toString());
		logger.debug("" + userProfiles.toString());

		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboNo", collaboNo);
		mav.addObject("userIds", userIds);
		mav.addObject("userProfiles", userProfiles);
		mav.addObject("collaboMembers", collaboMembers);
		mav.addObject("collaboLists", collaboLists);
		mav.addObject("collaboCards", collaboCards);
		mav.addObject("collaboTool", collabo);
		mav.setViewName("collabo/detail");
		return mav;
	}

	@RequestMapping("/collabo/main")
	public ModelAndView connectCollaboMain(@RequestParam("userId") String userId) {
		logger.debug(userId);

		// List<CollaboTool> collaboTools = service.selectCollaboTools(userId);
		List<CollaboTool> collaboTools = service.selectCollaboTools(userId);
		List<Map<String, String>> collaboMemberList = service.selectCollaboMemberList(userId);
		logger.debug("" + collaboTools);

		ModelAndView mav = new ModelAndView();
		mav.addObject("collaboMemberList", collaboMemberList);
		mav.addObject("collaboTools", collaboTools);
		mav.setViewName("collabo/collaboMain");
		return mav;
	}

//	@RequestMapping("/collabo/create")
//	public String connectionCollaboCreate() {
//		return "collabo/createCollabo";
//	}

	@RequestMapping("/collabo/createCollabo")
	public ModelAndView createCollabo(@RequestParam("title") String title, @RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		if (userId != null && title != null) {
			Map<String, Object> temp = new HashMap<String, Object>();
			temp.put("userId", userId);
			temp.put("title", title);
			boolean isSuccess = service.createCollaboTool(temp) == 1 ? true : false;
			boolean isMemberSuccess = service.insertCollaboMember(temp) == 1 ? true : false;
			logger.debug("" + isSuccess);
			logger.debug("" + isMemberSuccess);
			mav.setViewName("common/msg");
			if (isSuccess && isMemberSuccess) {
				mav.addObject("msg", "생성에 성공했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			} else {
				mav.addObject("msg", "생성에 실패했습니다.");
				mav.addObject("loc", "/collabo/main?userId=" + userId);
			}
		}
		return mav;
	}

	@RequestMapping("/collabo/inviteMember")
	@ResponseBody
	public String inviteMember(HttpServletRequest request, @RequestParam("userId") String userId,
			@RequestParam("collaboNo") int collaboNo) throws MessagingException {
		String isSend = "false";
		Member owner = service.selectCollaboOwner(collaboNo);
		List<Member> members = service.selectCollaboMembers(collaboNo);
		boolean isPossible = true;
		for (int i = 0; i < members.size(); i++) {
			if (members.get(i).getId().equals(userId)) {
				isPossible = false;
				break;
			}
		}

		if (!owner.getId().equals(userId) && isPossible) {
			CollaboTool collabo = service.selectCollaboTool(collaboNo);

			Member target = new Member();
			target.setId(userId);
			target = memberService.selectLogin(target);
			String requestURL = String.valueOf(request.getRequestURL());
			requestURL = requestURL.replaceAll(request.getRequestURI(), "");
			String content = "<html><body><h3>" + owner.getNickname() + "님이 " + collabo.getTitle()
					+ "팀워크로 초대하셨습니다. </h3></br><a href='" + requestURL + "/collabo/responseInviteMember?userId="
					+ userId + "&collaboNo=" + collaboNo + "'" + ">입장-링크클릭</a></body></html>";

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mmh = new MimeMessageHelper(message, true, "UTF-8");

			mmh.setSubject(owner.getNickname() + "님이 " + collabo.getTitle() + "팀워크로 초대하셨습니다.");
			mmh.setFrom(gmail);
			mmh.setText(content, true);
			mmh.setTo(target.getEmail());

			mailSender.send(message);
			isSend = "true";
		}

		return isSend;
	}

	@RequestMapping("/collabo/responseInviteMember")
	public ModelAndView responseInviteMember(@RequestParam("userId") String userId,
			@RequestParam("collaboNo") int collaboNo) {
		Map<String, Object> temp = new HashMap<String, Object>();

		temp.put("userId", userId);
		temp.put("collaboNo", collaboNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/msg");
		boolean isComplete = service.insertCollaboMember(temp) == 1 ? true : false;
		if (isComplete) {
			mav.addObject("msg", "수락하셨습니다.");
			mav.addObject("loc", "/");
		} else {
			mav.addObject("msg", "문제가 발생하였습니다 고객센터에 문의하세요!");
			mav.addObject("loc", "/");
		}
		return mav;
	}

}
