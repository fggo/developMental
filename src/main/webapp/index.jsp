<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="WORKMAN" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="${home}" />
</jsp:include>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div class="" id="main-container">
      <div class="container py-5">
        <div class="card-columns">
          <h5>협업도구</h5>
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">card text</p>
              <p class="card-text"><small class="text-muted">updated 0 mins ago</small></p>
            </div>
          </div>

        </div>
        <hr>
        <div class="card-columns">
          <h5>구인 구직</h5>
          <div class="card text-center">
            <img src="${path }/resources/images/hire.jpg" class="card-img-top" alt="...">
            <div class="card-body py-0">
              <!-- <h5 class="card-title">Job list</h5> -->
              <!-- <p class="card-text">Card text.</p> -->
              <div>
                <small>해외 및 국내 구직정보 검색</small>
              </div>
              </footer>
              <a class="btn btn-sm btn-outline-dark my-1 stretched-link" href="javascript: ajaxJobPage('${path }/job/jobBoardList');">구인구직</a>
            </div>
          </div>
          <!-- <div class="card text-center">
            <img src="${path}/resources/images/apply.jpg" class="card-img-top" alt="...">
            <div class="card-body pb-0 pt-3">
              <h5 class="card-title">Dream Big</h5>
              <p class="card-text mb-0"><small class="text-muted">Apply for companies from all over the World&nbsp;&nbsp;<i class="fa fa-plane"></i></small></p>
              <a class="btn btn-sm btn-outline-dark my-2 stretched-link" href="javascript: ajaxJobPage('${path }/job/jobApplyList');">Apply</a>
            </div>
          </div> -->
        </div>
        <hr>
        <div class="card-columns">
          <h5>실시간 뉴스</h5>
          <div class="card p-3 text-right">
            <blockquote class="blockquote mb-0">
              <p>block quote here</p>
              <footer class="blockquote-footer">
                <small class="text-muted">
                  Some author <cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card p-3">
            <blockquote class="blockquote mb-0 card-body">
              <p>text here</p>
              <footer class="blockquote-footer">
                <small class="text-muted">
                  Some author <cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card p-3">
            <img src="${path}/resources/images/wallpaper.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Card text.</p>
              <p class="card-text"><small class="text-muted">updated 0 min ago</small></p>
            </div>
          </div>
          <div class="card bg-primary text-white text-center p-3">
            <blockquote class="blockquote mb-0">
              <p class="text-white">quote text here</p>
              <footer class="blockquote-footer text-white">
                <small>
                  Some author<cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card p-3 text-center">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">card text here</p>
              <p class="card-text"><small class="text-muted">updated 0 mins ago</small></p>
            </div>
          </div>
        </div>
      </div>
    <script>
      $(function(){
        var $apiLoading = $('.apiLoading').hide();
        $(document)
        .ajaxStart(function () {
          $apiLoading.show();
        })
        .ajaxStop(function () {
          $apiLoading.hide();
        });
      });
    </script>

    </div>
  </main>

</div>


</div> <!-- row -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
