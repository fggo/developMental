<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Main view" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="Main view" />
</jsp:include>

  <style>
    #main-container{
      margin-left: 230px;
      margin-top: 58px;
    }
  </style>

  <main id="main-container" class="p-0 w-100">
    <a class="btn btn-sm btn-outline-dark" href="javascript: ajaxJobPage('${path }/job/jobBoard');">Board View</a><br>
    <a class="btn btn-sm btn-outline-dark my-1" href="javascript: ajaxJobPage('${path }/job/jobApply');">Apply View</a><br>
  </main>

</div> <!-- row -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
