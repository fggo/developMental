<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container footer my-5 w-100 form">
    <!-- <div class="input-group">
      <div class="input-group-append">
        <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
      </div>
      <textarea name="" class="form-control type_msg" placeholder="Type your message..." style="resize:none;"></textarea>
      <div class="input-group-append">
        <span class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
      </div>
    </div> -->

  </div>

  <!-- back to top -->
  <a id="back-to-top" href="#" class="btn btn-info border-light back-to-top py-1 px-2" role="button">
    <i class="fa fa-chevron-up">&nbsp;&nbsp;Top</i>
  </a>


  <!-- Popper.JS -->
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script> -->
  <!-- Bootstrap JS -->
  <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <!-- jQuery Custom Scroller CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <script>
    $(function(){
      $(window).scroll(function () {
        if ($(this).scrollTop() > 40) {
          $('#back-to-top').fadeIn();
        } else {
          $('#back-to-top').fadeOut();
        }
      });

      $('#back-to-top').click(function() {
        $('body,html').animate({
          scrollTop: 0
        }, 300);
        return false;
      });

      $("#sidebar").mCustomScrollbar({
        theme: "minimal"
      });
    });
  </script>
  </div>



  <!-- Credit links for icon image -->
  <style> .free-icons{display:none} </style>
  <div class="free-icons">
    <a target="_blank" href="https://icons8.com/icons/set/pixel-heart">Pixel Heart</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
  </div>

</body>
</html>