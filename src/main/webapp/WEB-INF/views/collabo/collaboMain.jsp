<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!-- Google material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="This is Very Nice Tools!"/>
</jsp:include>

<div class="container" style="margin-top:110px;margin-bottom:130px;">
	<c:if test="${collaboTools != null }">
		<c:forEach items="${collaboTools }" var="t" varStatus="i">
		<div class="row">
				<div class="col-3" style="margin-bottom:10px">
					<input type="hidden" id="collaboNo" value="${t.no }"/>
						<div class="card" style="width:300px;height:215px;" onclick="connectCollabo(this)">
							<div class="card-body">
								<h4 class="card-title">${t.title }</h4>
								<hr/>
								<div class="card-text" style="margin-top:35px;"> 
									<h5>참여자</h5>
									<div style="margin-top:15px;">
										<!-- 참여자 -->
										<c:forEach items="${collaboMemberList }" var="m">
										 	  <c:if test="${m.NO == t.no}">
												<%-- <img width="40px" height="40px" src="${path }/resources/upload/member/${m.PROFILE}"/> --%>
												<img width="40px" height="40px" src="${path }/resources/images/teamwork.png"/>
											</c:if> 
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="col-1"></div>
		</c:forEach>
		<div class="col-3" style="margin-bottom:10px" onclick="createCollabo()">
					<div class="card" style="width:300px;height:215px;" >
						<img height="213px" class="card-img-top" src="${path }/resources/images/teamwork.png"/>
							<div class="card-img-overlay">
								<h4 class="card-title"><span class="material-icons" style="font-size:20px;">add</span>콜라보 생성</h4>
								<hr/>
							</div>
						</div>
					</div>
		<div class="col-1"></div>
	</c:if>
	</div>
</div>
<script>

function createCollabo(){
	console.log("dd");
}

function connectCollabo(element){
	var collaboNo = $(element).parent().children($("input[name=collaboNo_]")).val();
	location.href="${path}/collabo/detail.do?collaboNo="+collaboNo;
}

</script>
<style>
	.card:hover{
		background-color:#E0E0E0;
	}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
