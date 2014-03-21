
//Document ready functions
$(document).ready(function(){
  //Flowtype plugin settings
  $("body").flowtype({
    minimum: 400,
    maximum: 1200
  })

  var currentPage;

  //Smoothscroll plugin settings
  $('a').smoothScroll({
    offset: -58, 
    speed: 1000,
    beforeScroll: function(){
      $('.top-bar').removeClass('expanded');
    },
    afterScroll: function(){
      currentPage = $(this).attr("href");
    }
  });

  // Move active class on topbar to current page
  $("ul>li>a").on("click", function(e){
    $(".active").removeClass("active");
    $(this).parent().addClass("active");
    if(screen.width < 600){
      $("#menu-icon").trigger("click");
    }
  });

  var menuOpen = false;
  $("#menu-icon").on("click", function(){
    if(menuOpen == false ){
      menuOpen = true;
    } else {
      menuOpen = false;
    }
  })
});