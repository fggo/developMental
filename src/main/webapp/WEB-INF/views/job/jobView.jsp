<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Job - Home" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>

<style>
  #job-container{
    margin-left: 230px;
    margin-top: 58px;
  }
</style>
  <div id="job-container" class="container">
    <div onclick="">Board View</div>
    <div>Apply View</div>
    <div>Company</div>
  </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
