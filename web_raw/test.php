
 <!DOCTYPE html>
 <html>
 <head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>

    <!-- Bootstrap -->
    <link href="bootstrap.3.3.7\content\Content\bootstrap.min.css" rel="stylesheet">
 </head>
 <body>
 <?php include 'function/functions.php';


 ?> 
 <div class="container" id="content">

 </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="script\jquery.js" type="text/javascript"></script>
    <script src="bootstrap.3.3.7\content\Scripts\bootstrap.min.js" type="text/javascript"></script>
<script>

	$.ajax({
    url: 'function/functions.php',
    type: 'post',
    data: { "cata_id": "6"},
    success: function(data) { 
    	$("#content").html(data);
     }
});

</script>
 </body>
 </html>