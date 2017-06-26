$(document).ready(function() {
  $('.menu_icon').click(function () {
    $(".menu_bar").width("250px");
	});
  $('#cls_bt').click(function () {
    $(".menu_bar").width("0px");
	});
  $('#login_form').click(function()
  	{
  		$('.login_form').slideToggle("slow");
  	});
});

