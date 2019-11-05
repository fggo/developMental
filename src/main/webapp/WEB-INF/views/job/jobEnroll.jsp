<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인글 등록" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인글 등록" />
</jsp:include>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div id="main-container">
      <div class="container py-5 submenu-container">

        <!-- For demo purpose -->
        <div class="row mb-4">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="">구인글 등록</h2>
            <p class="lead mb-0">
            </p>
          </div>
        </div>
        <!-- End -->

        <div class="row">
          <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-sm px-5 py-3">

              <!-- form content -->
              <div class="tab-content">

                <!-- applicants info-->
                <div id="nav-tab-card" class="tab-pane fade show active">
                  <!-- <p class="alert alert-success">Some text success or error</p> -->
                  <form action="${path}/job/jobEnrollEnd.do" method="post" enctype="multipart/form-data">
                    <!-- companyLogo -->
                    <div class="form-group my-0">
                      <div class="companyLogo-wrapper my-0 mx-auto">
                        <c:if test="${jobBoardFile.newName != null}">
                          <img class="logo-pic" src="${path}/upload/job/${jobBoardFile.newName}" />
                        </c:if>
                        <c:if test="${jobBoardFile.newName == null}">
                          <img class="logo-pic" src="" />
                        </c:if>
                        <div class="upload-button">
                          <i class="fa fa-camera" aria-hidden="true"></i>
                        </div>
                        <input class="file-upload form-control" type="file" accept="image/*" name="orgNames" />
                      </div>
                    </div>
                    <!-- /companyLogo -->

                    <div class="form-group my-0">
                      <label for="writer" class="fa fa-building-o">&nbsp;&nbsp;</label>회사명
                      <c:if test="${loginMember != null}">
                        <input type="text" class="form-control text-primary" name="writer" value="${loginMember.nickname}" readonly required />
                      </c:if>
                    </div>
                    <div class="form-group">
                      <label for="title">구인글 제목</label>
                      <input type="text" name="title" placeholder="title..." required class="form-control">
                    </div>
                    <!-- content -->
                    <hr>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group my-0">
                          <label for="jobType">Ⅰ. 직업 타입</label>
                          <select name="jobType" id="jobType" class="form-control" required>
                            <option value="Full Time">정규직</option>
                            <option value="Part Time">Part Time</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group my-0">
                          <label for="location">Ⅱ. 회사위치</label>
                          <textarea name="location" placeholder="address..." required class="form-control" rows="2" style="resize:none"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="form-group my-0">
                      <label for="description">Ⅲ. 요구조건</label>
                      <textarea name="description" placeholder="describe..." required class="form-control" rows="5" style="resize:none"></textarea>
                    </div>
                    <div class="form-group my-0">
                      <label for="howToApply">Ⅳ. 지원방법</label>
                      <textarea name="howToApply" placeholder="how to apply...?" required class="form-control" row="2" style="resize:none"></textarea>
                    </div>
                    <hr>
                    <!-- /content end -->
                    <input type="submit" class="subscribe btn btn-outline-dark btn-block rounded-lg shadow-sm" value="제출하기" />
                  </form>
                </div>
                <!-- End -->

              </div>
              <!-- End -->

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

          // logo image
          var readURL = function(input) {
            if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                $('.logo-pic').attr('src', e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
            }
          }

          $(".file-upload").on('change', function(){
            readURL(this);
          });
          $(".upload-button").on('click', function() {
            $(".file-upload").click();
          });
          
          // $("[name='upFile']").on('change', function(){
          //   var fileName = this.files[0].name;
          //   $(this).next('.custom-file-label').html(fileName);
          // });
          $('[data-toggle="tooltip"]').tooltip()
        });
      </script>

    </div>
  </main>

</div>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
