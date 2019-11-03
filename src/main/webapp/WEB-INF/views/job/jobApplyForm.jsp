<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Apply" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="Apply job" />
</jsp:include>

<style>
  /*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
/* 
body {
  background: #f5f5f5;
}

.rounded-lg {
  border-radius: 1rem;
}

.nav-pills .nav-link {
  color: #555;
}

.nav-pills .nav-link.active {
  color: #fff;
} */
</style>

  <!-- <div class="testimonial py-5" id="testimonial"> -->
  <main id="main-wrapper" class="p-0 w-100">
    <div class="container mb-0 mt-3 p-0 text-center " id="loading">
      <div class="spinner-grow spinner-grow-sm ml-1 mt-3 mb-0 text-primary apiLoading" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow spinner-grow-sm ml-1 mt-3 mb-0 text-primary apiLoading" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow spinner-grow-sm ml-1 mt-3 mb-0 text-primary apiLoading" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow spinner-grow-sm ml-1 mt-3 mb-0 text-primary apiLoading" role="status">
        <span class="sr-only">Loading...</span>
      </div>
      <div class="spinner-grow spinner-grow-sm ml-1 mt-3 mb-0 text-primary apiLoading" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>

    <div class="" id="main-container">
    <div class="container py-5">

      <!-- For demo purpose -->
      <div class="row mb-4">
        <div class="col-lg-8 mx-auto text-center">
          <h5 class="display-4">Apply Form</h5>
          <p class="lead mb-0">Company &nbsp;&nbsp;
            <img src="${imageURL}" class="img-fluid" alt="">
          </p>
          <p class="lead">Hello nickname.</p>
        </div>
      </div>
      <!-- End -->


      <div class="row">
        <div class="col-lg-7 mx-auto">
          <div class="bg-white rounded-lg shadow-sm p-5">
            <!-- Credit card form tabs -->
            <ul role="tablist" class="nav table-dark mb-3">
              <li class="nav-item">
                <a data-toggle="pill" href="#nav-tab-card" class="nav-link active rounded-pill">
                <i class="fa fa-building-o"></i>
                Company Name
                </a>
              </li>
            </ul>
            <!-- End -->

            <!-- Apply form content -->
            <div class="tab-content">

              <!-- applicants info-->
              <div id="nav-tab-card" class="tab-pane fade show active">
                <p class="alert alert-success">Some text success or error</p>
                <form class="form" action="${path}/job/jobApplyEnd.do" method="post" role="form">
                  <div class="form-group">
                    <label for="nickname">Full Name</label>
                    <input type="text" name="name" placeholder="Full Name" required class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="cardNumber"></label>
                    <div class="input-group">
                      <input type="text" name="cardNumber" placeholder="Your card number" class="form-control" required>
                      <div class="input-group-append">
                        <span class="input-group-text text-muted">
                                                    <i class="fa fa-cc-visa mx-1"></i>
                                                    <i class="fa fa-cc-amex mx-1"></i>
                                                    <i class="fa fa-cc-mastercard mx-1"></i>
                                                </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">

                  </div>
                  <div class="row">
                    <div class="col-sm-8">
                      <div class="form-group">
                        <label><span class="hidden-xs">Expiration</span></label>
                        <div class="input-group">
                          <input type="number" placeholder="MM" name="" class="form-control" required>
                          <input type="number" placeholder="YY" name="" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="form-group mb-4">
                        <label data-toggle="tooltip" title="Three-digits code on the back of your card">CVV
                                                    <i class="fa fa-question-circle"></i>
                                                </label>
                        <input type="text" required class="form-control">
                      </div>
                    </div>



                  </div>
                  <button type="button" class="subscribe btn btn-primary btn-block rounded-pill shadow-sm"> Confirm  </button>
                </form>
              </div>
              <!-- End -->

            </div>
            <!-- End -->

          </div>
        </div>
      </div>
    </div>

    <script>
      $(function(){
        var $apiLoading = $('.apiLoading').hide();
        $(document)
        .ajaxStart(function () {
          $apiLoading.show();
        })
        .ajaxStop(function () {
          $apiLoading.hide();
        });

        $('[data-toggle="tooltip"]').tooltip()
      });
    </script>

  </div>
  </main>

</div>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
