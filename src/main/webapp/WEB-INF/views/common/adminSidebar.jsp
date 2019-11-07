<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <!-- Custom CSS -->
  <link rel="stylesheet" href="${path }/resources/css/sidebar.css">
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

  <!-- Sidebar  -->
  <div class="d-flex">
    <nav id="sidebar" class="p-0 flex-shrink-1">
      <div class="sidebar-header">
        <h3><a href="${path }/admin/adminMain">Admin Menu</a></h3>
      </div>
  
        <p>Menus</p><!-- 안되면 위치 두칸아래로 -->
      <ul class="list-unstyled components">
        
        <li class="active">
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Management</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="${path }/admin/selectMemberList.do" id="">Member</a>
            </li>
            <li>
              <a href="${path }/admin/adminBoard" id="">Board</a>
            </li>
          </ul>
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Notice</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="${path }/admin/noticeList" id="">Notice List</a>
            </li>
            <li>
              <a href="${path }/admin/noticeForm" id="">Notice Registration</a>
            </li>
          </ul>
        </li>
      </ul>
  
      <ul class="list-unstyled CTAs">
        <li>
          <a href="#" class="download">Dummy Btn1</a>
        </li>
        <li>
          <a href="#" class="article">Dummy Btn2</a>
        </li>
      </ul>
    </nav>
  </div>


