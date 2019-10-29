<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Job - Board" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>

  <style>
    .container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }
    .modal {
      text-align: center;
    }

    @media screen and (min-width: 768px) { 
      .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }


  </style>

  <!-- CSS -->

  <div class="py-4 col-lg-10 container submenu-container">

    <div class="card card-fluid" id="job-listings">

      <h6 class="card-header">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
          <i class="fa fa-briefcase text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;Job Board</p>
            <small>Since 2019.10</small>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body d-flex pl-3 my-0 py-0">
            <div class="">
              <h3 class="card-title">Job list</h3>
              <h6 class="card-subtitle text-muted">Total of <b>0</b> listings</h6>
              <!-- search form -->
              <div id="apiCallFrm" class="form form form-inline" >
                <input type="text" class="form-control form-control-sm" placeholder="Skill Keyword" id="skillTxt" required />
                <input type="text" class="form-control form-control-sm mx-2" placeholder="Location" id="locTxt" required />
                <button type="button" class="btn btn-outline-light text-dark border-dark" id="apiCallBtn" value="Search github">
                  <i class="fa fa-github" aria-hidden="true"></i>&nbsp;Call API data
                </button>

              </div>
            </div>
            <div class="ml-auto">
              <a class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary" href="javascript: ajaxJobPage('${path}/job/jobEnroll');">Write</a>
            </div>

          </div>
        </div>
        <table class="table table-sm table-hover jobmodal-tbl2" style="font-size:14px;">
          <c:if test="${newList == null}">
            <div class="container card my-1 py-2 text-center"><i>No Github Job List! Please type keyword and location.</i></div>
          </c:if>
          <c:if test="${newList != null}">
            <thead>
              <tr>
                <th class="text-center">Logo</th>
                <th class="text-center">Company</th>
                <th class="text-center">Title</th>
                <th class="text-center">Content</th>
                <th class="text-center">RegDate</th>
                <th class="text-center">Count</th>
                <!-- <th class="text-center">Status</th> -->
                <th class="text-center">
                  <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" alt="">
                </th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="j" items="${newList}" varStatus="status">
                <tr class="table-info">
                  <td class="text-center">
                    <c:if test="${fn:substring(j['imageURL'],2,6) =='path'}" >
                      <img src="${path}${j['imageURL']}" class="img-fluid" alt="">
                    </c:if>
                    <img src="${j['imageURL']}" class="imageURL img-fluid" alt="">
                  </td>
                  <td class="text-center">${j['WRITER']}</td>
                  <td class="text-center job-title">${j['TITLE']}</td>
                  <td class="hide-html-tag">${j['CONTENT']}</td>
                  <!-- <td class="text-center"><fmt:formatDate value="${j['REGDATE']}" pattern="yy-MM-dd" /></td> -->
                  <td class="text-center">${j['REGDATE']}</td>
                  <td class="text-center">${j['COUNT']}</td>
                  <!-- <td class="text-center">${j['STATUS']}</td> -->
                  <td class="text-center">${j['APPLICANTS']}</td>
                </tr>
              </c:forEach>
            </tbody>
          </c:if>
        </table>
        <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
          <thead>
            <tr>
              <th class="text-center">NO.</th>
              <th class="text-center">Writer</th>
              <th class="text-center">Title</th>
              <th class="text-center">Content</th>
              <th class="text-center">RegDate</th>
              <th class="text-center">Count</th>
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
                <td class="text-center">${j['NO']}</td>
                <td class="text-center">${j['WRITER']}</td>
                <td class="text-center job-title">${j['TITLE']}</td>
                <td>${j['CONTENT']}</td>
                <!-- <td class="text-center"><fmt:formatDate value="${j['REGDATE']}" pattern="yy-MM-dd" /></td> -->
                <td class="text-center">${j['REGDATE']}</td>

                <td class="text-center">${j['COUNT']}</td>
                <!-- <td class="text-center">${j['STATUS']}</td> -->
                <td class="text-center">${j['APPLICANTS']}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <small class="d-block text-right mt-3"><a href="#">All updates</a></small>
        <nav aria-label="Page navigation example">
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
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      </div>
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
        $('td.hide-html-tag *').css({
          'display': 'none',
        })

        $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
        $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

        $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

          ajaxGithubJobContent($(this));

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

          ajaxGithubJobContent($(this));

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
              console.log("success!");
              html = $('<div>').html(data);
              $('#main-container').html(html.find('div.submenu-container'));
            },
            error: function(status, error) {
              alert("ajax api parameter call Error!");
            }
          });
        });


      });


      function ajaxJobPage(urlMapping, data){
        $.ajax({
          type: "POST",
          url: urlMapping,
          dataType: "html",
          success: function(data){
            html = $('<div>').html(data);
            $('#main-container').html(html.find('div.submenu-container'));
          },
          error: function(status, msg){
            alert('ajax error!');
          },
        });
      }

      function ajaxGithubJobContent(tr){
        var githubData = {};
        var no,writer,title,content,regDate,count,status,applicants;
        tr.each(function (i, el) {
          var tds = $(this).find('td');

          githubData = {};

          githubData["no"]= (tds.eq(0).text()).trim() ==""? 0:no;
          githubData["writer"]= tds.eq(1).text();
          githubData["title"]= tds.eq(2).text();
          githubData["content"]= tds.eq(3).text();
          // githubData["regDate"]= new Date(tds.eq(4).text());
          githubData["count"]= tds.eq(5).text();
          githubData["status"]= tds.eq(6).text();
          githubData["applicants"]= tds.eq(7).text();
          githubData["imageURL"]= tds.eq(0).find('img.imageURL').attr("src");
        });

        console.log(githubData);

        $.ajax({
          type: "POST",
          url: "${path }/job/jobContentView.do",
          dataType: "html",
          data: githubData,
          success: function(data){
            var html = $('<div>').html(data);
            $('.modal-dialog').html(html.find('#jobmodal-content'));
          },
          error: function (data) { // 데이터 통신에 실패
            alert("JSON data failed to retrieve!");
          }
        });
      }
    </script>

  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
