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
  <a id="back-to-top" href="#" class="btn btn-outline-dark back-to-top py-1 px-2" role="button">
    <i class="fa fa-chevron-up">&nbsp;&nbsp;Top</i>
  </a>


  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  
  <!-- Bootstrap JS -->
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

    });
  </script>
  </div>



  <!-- Credit links for icon image -->
  <style> .free-icons{display:none} </style>
  <div class="free-icons">
    <a target="_blank" href="https://icons8.com/icons/set/pixel-heart">Pixel Heart</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/time">Time</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/database-export">Database Export</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/queue">Queue</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/open-box">Open Box</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>

    <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
  </div>

</body>
</html>