<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="pageTitle" value="Homepage" />
  </jsp:include>

  <!-- Main page cover -->
  <main role="main">
    <div class="jumbotron bg-dark text-white" id="cover-section">
      <div class="container">
        <h1 class="">Join Us!</h1>
        <p>Simple description</p>
        <p><a class="btn btn-primary" href="${path }/mainView" role="button">Learn more &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>detail 1</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
          <h2>detail 2</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
        <div class="col-md-4">
          <h2>detail 3</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></a></p>
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

  </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />