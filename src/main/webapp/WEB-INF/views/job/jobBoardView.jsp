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

  <div class="py-4 container submenu-container">

    <div class="card card-fluid">

      <h6 class="card-header">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
          <!-- <img class="mr-3" src="" alt="" width="48" height="48"> -->
          <!-- <img src="<%=request.getContextPath() %>/images/qna.png" class="mr-3" width="60px"> -->
          <i class="fa fa-edit text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;Job Board</p>
            <small>Since 2019.09</small>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <!-- .media -->
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
            </tr>
          </thead>
          <tbody>
            
            <script>
            </script>
            <c:forEach var="j" items="${jobBoardList}" varStatus="status">
            <tr>
              <td class="text-center">${j.no } </td>
              <td class="text-center">${j.writer } </td>
              <td class="text-center">
                <a href="${path }/job/jobBoardContent?no=${j.no}">${j.title }</a>
              </td>
              <td>${fn:substring(j.content, 0, 50)}</td>
              <td class="text-center">${j.regDate } </td>
              <td class="text-center">${j.count } </td>
              <td class="text-center">${j.status } </td>
              <script>
                function ajaxjobBoardContent(){
                  $.ajax({
                    type: "POST",
                    url: "${path }/job/jobBoardContent",
                    dataType: "html",
                    data: {"no": "${j.no}"},
                    success: function(data){
                      var html = $('<div>').html(data);
                      $('div#mypage-container').html(html.find('section#subMenu-container'));
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
            <ul class="pagination justify-content-center">
              ${pageBar}
            </ul>
          </nav>

        </div>
      </div>
    </div>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
