<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div id="main-container">
      <div class="py-4 col-lg-10 container submenu-container">

        <div class="card card-fluid" id="job-listings">

          <div class="card-header my-0 py-0 px-0">
            <!-- <a href="${path}"><img src="${path}/resources/images/home.png" alt=""></a> -->
            <div class="d-flex align-items-center p-3 my-0 text-white w-100 bg-dark rounded">
              <i class="fa fa-briefcase text-white mr-3 my-2" style="font-size:42px;"></i>
              <div class="lh-100 ml-2">
                <p class="h5 mb-0 text-white lh-100">구인구직 게시판</p>
                <small><i class="fa fa-asia"></i>국내/해외취업을 선택할 수 있습니다.</small>
              </div>
            </div>
          </div>

          <div class="card-body">
            <div class="media mb-2">
              <div class="media-body d-flex pl-3 my-0 py-0">
                <div class="">
                  <!-- search form -->
                  <div id="apiCallFrm" class="form form form-inline" >
                    <input type="text" class="form-control form-control-sm" placeholder="예. Java" id="skillTxt" required />
                    <input type="text" class="form-control form-control-sm mx-2" placeholder="예. Germany" id="locTxt" required />
                    <button type="button" class="btn btn-outline-light text-dark border-dark" id="apiCallBtn" value="Search github">
                      <i class="fa fa-github" aria-hidden="true"></i>&nbsp;해외취업 검색
                    </button>
                  </div>
                </div>
                <div class="ml-auto">
                  <c:if test="${loginMember !=null}">
                    <a class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary" href="${path}/job/jobEnroll">
                      <i class="fa fa-edit">&nbsp;</i>구인글 작성
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <button id="postJobBtn" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">
                      <i class="fa fa-edit"></i>구인글 작성
                    </button>
                  </c:if>
                </div>
                <script>
                  $('#postJobBtn').click(function(){
                    $("#loginModal").modal('show');
                  });
                </script>

              </div>
            </div>

            <div id="githubJobBoardList" class="rounded">
              <table class="table table-sm table-hover jobmodal-tbl2" style="font-size:14px;">
                <c:if test="${newList == null}">
                    <div class="m-0 p-0 w-100 text-center"><i class="text-muted">해외취업 리스트가 없습니다! 검색어를 입력해주세요.</i></div>
                </c:if>
                <c:if test="${newList != null}">
                  <thead>
                    <tr>
                      <th class="text-center" style="">API</th>
                      <th class="text-center">로고</th>
                      <th class="text-center">회사명</th>
                      <th class="text-center">제목</th>
                      <th class="text-center">글내용</th>
                      <th class="text-center">작성일</th>
                      <!-- <th class="text-center">Status</th> -->
                      <th class="text-center">
                      <img src="${path}/resources/images/icons8-queue-48.png" alt="">
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="j" items="${newList}" varStatus="status">
                      <tr class="table-secondary">
                        <td class="text-center" style="">${status.index+1}</td>
                        <td class="text-center">
                          <c:if test="${fn:substring(j['imageURL'],2,6) =='path'}">
                            <img src="${path}${j['imageURL']}" class="img-fluid" alt="">
                          </c:if>
                          <c:if test="${fn:substring(j['imageURL'],2,6) !='path'}" >
                            <img src="${j['imageURL']}" class="imageURL img-fluid" alt="">
                          </c:if>
                        </td>
                        <td class="text-center">${j['WRITER']}</td>
                        <td class="text-center job-title">${j['TITLE']}</td>
                        <%-- <td class="hide-html-tag " style="display:none;">${j['CONTENT']}</td> --%>
                        <%-- <td class="text-center"><fmt:formatDate value="${j['REGDATE']}" pattern="yy-MM-dd" /></td> --%>
                        <td class="text-center">${j['REGDATE']}</td>
                        <%-- <td class="text-center">${j['STATUS']}</td> --%>
                        <td class="text-center">${j['APPLICANTS']}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <script src="${path }/resources/js/jobListClick.js"></script>
                </c:if>
              </table>
            </div>
            <div id="databaseJobBoardList" class="my-3 rounded">
              <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                <thead>
                  <tr>
                    <th class="text-center">
                      <small><img src="${path}/resources/images/icons8-sql-32.png" alt="">번호</small>
                    </th>
                    <th class="text-center">로고</th>
                    <th class="text-center">회사명</th>
                    <th class="text-center">제목</th>
                    <!-- <th class="text-center">글내용</th> -->
                    <th class="text-center">작성일</th>
                    <!-- <th class="text-center">Status</th> -->
                    <th class="text-center">
                      <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" alt="">
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="j" items="${list}" varStatus="status">
                    <tr class="">
                      <!-- job lists not registered(inserted) in the Workman's database-->
                      <td class="text-center">${j['no']}</td>
                      <td class="text-center">
                        <img src="${path}/resources/upload/job/${j['fileNewName']}" 
                          class="imageURL img-fluid" alt=""/>
                      </td>
                      <td class="text-center">${j['writer']}</td>
                      <td class="text-center job-title">${j['title']}</td>
                      <!-- <td>${j['content']}</td> -->
                      <%-- <td class="text-center"><fmt:formatDate value="${j['regDate']}" pattern="yy-MM-dd" /></td> --%>
                      <td class="text-center">${j['regDate']}</td>
      
                      <%-- <td class="text-center">${j['status']}</td> --%>
                      <td class="text-center">${j['applicants']}</td>
                    </tr>
                  </c:forEach>
                </tbody>
                <script src="${path }/resources/js/jobListClick.js"></script>
              </table>

            </div>
            <nav aria-label="Page navigation example" id="pageBar">
              <!-- <ul class="pagination justify-content-center"> -->
                ${pageBar}
              <!-- </ul> -->
            </nav>
          </div>
        </div>

        <style>
          td img {
            height: 10px;
            width: 50%;
            object-fit: cover;
          }
          td {
            max-width: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0px;
          }
          table { width:500px;table-layout:fixed; }
          table tr { height:1em;  }
          /* table tr {
            line-height: 25px;
            min-height: 25px;
            height: 25px;
          } */
          @media (max-width: 768px) { /* use the max to specify at each container level */
            .job-title {    
              width:100px;  /* adjust to desired wrapping */
              display:table;
              white-space: pre-wrap; /* css-3 */
              white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
              white-space: -pre-wrap; /* Opera 4-6 */
              white-space: -o-pre-wrap; /* Opera 7 */
              word-wrap: break-word; /* Internet Explorer 5.5+ */
            }
          }
          .modal-content{
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;

            -moz-box-shadow: 2px 2px 2px #535353;
            -webkit-box-shadow: 2px 2px 2px #535353;
            box-shadow: 2px 2px 2px #535353;
          }
        </style>
        <!-- bootstrap Modal : Job content -->
        <!-- Modal -->
        <div class="modal fade" id="jobmodal" tabindex="-1" role="dialog" aria-labelledby="jobmodalTitle" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document"></div>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
          integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
          crossorigin="anonymous"></script>
        
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
          integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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


            $('td.hide-html-tag *').css({
              'display': 'none',
            })

            $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
            $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

            $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('.jobmodal-tbl2 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('#skillTxt, #locTxt').bind("enterKey",function(e){
              $('#apiCallBtn')[0].click();
            });
            $('#skillTxt, #locTxt').keyup(function(e){
              if(e.keyCode == 13) {
                $(this).trigger("enterKey");
              }
            });

            $('#apiCallBtn').click(function(){

              var apiParams = {
                "skill": $('#skillTxt').val(),
                "loc": $('#locTxt').val(),
              };

              if($('#skillTxt').val() =="" || $('#locTxt').val() =="") {
                alert("Fill out search fields!");
                return;
              }

              $.ajax({
                type: "POST",
                url: "${path}/job/jobBoardList",
                data: apiParams,
                dataType: "html",
                success: function(data) {
                  html = $('<div>').html(data);
                  // $('#main-container').html(html.find('div.submenu-container'));

                  $('#githubJobBoardList').html(html.find('.jobmodal-tbl2'));
                  // $('#pageBar').html(html.find('#pageBar'));
                },
                error: function(status, error) {
                  alert("ajax api parameter call Error!");
                }
              });
            });

          });

          function addRowEvent(tr){
            var githubData = {};
            var no,writer,title,content,regDate,count,status,applicants;
            tr.each(function (i, el) {
              var tds = $(this).find('td');

              githubData = {};

              console.log(tds.eq(0).text());
              console.log(tds.eq(0).text().trim());
              githubData["no"]= (tds.eq(0).text()).trim() ==""? 0:tds.eq(0).text().trim();
              githubData["imageURL"]= tds.eq(1).find('img.imageURL').attr("src");
              githubData["writer"]= tds.eq(2).text();
              githubData["title"]= tds.eq(3).text();
              // githubData["content"]= tds.eq(4).text();
              // githubData["regDate"]= new Date(tds.eq(4).text());
              // githubData["count"]= tds.eq().text();
              // githubData["status"]= tds.eq().text();
              githubData["applicants"]= tds.eq(5).text();
            });

            console.log(githubData);

            $.ajax({
              type: "POST",
              url: "${path }/job/jobContentView.do",
              dataType: "html",
              data: githubData,
              success: function(data){
                var html = $('<div>').html(data);
                $('#job-dialog').html(html.find('#jobmodal-content'));
              },
              error: function (data) { // 데이터 통신에 실패
                alert("JSON data failed to retrieve!");
              }
            });
          }
        </script>
      </div>
    </div>
  </main>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
