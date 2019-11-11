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

    <style>
      .card-thumbnail {
        position:relative;
        overflow:hidden;
      }
      .card-caption {
        position:absolute;
        top:0;
        right:0;
        background:rgba(0, 123, 255, 0.75);
        width:100%;
        height:100%;
        padding:2%;
        display: none;
        text-align:center;
        color:#fff !important;
        z-index:2;
      }
    </style>
    <script>
      $(function() {
        $("[rel='tooltip']").tooltip();    
        $('.thumbnail').hover(
          function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
          },
          function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
          }
        ); 
      });
    </script>

    <div class="" id="main-container">
      <div class="container py-5">
        <div class="card-columns">
          <h5>협업 도구</h5>
          <div class="card text-center">
            <div class="thumbnail card-thumbnail" >
              <div class="caption card-caption" style="background:rgba(224, 134, 16, 0.75);">
                <blockquote class="blockquote">
                  <c:if test="${loginMember != null}">
                    <a class="text-white stretched-link my-2"
                      href="${path}/collabo/main?userId=${loginMember.id}"
                      style="text-decoration: none;" ><b><br><br>협업 게시판</b>
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <a class="text-white stretched-link my-2"
                      href="javascript:;" id="collaboLoginBtn"
                      style="text-decoration: none;"><b><br><br>협업 게시판</b>
                    </a>
                  </c:if>
                  <footer class="blockquote-footer text-white">
                    <small>powered by <cite title="Source Title">junyoung</cite></small>
                  </footer>
                </blockquote>
              </div>
              <img src="${path }/resources/images/teamwork.png" class="card-img-top" width="180px" height="180px" alt="...">
            </div>
          </div>
          <!-- /collabo/main -->

        </div>
        <hr>

        <div class="card-columns">
          <h5>구인 구직</h5>
          <div class="card text-center">
            <div class="thumbnail card-thumbnail">
              <div class="caption card-caption">
                <blockquote class="blockquote">
                  <c:if test="${loginMember != null}">
                    <a class="text-white stretched-link my-2"
                      href="javascript: ajaxJobPage('${path}/job/jobBoardList');"
                      style="text-decoration: none;"><b><br>채용 게시판</b>
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <a class="text-white stretched-link my-2"
                      href="javascript:;" id="jobLoginBtn"
                      style="text-decoration: none;"><b><br><br>채용 게시판</b>
                    </a>
                  </c:if>
                  <footer class="blockquote-footer text-white">
                    <small>powered by <cite title="Source Title">junho <br> & 사람인 & github</cite></small>
                  </footer>
                </blockquote>
              </div>
              <img src="${path }/resources/images/hire.jpg" class="card-img-top" alt="...">
            </div>
          </div>
        </div>
        <hr>

        <div class="card-columns">
          <h5>스터디모임</h5>
          <div class="card text-center">
            <div class="thumbnail card-thumbnail">
            <div class="caption card-caption" style="background:rgba(68, 173, 23, 0.75);">
                <blockquote class="blockquote">
                  <c:if test="${loginMember != null}">
                    <a class="text-white stretched-link my-2"
                      href="javascript: ajaxJobPage('${path}/study/studyList');"
                      style="text-decoration: none;"><b><br><br>게시판</b>
                  </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <a class="text-white stretched-link my-2"
                      href="javascript:;" id="studyLoginBtn"
                      style="text-decoration: none;"><b><br><br>게시판</b>
                    </a>
                  </c:if>
                  <footer class="blockquote-footer text-white">
                    <small>powered by <cite title="Source Title">hojun</cite></small>
                  </footer>
                </blockquote>
              </div>
              <img src="${path }/resources/images/icons8-book-64.png" class="card-img-top" width="180px" height="180px" alt="...">
            </div>
          </div>
        </div>
        <hr>
        <div class="card-columns">
          <h5>실시간 뉴스</h5>
        </div>
      </div>
    <script>
      $(function(){

        $('#collaboLoginBtn, #jobLoginBtn, #studyLoginBtn').click(function(){
          $("#loginModal").modal('show');
        })

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
