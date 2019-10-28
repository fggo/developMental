<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
 <jsp:param name="pageTitle" value="Homepage" />
</jsp:include>

<style>
  img {width:100%;}
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- <div class="testimonial py-5" id="testimonial"> -->
<div class="py-4 col-lg-10 container submenu-container">

  <div class="container submenu-container">
    <div class="row ">
      <div class="col-md-3 py-5 bg-primary text-white text-center">
        <div class=" ">
          <div class="card-body">
            <img src="http://www.ansonika.com/mavia/img/registration_bg.svg" style="width:30%">
            <h2 class="py-3">Registration</h2>
            <p class="text-white">Please Register your company</p>
          </div>
        </div>
      </div>
      <div class="col-md-9 py-5 border">
        <h4 class="pb-4">Please fill with your details</h4>
        <form action="${path}/job/jobEnrollEnd.do">
          <div class="form-row">
            <div class="form-group col-md-6">
             <input id="writer" name="writer" placeholder="Company Name" class="form-control" type="text" value="${loginMember.nickname}" readonly />
            </div>
            <div class="form-group col-md-6">
             <input type="text" class="form-control" id="title" placeholder="Title">
            </div>
           </div>
          <div class="form-row">
            <!-- <div class="form-group col-md-6">
              <input id="Mobile No." name="Mobile No." placeholder="Mobile No." class="form-control" required="required" type="text">
            </div> -->
            <!-- <div class="form-group col-md-6">
                 
                 <select id="inputState" class="form-control">
                  <option selected>Choose ...</option>
                  <option> New Buyer</option>
                  <option> Auction</option>
                  <option> Complaint</option>
                  <option> Feedback</option>
                 </select>
            </div> -->
            <div class="form-group col-md-12">
                 <textarea id="comment" name="comment" cols="40" rows="5" class="form-control" placeholder="Describe Recruiting Details. Tell "></textarea>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group">
              <div class="form-group">
                <div class="form-check">
                 <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                 <label class="form-check-label" for="invalidCheck2">
                  <small>By clicking Submit, you agree to our Terms & Conditions, Visitor Agreement and Privacy Policy.</small>
                 </label>
                </div>
               </div>
          
             </div>
          </div>
          
          <div class="form-row justify-content-center">
            <button type="button" class="btn btn-outline-danger">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
