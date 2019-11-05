<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Content" />
</jsp:include>

  <div class="modal-content" id="jobmodal-content">
    <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel" id="jobmodalTitle"><img src="${path }/resources/images/icons8-open-box-48.png" class="" alt="">&nbsp;<strong>구인글 상세</strong>${title}</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
    </div>

    <div class="modal-body container" id="jobmodal-body">
      <form action="${path}/job/jobApply" id="applyFrm" method="get">
        <div class="row container">
          <table class="pull-left col-md-8 bg-transparent">
            <tbody>
              <tr>
                <td class="h6"><strong>번호</strong></td>
                <td class="h5"><input type="text" name="no" id="no" class="form-control" value="${jobBoard.no}" readonly /></td>
              </tr>
              <tr>
                <td class="h6"><strong>회사명</strong></td>
                <td class="h5">
                  <input type="text" name="writer" class="form-control" value="${jobBoard.writer}" readonly />
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>제목</strong></td>
                <td class="h5">
                  <input class="form-control" name="title" value="${jobBoard.title}" readonly />
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>등록일</strong></td>
                <td class="h5">
                  <!-- <input type="date" name="regDate" class="form-control" value="${jobBoard.regDate}" readonly /> -->
                </td>
              </tr> 
            </tbody>
          </table>
          <div class="col-md-4 container card justify-content-center align-content-center">
            <c:choose>
              <c:when test='${imageURL != null}'>
                <img src="${imageURL}" class="img-fluid" id="companyLogo" alt="">
              </c:when>
              <c:otherwise>
                <img src="${path}/resources/images/noimage.png" id="companyLogo" class="img-fluid" alt="">
              </c:otherwise>
            </c:choose>
            <input type="hidden" id="imageURL" name="imageURL" value="" />
          </div>
        </div>

        <hr>
        <div>
          <h6><strong>내용</strong></h6>
          <textarea class="form-control h-50" rows='10' name="content" readonly>${jobBoard.content}</textarea>
        </div>
        <hr>
        <div class="text-center">
          <c:if test="${loginMember !=null}">
            <button type="submit" class="btn btn-primary ml-auto" id="applyBtn">지원하기</button>
          </c:if>
          <c:if test="${loginMember ==null}">
            <button type="button" class="btn btn-secondary disabled" id="applyBtn">지원하기</button>
          </c:if>
        </div>
      </form>
    </div>
      
    <!-- <div class="modal-footer">
      <div class="text-right pull-right col-md-3">Employee<br/> 
        <span class="h3 text-muted"><strong> 77 </strong></span>
      </div> 
      <div class="text-right pull-right col-md-3">
        Avg. Salary <br/> 
        <span class="h3 text-muted"><strong>$30,000</strong></span>
      </div>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div> -->
  </div>


  <script>
    $(function(){
      alert($('#companyLogo').attr('src'));
      $('input#imageURL').attr({
        'value': $('#companyLogo').attr('src'),
      });

      $('#applyBtn').click(function(e) {
        e.preventDefault();
        alert("ajax");

        $.ajax({
          type: "POST",
          url:"${path}/job/applyJob.do",
          dataType: "html",
          success: function(data){
            html = $('<div>').html(data);

            $('#jobmodal-content').html(html.find('.submenu-container'));
          },
          error: function(status, msg){
            alert('ajax error!');
          },
        });

      });

    });
  </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />