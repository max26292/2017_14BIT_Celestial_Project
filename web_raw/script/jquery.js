$(document).ready(function() {
  $('.menu_icon').click(function () {
    $(".menu_bar").width("250px");
    $(".menu_icon").css('display','none');
  	});
  $('#cls_bt').click(function () {
    $(".menu_bar").width("0px");
    $(".menu_icon").css('display','block');
	});
  $('#login_form').click(function()
  	{
  		$('.login_form').slideToggle("slow");
  	});
});

