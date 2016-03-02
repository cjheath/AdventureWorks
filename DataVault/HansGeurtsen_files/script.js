jQuery(function($) {
   $('span.toggle').click(function(){
   		$(this).parent('h2').next('p').toggle();
   		$(this).toggleClass('open');
   });
   
   $('.author-list > li:nth-child(2n+2)').addClass("alt");
   $('.dlm_download_list li:nth-child(even)').addClass("alt");
   
   $('#mobile a').on('click',function(){
	   $(this).parents('header').toggleClass("active");
   });
   
   
   
   $('.toggle-search').on('click', function(e) {
       e.preventDefault();
      $('#searchform').slideToggle(); 
   });
   
   $( "#mobile-menu-handler" ).on('click', function() {
      $( "#mobile-menu" ).slideToggle( 500);
   });
   
 });
