<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    div > #paging {
      text-align: center;
    }
     
    #container {
    	margin-left:250px;
    }
    #container > div > table > thead > tr > th {
    	text-align: center;
    	background-color:#6666ff;
    }
    
    .top {
    	caption-side: top;
    }
    th {
    	border: 1px solid #444444;
    }
    td {
    	text-align: center;
    	border: 1px solid #ffffff;
    }
	#notice-modal{
		width:800px;
	}
  </style>
  
  
  <div id="container">
    <div>
      <table class="table table-hover table-dark">
      <caption class=top><Strong>Notice List</Strong></caption>
        <thead>
          <tr>
            <th scope="col">No</th>
            <th scope="col">Title</th>
            <th scope="col">Writer</th>
            <th scope="col">Date</th>
            <th scope="col">ReadCnt</th>
            <th colspan="2">btn_sup</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list }" var="n" varStatus="s">
            <tr class="text-white">
              <td class="noticeNo">
              ${n.noticeNo }
              <input name="content" type="hidden" value="${n.noticeContent }"/>
              <c:forEach items="${attList }" var="a" varStatus="as">
              	<c:if test="${n.noticeNo == a.noticeNo }">
              		<input  name="renamedFileName" type="hidden" value="${a.renamedFileName }"/>
              	</c:if>
              </c:forEach>
              </td>
              <td class="noticeTitle">
              	<a href='${path }/admin/adminNoticeView.do?noticeNo=${n.noticeNo }'>
					<c:out value='${n.noticeTitle }'/>
				</a>
              </td>
              <td class="noticeWriter">${n.noticeWriter }</td>
              <td class="noticeDate">${n.noticeDate }</td>
              <td class="noticeReadcount">${n.noticeReadcount }</td>
			  <td>
				  <button type="button" name="btn_d" class="btn btn-outline-secondary" >삭제</button>
			  </td>
			  <td>
				  <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal">수정</button>
			  </td>
            <tr>
          </c:forEach>
        </tbody>
      </table>
      
      <!-- Paging 처리 -->
      <div id="paging">
      ${pageBar }
      </div>
    </div>
  </div>
  
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content" id="notice-modal">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Notice</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="row" style="height:600px;">
        	<table class="pull-left col-md-8">
         	 <tbody>
          	<tr>
             	<td class="h6"><strong>No : </strong></td> <td></td>
               <td class="h5">
               <input type="text" name="no" id="no" class="form-control" readonly />
               </td>
            </tr>
            <tr>
              <td class="h6"><strong>Title : </strong></td> <td></td>
              <td class="h5">
              <input type="text" name="title" id="title" class="form-control"  readonly /> 
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Writer : </strong></td> <td></td>
              <td class="h5">
              <input class="form-control" name="writer" id="writer" name="title"  readonly /> 
              </td>
            </tr>
            <tr>
              <td class="h6"><strong>Date : </strong></td> <td></td>
              <td class="h5">
                 <input type="text" name="date" id="date" class="form-control"  readonly /> 
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Content : </strong></td> <td></td>
              <td class="h5">
<!--                  <input type="textarea" name="content" id="content" class="form-control" rows="10" readonly />  -->
			  <textarea name="content" id="content" class="form-control" rows="5"></textarea>
              </td>
            </tr>
            <tr>
              <td class="h6"><strong>File : </strong></td> <td></td>
              <td class="h5">
              <input type="button" class="btn btn-outline-info" name="renamedFileName" id="renamedFileName" onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
              </td>
            </tr>
          </tbody>
        </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  </div>



<script>
// 파일다운
function fileDownload(oName, rName) {
	console.log("돌아는 가네");
//     oName=encodeURIComponent(oName);
//     location.href="${path}/board/filedownLoad.do?oName="+oName+"&rName="+rName;
 }

$("#myModal").on('show.bs.modal',function(e){
	var data=$(e.relatedTarget).parents("tr").children();
 	var noticeNo = parseInt($(e.relatedTarget).parents("tr").children('.noticeNo').text());
 	var title =  $(e.relatedTarget).parents("tr").children('.noticeTitle').text().trim();
 	var writer =  $(e.relatedTarget).parents("tr").children('.noticeWriter').text().trim();
 	var date =  $(e.relatedTarget).parents("tr").children('.noticeDate').text().trim();
 	var readCount =  $(e.relatedTarget).parents("tr").children('.noticeReadcount').text().trim();
 	
 	var content = $(e.relatedTarget).parents("tr").children('.noticeNo').children('input[name=content]').val();
 	var renamedFileName = $(e.relatedTarget).parents("tr").children('.noticeNo').children('input[name=renamedFileName]').val();
 	
 	console.log(renamedFileName);
 	
	$("#no").val(noticeNo);
	$("#content2").val(content);
	$("#content").val(content);
	$("#title").val(title);
	$("#writer").val(writer);
	$("#date").val(date);
	$("#readCount").val(readCount);
	$("#renamedFileName").val(renamedFileName);
	
});

$("button[name=btn_d]").click(function(){
	var tr = $(this).parent().parent();
	var td = tr.children();
	
	var noticeNo=td.eq(0).text();
	if(confirm("삭제된 정보는 복구되지 않습니다. 정말로 삭제합니까?")){
		location.href="${path}/admin/noticeDelete?noticeNo="+noticeNo;
	}
});

$("button[name=btn_u]").click(function(){
	var tr = $(this).parent().parent();
	var td = tr.children();
	
	var noticeNo=td.eq(1).text();
	if(confirm("공지사항을 수정합니다.")){
		location.href="${path}/admin/noticeUpdate?noticeNo="+noticeNo;
	}
	
});

</script>