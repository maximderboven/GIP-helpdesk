  $(window).scroll(function(){
  	$('nav').toggleClass('scrolled', $(this).scrollTop() > 100);
  }); 
  
  $(document).ready(function() {
    $("#navSecond").hide();
  }); 
  

$(window).scroll(function () {
    var scrollDistance = $(window).scrollTop();

    // Assign active class to nav links while scolling
    $('.page-section-scroll').each(function (i) {
        if ($(this).position().top <= scrollDistance+100) {
            $('nav ul li.activeNav').removeClass('activeNav');
            $('nav ul li').eq(i).addClass('activeNav');
        }
    });
}).scroll();