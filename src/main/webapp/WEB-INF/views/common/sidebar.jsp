<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <style>
    #main-wrapper{
      margin-left: 190px;
      margin-top: 58px;
    }
    @media (min-width: 576px) {
      .card-columns {
        column-count: 2;
      }
    }
    @media (min-width: 768px) {
      .card-columns {
        column-count: 3;
      }
    }
    @media (min-width: 992px) {
      .card-columns {
        column-count: 3;
      }
    }
    @media (min-width: 1200px) {
      .card-columns {
        column-count: 4;
      }
    }
  </style>

  <!-- CSS -->
  <link rel="stylesheet" href="${path}/resources/css/jobEnroll.css">
  <link rel="stylesheet" href="${path}/resources/css/sidebar.css">
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
  <!-- Sidebar  -->
  <div class="d-flex">
    <nav id="sidebar" class="p-0 flex-shrink-1">
      <div class="sidebar-header">
        <c:if test="${param.pageTitle == ''}">
          <h3><a href="${path }/"><i class="fa fa-home"></i></a></h3>
        </c:if>
        <c:if test="${param.pageTitle != ''}">
          <h3><a href="${path }/">${ param.pageTitle }</a></h3>
        </c:if>
      </div>
      <ul class="list-unstyled components">
        <p class="p-2"><i class="fa fa-tag" aria-hidden="true">&nbsp;&nbsp;메뉴</i></p>
        <!-- <hr style="border-top: 1px solid white;"> -->
        <hr>

        <li class="active">
          <a href="#myPageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">마이페이지</a>
          <ul class="collapse list-unstyled" id="myPageSubmenu">
            <li>
              <a href="javascript: ajaxJobPage('${path }/member/setting.do');" id="jobBoardBtn">개인정보수정</a>
            </li>
            <li>
              <a href="javascript: ajaxJobPage('${path }/job/jobApplyList');" id="jobApplyBtn">마이게시판</a>
            </li>
          </ul>
        </li>

        <li class="active">
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">구인</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="javascript: ajaxJobPage('${path }/job/jobBoardList');" id="jobBoardBtn">구인게시판</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Study</a>
           <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
            	<a href='${path }/study/studyList'>Board</a>
            </li>
            <li>
             <a href='${path }/study/studyApplyList'>Apply</a>
            </li>
          </ul>
           </li>
      </ul>
  
      <!-- <ul class="list-unstyled CTAs">
        <li>
          <a href="#" class="download">Dummy Btn1</a>
        </li>
        <li>
          <a href="#" class="article">Dummy Btn2</a>
        </li>
      </ul> -->
    </nav>


  <script>
    function ajaxJobPage(mapping){
      $.ajax({
        type: "POST",
        url:mapping,
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
    function ajaxJobBoardPagination(mapping){
      $.ajax({
        type: "POST",
        url:mapping,
        dataType: "html",
        success: function(data){
          html = $('<div>').html(data);
          $('#databaseJobBoardList').html(html.find('.jobmodal-tbl1'));
          $('#pageBar').html(html.find('#pageBar'));

        },
        error: function(status, msg){
          alert('ajax error!');
        },
      });
    }
  </script>