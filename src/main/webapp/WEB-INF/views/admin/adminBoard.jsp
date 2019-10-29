<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Job - Board" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>

  <style>
    .container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }
    #main-container {
    	margin-top: 50px;
    	margin-left: 240px;
    }
  </style>

  <!-- CSS -->

  <div class="py-4 col-lg-10 container submenu-container" id ="main-container">

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
          <div class="media-body pl-3 my-0 py-0">
            <h3 class="card-title">Job list</h3>
            <h6 class="card-subtitle text-muted">Total of <b>0</b> listings</h6>
            <p class="card-text">
              <small>You have applied<b id="jobNum"></b>&nbsp; jobs.</small>
            </p>
          </div>
          <div class="row d-flex mt-5">
          </div>
        </div>
        <!-- form -->
        <table class="table table-sm" id='qna_table' style="font-size:14px;">
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
                <td class="text-center">
                  <a href="javascript: ajaxJobBoardContent();">${j['TITLE']}</a>
                </td>
                <td><c:out value="${fn:substring(j['CONTENT'], 0, 50)}" /></td>
                <td class="text-center">${j['REGDATE']}</td>
                <td class="text-center">${j['COUNT']}</td>
                <td class="text-center">${j['STATUS']}</td>
                <td class="text-center">${j['APPLICANTS']}</td>
                <script>
                  function ajaxJobBoardContent(){
                    $.ajax({
                      type: "POST",
                      url: "${path }/job/jobBoardContent",
                      dataType: "html",
                      data: {"no": "${j.no}"},
                      success: function(data){
                        console.log(data);
                        var html = $('<div>').html(data);
                        $('div#main-container').html(html.find('div.submenu-container'));
                      },
                      error: function (data) { // 데이터 통신에 실패
                        console.log("JSON data failed to retrieve!");
                      }
                    });
                  }
                </script>
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
    <!-- bootstrap Modal : Job content -->
    <!-- <button id="modal-trigger" data-buttonTitle="Open Modal">Open Modal</button> -->
    <div id="modal">
      <div id="content">I'm a modal. Drag me around.</div>
      <div id="background"></div>
    </div>
    <div class="modal fade" id="jobModal" tabindex="-1" role="dialog" aria-labelledby="jobModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="jobModalLabel">New message</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="recipient-name" class="col-form-label">Recipient:</label>
                <input type="text" class="form-control" id="recipient-name">
              </div>
              <div class="form-group">
                <label for="message-text" class="col-form-label">Message:</label>
                <textarea class="form-control" id="message-text"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Send message</button>
          </div>
        </div>
      </div>
    </div>
    <style>
      #jobModal {
        position: relative;
      }

      .modal-dialog {
        position: fixed;
        width: 100%;
        margin: 0;
        padding: 10px;
      }

    </style>
    <!-- jQuery -->
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
      integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
      crossorigin="anonymous"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script>
      $(function(){
        $('#modal-trigger').click(function(){
          $('#jobModal').modal('show');
          $('#modal').modal('show');
        });
        $('#modalBtn').click(function() {
          // reset modal if it isn't visible
          if (!($('.modal.in').length)) {
            $('.modal-dialog').css({
              top: '50%',
              left: '50%'
            });
          }
          $('#jobModal').modal({
            backdrop: false,
            show: true
          });

          $('.modal-dialog').draggable({
            handle: ".modal-content"
          });
        });
      });

      function ajaxJobPage(urlMapping){
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
    </script>

    <!-- <script src="${path }/resources/js/jobmodal.js"></script> -->
    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#jobModal" data-whatever="@fat">Open modal for @fat</button> -->

    <button type="button" class="btn btn-primary" id="modalBtn">@fat modal</button>

  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
