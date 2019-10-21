<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${ param.pageTitle }</title>
  
  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path }/resources/css/header.css">

</head>
<body>
  <header>
    <!-- icon8 images links -->
    <!-- <a target="_blank" href="https://icons8.com/icons/set/sphere">Sphere</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a> -->

    <!-- Navigation bar -->
    <nav class="site-header navbar navbar-expand-md navbar-dark fixed-top py-0 justify-content-center">
      <!-- d-flex container -->
      <div class="container d-flex justify-content-center row">
        <!-- Logo -->
        <div class='py-0 mr-auto inline px-0' id="navbar-logo">
          <a class="navbar-brand" href="${path }/" >
            <img src="${path }/resources/images/icons8-sphere-48.png">
          </a>
        </div>
        <!-- Nav search bar -->
        <div id="nav-searchbar" class="col-lg-6 py-0 inline-block px-0 ml-0 mr-1">
          <form action="${path }" method="POST" class='w-100'>
            <input type="hidden" name="userCode" value="${ userCode }">
            <div class="input-group">
              <input type="search" placeholder="   Search" aria-describedby="button-addon5" class="form-control" name="search" id="nav-search">
              <div class="input-group-append">
                <button id="button-addon5" type="submit" class="btn btn-light" id="nav-searchbar-btn"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </form>
        </div>
        <!-- toggle button -->
        <button class="navbar-toggler ml-auto inline my-1" type="button" data-toggle="collapse" data-target="#navbarCollapsible" aria-controls="navbarCollapsible" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- collapsible elements -->
        <div class="collapse navbar-collapse" id="navbarCollapsible">
          <ul class="navbar-nav ml-auto" id='collapseItems'>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-0 text-white" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-globe"></i></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <div id="google_translate_element" class="dropdown-item fa fa-globe"></div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle menu-item mt-1 mr-2 text-white" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Menu</a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="${path }/collabo/detail.do"><i class="fa fa-align-justify">&nbsp;&nbsp;</i>Collabo Tool</a>
                <a class="dropdown-item" href="${path }/mainView"><i class="fa fa-briefcase">&nbsp;&nbsp;</i>Job</a>
                <a class="dropdown-item" href="${path }"><i class="fa fa-cog">&nbsp;&nbsp;</i>Settings</a>

              </div>
            </li>

            <li class="nav-item">
              <form action="${path }/logout" method="post">
                <button type="submit" class="btn btn-sm btn-light mt-2 mr-1" onclick="return logoutSnsAccount();" style="width: 72px;">Log Out</button>
              </form>
            </li>

            <li class="nav-item">
              <form action="${path }/login" method="post">
                <button type="submit" class="btn btn-sm btn-light mt-2 mr-1" style="width:67px;">Log In</button>
              </form>
            </li>
            <li class="nav-item">
              <button class="btn btn-sm btn-primary mt-2" onclick='location.href="${path }/memberEnroll"' style="width:70px;">Sign Up</button>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <script>
      /**
      * sends a request to the specified url from a form. this will change the window location.
      * @param {string} urlMapping the path to send the post request to
      * @param {object} params the paramiters to add to the url
      * @param {string} [method=post] the method to use on the form
      */
      function mypageLoad(urlMapping, params){ var form = $("<form>");
        form.attr({"method": "POST",
                    "action" : urlMapping,
        });
        $.each(params, function(key, value){
          var input = $("<input>");
          input.attr({"type": "hidden",
                      "name": key,
                      "value": value,
          });
          form.append(input);
        });

        form.submit();
      }
      function logoutSnsAccount(){
        googleLogout();
        return true;
      }
    </script>

  <!-- </header> -->
  </header>

