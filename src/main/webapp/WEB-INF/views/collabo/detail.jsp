<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>



<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<section class="container-fluid" id="content" style="margin-top:58px;background-color:rgb(131, 140, 145);font-family: 'Noto Sans', sans-serif;">
	<div class="row" style="background-color:gray;height:44px;padding:5px 5px">
		<span style="font-size:18px;color:white;font-weight:bold;">대충 트렐로 메뉴</span>
	</div>
	<div class="board" style="display:flex">
		<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
				<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px">
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div class="list-cards" style="margin-top:10px">
					<div class="list-card" style="background-color:#ffffff;padding:5px 5px;font-size:14px">카드내용카드내용카드내용카드드내용카드내내용카드내용</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span class="fa fa-plus" style="margin-right:5px"></span>Add another card
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
