<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="pageTitle" value="Homepage" />
  </jsp:include>

  <!-- CSS -->
  <link rel="stylesheet" href="${path }/resources/css/mainpage.css">

  <!-- Main page cover -->
  <main role="main" id="page-container">
    <div class="jumbotron align-items-center justify-content-center text-white bg-dark" id="first-cover">
      <div class="container">
        <h3 class="text-white row justify-content-center">
          <img src="${path }/resources/images/title.png" alt="">
        </h3>
        <div class="row justify-content-center my-5">
          <a class="btn btn-light" href="${path }/mainView" role="button">
            Learn more &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i>
          </a>
          <a class="btn btn-outline-light mx-1" href="${path }/mainView" role="button">
            Explore more &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i>
          </a>
        </div>
      </div>
    </div>

    <div class="jumbotron container bg-light" id="second-cover">
      <div class="row">
        <div class="col-md-4">
          <p><h3>Developers By <img src="${path}/resources/images/icons8-pixel-heart-50.png" alt=""></h3>massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
          <p><h3>Every Programmer is an <img src="${path}/resources/images/author.png" alt=""></h3>tortor mauris condimentum nibh, magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
            <p><h3>Talk is <img src="${path}/resources/images/cheap.png" alt=""> Show me the <img src="${path}/resources/images/code.png" alt=""></h3>
          tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam . Donec sed odio dui. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
      </div>
    </div> <!-- /container -->

    <div class="jumbotron align-items-center justify-content-center text-white bg-info" id="third-cover" >
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
          tortor mauris condimentum nibh, magna mollis euismod. Donec sed odio dui.
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
          tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam . Donec sed odio dui.
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
      </div>
    </div>
    </div> <!-- /container -->
  </main>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />