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
            <small>Since 2019.09</small>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body d-flex pl-3 my-0 py-0">
            <div>
              <h3 class="card-title">Job list</h3>
              <h6 class="card-subtitle text-muted">Total of <b>0</b> listings</h6>
            </div>

            <button class="ml-auto mr-3 align-self-center btn btn-outline-primary" onclick="ajaxJobPage('${path}/job/postJob.do');">Write</button>
          </div>
        </div>
        <!-- form -->
        <table class="table table-hover" id='jobmodal-tbl' style="font-size:14px;">
          <thead>
            <tr>
              <th class="text-center">NO.</th>
              <th class="text-center">Writer</th>
              <th class="text-center">Title</th>
              <th class="text-center">Content</th>
              <th class="text-center">RegDate</th>
              <th class="text-center">Count</th>
              <th class="text-center">Status</th>
              <th class="text-center">Applicants</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="j" items="${list}" varStatus="status">
              <tr>
                <td class="text-center">${j['NO']}</td>
                <td class="text-center">${j['WRITER']}</td>
                <td class="text-center job-title">${j['TITLE']}</td>
                <td><c:out value="${fn:substring(j['CONTENT'], 0, 50)}" /></td>
                <td class="text-center">${j['REGDATE']}</td>
                <td class="text-center">${j['COUNT']}</td>
                <td class="text-center">${j['STATUS']}</td>
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

        $('#jobmodal-tbl tbody tr').css({
          'cursor': 'pointer',
        });

        $('table#jobmodal-tbl > tbody  > tr').on('click', function() {
          console.log($(this).children().first().html());
          ajaxJobBoardContent($(this).children().first().html());

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

      function ajaxJobBoardContent(no){
        $.ajax({
          type: "POST",
          url: "${path }/job/jobBoardContent.do",
          dataType: "html",
          data: {"no": no},
          success: function(data){
            var html = $('<div>').html(data);
            $('.modal-dialog').html(html.find('#jobmodal-content'));
          },
          error: function (data) { // 데이터 통신에 실패
            console.log("JSON data failed to retrieve!");
          }
        });
      }
    </script>

    <!-- <script src="${path }/resources/js/jobmodal.js"></script> -->
    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#jobmodal" data-whatever="@fat">Open modal for @fat</button> -->
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
