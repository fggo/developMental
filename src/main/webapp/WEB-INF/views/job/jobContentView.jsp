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
      <h4 class="modal-title" id="myModalLabel" id="jobmodalTitle">
        <img src="${path }/resources/images/icons8-open-box-48.png" class="" alt="">&nbsp;
        <strong></strong>${jobBoard.title}
      </h4>
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        <i class="text-danger fa fa-times"></i>
      </button>
    </div>

    <div class="modal-body" id="jobmodal-body">
      <form action="${path}/job/jobApply" id="applyFrm" method="get" class="form">
        <div class="container row">
          <div class="col-md-8 bg-transparent">
            <div class="form-inline form-group">
              <div class="col-md-3"><strong>번호</strong></div>
              <div class="col-md-9"><input type="text" name="no" id="no" class="form-control w-100" value="${jobBoard.no}" readonly />
              </div>
            </div>
            <div class="form-inline form-group">
              <div class="col-md-3"><strong>회사명</strong></div>
              <div class="col-md-9">
                <input type="text" name="writer" class="form-control w-100" value="${jobBoard.writer}" readonly />
              </div>
            </div> 
            <div class="form-inline form-group">
              <div class="col-md-3"><strong>제목</strong></div>
              <div class="col-md-9">
                <input class="form-control w-100" name="title" value="${jobBoard.title}" readonly />
              </div>
            </div> 
            <div class="form-inline form-group">
              <div class="col-md-3"><strong>등록일</strong></div>
              <div class="col-md-9">
                <input type="date" name="regDate" class="form-control w-100" value="${jobBoard.regDate}" readonly />
              </div>
            </div> 
          </div>
          <div class="col-md-4 card justify-content-center align-content-center">
            <c:choose>
              <c:when test='${imageURL != null}'>
                <div class="text-center">
                  <img src="${imageURL}" class="img-fluid" id="companyLogo" alt="">
                </div>
              </c:when>
              <c:otherwise>
                <img src="${path}/resources/images/noimage.png" id="companyLogo" class="img-fluid" alt="">
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <hr>
        <div class="container row form-inline form-group">
          <div class="">
            <strong>내용</strong>
          </div>
          <textarea class="form-control w-100 h-50" rows='10' name="content" readonly>${jobBoard.content}</textarea>
        </div>
        <hr>
        <div class="container row form-inline form-group justify-content-center text-center">
          <c:if test="${loginMember !=null}">
            <button type="submit" class="btn btn-lg btn-primary" id="applyBtn">지원하기</button>
          </c:if>
          <c:if test="${loginMember ==null}">
            <button type="button" class="btn btn-lg btn-secondary disabled" id="applyBtn">지원하기</button>
          </c:if>
          <button type="button" class="btn btn-lg btn-outline-danger ml-2" data-dismiss="modal" aria-hidden="true">
            취소
          </button>
        </div>

        <hr>
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