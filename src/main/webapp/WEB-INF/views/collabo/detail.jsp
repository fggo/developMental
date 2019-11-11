<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script src="${path }/resources/js/detail.js" type="text/javascript"></script>
<!-- jqeury -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script> -->
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Google material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css?ver=1.5" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<!-- Socket -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<section class="container-fluid" id="content">
	<div class="row collabo-header" >
		<div style="width:200px">
			<span style="font-size:18px;color:white;font-weight:bold;">${collaboTool.title }</span>
		</div>
		<div>
			<button style="margin-right:5px;border-radius:8px" class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#inviteModal">초대</button>
			<button style="border-radius:8px"class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#expulsionModal">추방</button>
		</div>
		
	</div>
	<div class="board" >
		<c:if test="${loginMember != null}">
			<c:if test="${collaboLists != null}">
				<c:forEach items="${collaboLists }" var="list">
					<div class="list-wrapper" ondrop="requestMoveList(this,event)" ondragover="return false;">
						<div class="list-content" draggable="true" ondrop="return false" ondragstart="listDrag(this,event)" ondragend="endListDrag()">
							<div class="list-header">
								<span class="list-title">
									${list.title }
								</span>
									<button type="button" class="fa fa-align-justify btn-menu" data-toggle="dropdown"></button>
									<div class="dropdown-menu">
										<div class="dropdown-item">
											<span style="text-align:center;margin-left:17px">리스트 메뉴</span>
											<hr>
											<div style="text-align:center;">
												<button type="button" onclick="requestUpdateList(this)" class="btn btn-sm btn-primary">수정</button>
												<button type="button" onclick="requestDeleteList(this)" class="btn btn-sm btn-primary">삭제</button>
											</div>
										</div>
								    </div>
							</div>
						<div id="listNo_${list.listNo }" name="listNo_${list.listNo }" class="list-cards"  ondrop="requestMoveCard(this,event)" ondragover="return false;">
							<c:if test="${collaboCards != null }">
								<c:forEach items="${collaboCards }" var="card">
									<c:if test="${list.listNo == card.listNo }">
										<div id="cardNo_${card.cardNo }" name="cardNo_${card.cardNo }" class="list-card" ondrop="return false;" draggable="true" ondragstart="cardDrag(this,event)" ondragend="endCardDrag()">
											<span class="card-content">
												${card.content }
											</span>
											<input type="hidden" name="cardWriter" value="${card.writer }"/>
											<span data-toggle="modal" data-test="cardNo_${card.cardNo }" data-target="#cardModal" class="material-icons btn-edit">edit</span>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
						<div class="open-card" >
							<span onclick="requestCreateCard(this);" class="fa fa-plus btn-createCard" >카드 생성</span>
						</div>
					</div>
				</div> 
				</c:forEach>
			</c:if>
		
				
		
		<!-- Add another list -->
		<div class="list-wrapper" >
			<div class="list-content" >
			
				<div class="dropdown div-drop" >
					<button class="dropdown btn-addList" type="button" onclick='$("#listTitle").val(" ");' name="btn_addList"  data-toggle="dropdown" >
						<span class="fa fa-plus" >리스트 생성</span>
					</button>
					<div class="dropdown-menu">
						<div class="dropdown-item">
							<input type="text" id="listTitle" placeholder="Input List Name"/>
							<Button class="btn-createList btn-sm btn btn-primary" type="button" name="btn_cList" onclick="requestCreateList();" >생성</Button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</c:if>
		<!-- END  -->
		 <!-- The Modal -->
 
</div>
<!-- Invite Modal -->
<div class="modal fade" id="inviteModal">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title"><span class="material-icons">input</span>[팀워크 초대]<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
				<div class="ui-widget">
					<label for="userId">ID : </label>
					<input type="text" id="userId" autocomplete="off" />
					<img id="userProfile"/>
				</div>
			</div>
			<div class="modal-footer">
			   <button name="btnModalClose" type="button" class="btn btn-primary" onclick="requestInvite()">초대</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>

<!-- 추방 Modal -->
<div class="modal fade" id="expulsionModal">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title"><span class="material-icons">input</span>[팀워크 추방]<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
				<div class="ui-widget">
					<label for="ExpulsionUserId">ID : </label>
					<input type="text" id="expulsionUserId" autocomplete="off" />
					<img id="userProfile"/>
				</div>
			</div>
			<div class="modal-footer">
			   <button name="btnModalClose" type="button" class="btn btn-primary" onclick="requestExpulsion()">추방</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>



  <!-- Card Modal -->
  <div class="modal fade" id="cardModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title"><span class="material-icons">dvr</span>[Title]<span id="modal-title"></span></h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
      <h4>[Writer]<span id="modal-writer"></span></h4>
      <input type="hidden" id="modalCardNo" value=""/>
        <hr>
          <div class="panel-group">
          	<div class="panel panel-default">
          		<div class="panel-heading">
          			<h5 class="panel-title">
          				<span id="modalContent"></span>
          			</h5>
          		</div>
          		<div id="modifyContent" class="panel-collapse collapse">
          			<div class="panel-body">
          				<textarea id="editContent" rows="3" cols="92"></textarea>
          				<br>
          				<button onclick="requestUpdateCard(this);"type="button" class="btn btn-sm btn-primary" style="margin-top:10px;">수정!</button>
          			</div>
          		</div>
          	</div>
          </div>
          <div style="float:right;margin-top:30px;">
	          <button id="btnEdit" class="btn btn-sm btn-primary" type="button" data-toggle="collapse" data-target="#modifyContent">수정</button>
	          <!-- <button class="btn btn-sm btn-primary" type="button">move</button> -->
	          <button id="btnDelete" class="btn btn-sm btn-primary" onclick="requestDeletCard(this);" type="button">삭제</button>
          </div>
          <div style="margin-top:70px;padding:10px 2px;">
          	<h5>댓글</h5>
          	<hr>
          		<textarea id="editArea" rows="3" cols="92"></textarea>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
        </div>
        
      </div>
    </div>
  </div>

<div class="wrap-loading display-none">
    <div><img src="${path }/resources/images/loder.gif" /></div>
</div>

</section>
<style>
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
    
    .ui-autocomplete{
    	max-height:400px;
    	overflow-y:auto;
    	overflow-x:hidden;
    }

</style>
<script>
function requestExpulsion(){
	var userId = $("#expulsionUserId").val();
		
		if(userId!=''){
			$.ajax({
				type : "post",
				url : "${path}/collabo/expulsionMember",
				dataType : "json",
				data : {
					userId : userId,
					collaboNo : collaboNo
				},
				success : function(data){
					if(data == "true"){
						alert('추방하였습니다.');
					}
					else if(data == "false"){
						alert('추방 실패!');
					}
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
				},
				complete:function(){
					$('.wrap-loading').addClass('display-none');
				}
			});
		}else{
			alert('아이디를 입력해 주세요.');
		}
}

$("#expulsionModal").on("show.bs.modal",function(){
	$("#expulsionUserId").autocomplete("option","appendTo","#expulsionModal");
})


$("#inviteModal").on("show.bs.modal",function(){
	$("#userId").autocomplete("option", "appendTo", "#inviteModal");
});


var userId =  "${loginMember.id}";
var collaboNo = ${collaboNo};
let sock = new SockJS("<c:url value="/collabo/soc"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

if(userId == ""){
	history.back();
}

sock.onopen = function(){
	var sendData ={
		type : "connect",
		userId : userId,
		collaboNo : collaboNo
	};
	sendMessage(sendData);
}


// 메시지 전송
function sendMessage(sendData) {
/* 	var sendData = {
		type : type,
		userId : userId,
		method : method,
		collaboNo : collaboNo,
		content : content,
		listNo : listNo,
		cardNo : cardNo
	}; */
	var jsonData = JSON.stringify(sendData);
    sock.send(jsonData);
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
      var receive = JSON.parse(msg.data);
      if(receive.type == 'list'){
    	  if(receive.method == 'create'){
    		  responseCreateList(receive);
    	  }
    	  if(receive.method == 'delete'){
    		  responseDeleteList(receive);
    	  }
    	  if(receive.method == 'update'){
    		  responseUpdateList(receive);
    	  }
        if(receive.method == 'move'){
          responseMoveList(receive);
        }
      }
      if(receive.type== 'card'){
    	  if(receive.method == 'create'){
    		  responseCreateCard(receive);
    	  }
    	  if(receive.method == 'move'){
    		  responseMoveCard(receive);
    	  }
    	  if(receive.method == 'update'){
    		  
    		  responseUpdateCard(receive);
    	  }
    	  if(receive.method == 'delete'){
			  responseDeleteCard(receive);
    	  }
      }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
	
}

$("#expulsionModal").on('hide.bs.modal',function(e){
	$("#expulsionUserId").val('');
});

$("#inviteModal").on('hide.bs.modal',function(e){
	$("#userId").val('');
});

$("#modifyContent").on('show.bs.collapse',function(){
	var editContent = $("#editContent");
	editContent.val('');
});
 $("#cardModal").on('hide.bs.modal',function(e){
	$("#modifyContent").collapse('hide');
});

$("#cardModal").on('show.bs.modal',function(e){
	var data=$(e.relatedTarget).data('test');
	var cardNo = $(e.relatedTarget).data('test').substring(7);
	var card = $("#"+data);
	var title = $("#modal-title");
	var content = $("#modalContent");
	var writer = $("#modal-writer");
	$("#editArea").val('');
	
	//$("#modalCardNo").val(cardNo);
	$("#modalCardNo").val(cardNo);
	title.text(card.children('.card-content').parent().parent().parent().children('.list-header').children('.list-title').text());
	content.text(card.children('.card-content').text());
	 
	<c:forEach items="${collaboMembers}" var="m">
	if(${m.no} == (parseInt(card.children('input[name=cardWriter]').val()))){
		writer.text("${m.nickname}");
	}
</c:forEach>
});

 $(function(){
	var collaboMembers = new Array();
	var userNicknames = {};
	var userProfiles = {};
	
	<c:forEach items="${collaboMembers}" var="m">
		<c:if test="${m.profile ne null}">
			userProfiles.${m.id} = "${m.profile}";
		</c:if>
		userNicknames.${m.id} = "${m.nickname}";
		collaboMembers.push("${m.id}");
	</c:forEach>
	$("#expulsionUserId").autocomplete({
		minLength : 1,
		source : collaboMembers,
		select : function (event, ui){
			$("#expulsionUserId").val(ui.item.value);
			return false;
		},
		focus : function (event, ui){
			$("#expulsionUserId").val(ui.item.value);
			return false;
		}
	}).autocomplete("instance")._renderItem = function(ul, item){
		var li = $("<li/>");
		var div = $("<div/>");
		var img = $("<img/>");
		var span = $("<span/>");
		
		div.css("display","flex");
		span.css("flex","1");
		span.html(item.value+"<br/>"+userNicknames[item.value]);
		div.append(span);
		if(!userProfiles[item.value]==""){	
			img.attr("src","${path}/resources/images/"+ "teamwork.png");
			img.attr("width","40px");
			img.attr("hegiht","20px");
			div.append(img);
  		}
    return li.append(div).appendTo(ul);
	};
}); 


$(function(){
	var userIds = new Array();
	var userProfiles = {};
	var userNickNames = {};
	<c:forEach items="${members}" var="v" varStatus="i">
		<c:if test="${v.profile ne null}">
			userProfiles.${v.id} = "${v.profile}";
		</c:if> 
		userNickNames.${v.id} = "${v.nickname}";
		userIds.push("${v.id}");
	</c:forEach>
 	$("#userId").autocomplete({
 		minLength : 3,
		source : userIds,
		select : function (event, ui){
			$("#userId").val(ui.item.value);
			return false;
		},
		focus : function (event, ui){
			$("#userId").val(ui.item.value);
			return false;
		}
	}).autocomplete("instance")._renderItem = function( ul, item ) {
      	var li = $("<li/>");
	  	var div = $("<div/>");
	  	var span = $("<span/>");
	    var img = $("<img/>");
	    
	    div.css("display","flex");
	    span.css("flex","1");
	    
	    span.html(item.value+"<br/>"+userNickNames[item.value]);
	    div.append(span);
	    if(!userProfiles[item.value]==""){
			img.attr("src","${path}/resources/images/"+ "teamwork.png");
			img.attr("width","40px");
			img.attr("hegiht","20px");
			div.append(img);
	  	}
	    return li.append(div).appendTo(ul);
	}; 
});
</script>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
 --%>