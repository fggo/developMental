<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Content" />
</jsp:include>

  <style>
  </style>

  <div class="modal-content" id="jobmodal-content">

    <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel" id="jobmodalTitle"><img src="${path }/resources/images/icons8-open-box-48.png" class="" alt="">&nbsp;<strong>Job Description </strong>${title}</h4>
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
    </div>

    <div class="modal-body container" id="jobmodal-body">

      <div class="row container">
        <table class="pull-left col-md-8">
          <tbody>
            <tr>
              <td class="h6"><strong>NO.</strong></td>
              <td class="h5"><input type="text" name="no" id="no" class="form-control" value="${jobBoard.no}" readonly /></td>
            </tr>
            <tr>
              <td class="h6"><strong>Writer</strong></td>
              <td class="h5">
                <input type="text" name="writer" class="form-control" value="${jobBoard.writer}" readonly />
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Title</strong></td>
              <td class="h5">
                <input class="form-control" name="title" value="${jobBoard.title}" readonly />
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Reg. Date</strong></td>
              <td class="h5">
                <input type="text" name="regDate" class="form-control" value="${jobBoard.regDate}" readonly />
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Count</strong></td>
              <td class="h5">
                <input type="text" name="count" class="form-control" value="${jobBoard.count}" readonly />
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Status</strong></td>
              <td class="h5">
                <input type="text" name="status" class="form-control" value="${jobBoard.status}" readonly />
              </td>
            </tr> 
          </tbody>
        </table>
        <div class="col-md-4 container justify-content-center align-content-center"> 
          <c:choose>
            <c:when test='${imageURL != null}'>
              <img src="${imageURL}" class="img-fluid" alt="">
            </c:when>
            <c:otherwise>
              <img src="${path}/resources/images/icons8-broken-robot-48.png" class="img-fluid" alt="">
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <!-- <p class="open_info hide">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p> -->
      <div>
        <h6><strong>Content</strong></h6>
        <textarea class="form-control h-50" rows='10' name="content" readonly>${jobBoard.content}</textarea>

      </div>
    </div>

    <div class="modal-footer">
      <div class="text-right pull-right col-md-3">
        Employee<br/> 
        <span class="h3 text-muted"><strong> 77 </strong></span></span> 
      </div> 
      <div class="text-right pull-right col-md-3">
        Avg. Salary <br/> 
        <span class="h3 text-muted"><strong>$30,000</strong></span>
      </div>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      <button type="button" class="btn btn-primary">Apply Now</button>
    </div>

  </div>
  <script>
    $(function(){
      $('img').attr("")
    });
  </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />