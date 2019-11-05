<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>


<script>
	$(function(){
		$('[name=upFile]').on('change',function(){
			var fileName=this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		});
	});

</script>
<style>
    #notice-container {
    	margin-top:130px;
    	margin-left:20%;
    	margin-right:10%;
    }
    
</style>
<div id="content">
	<div id="notice-container">
        <form name="noticeFrm" action="${path}/admin/noticeFormEnd.do" method="post" enctype="multipart/form-data" >
            <input type="text" class="form-control" placeholder="제목" name="noticeTitle" id="noticeTitle" required>
            <input type="text" class="form-control" name="noticeWriter" value="admin" readonly required>
            <div class="input-group mb-3" style="padding:0px;">
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일1</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
                </div>
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일2</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
                    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
                </div>
            </div>
            <textarea class="form-control" name="noticeContent" placeholder="내용" required></textarea>
            <br />
            <input type="submit" class="btn btn-outline-success" value="저장" >
        </form>
    </div>
</div>
	
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>