$(document).ready(function() {
  // -------------menu click function---------------------------------
  $('.menu_icon').click(function () {
    $(".menu_bar").width("250px");
    $(".menu_icon").css('display','none');
    $(".main_body").animate({
        'marginLeft' : "+=250px" //moves right
        });
  	});
  $('#cls_bt').click(function () {
    $(".menu_bar").width("0px");
    $(".menu_icon").css('display','block');
    $(".main_body").animate({
        'marginLeft' : "-=250px" //moves left
        });
	});
  //--------------------login function ---------------------------------
  $('#login_form').click(function()
  	{
  		$('.login_form').slideToggle("slow");
  	});
  $('#calatog_list').click (function(){
     $('.calatog_list').slideToggle("slow");
  });
  //-------------------catalog click function ---------------------------
  $('#Sony').click(function(){
    $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "1"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });
  $('#ASUS').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "2"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });
  $('#HTC').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "3"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });
  $('#Xiaomi').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "4"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });

  $('#Iphone').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "5"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });

  $('#Samsung').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "6"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });

  $('#OPPO').click(function(){
     $.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "7"},
    success: function(data) { 
      $("#content").html(data);
     }
    });
  });
  
  // cast background function------------------------
  $('#test').click(function(){
    $('.content').toggleClass("sub_body");
  });
});

