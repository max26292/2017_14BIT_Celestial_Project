<?php
// session_start();
ob_start();
include "function/class.php";
include "function/connect.php";
include "function/functions.php";
$user_id = 1;

// $query = 'select product_name from product where product_id='HTCOne'';
// // require "connect.php";
// $data= $conn->query($query);
// $row = $data->fetch_assoc();
// echo $row['product_name'];
$order_id =123;
$pro_id =11;
$query = 'delete from orders where order_id="'.$order_id.'" and product_id="'.$pro_id.'"';
UPDATE transactions SET status=[value-2],user_id=[value-3],trans_amount=[value-4],trans_payment=[value-5],trans_payment_info=[value-6] WHERE trans_id= and user_id=
echo $query;
if(isset($_POST['delete_submit']))
{
  
}
var_dump($_POST);
ob_end_flush();
 ?>
 <!DOCTYPE html>
 <html>
 <head>
   <title></title>
 </head>
 <body>
 <form  method="post">
    <input type="hidden" name="pro_id" value="123">
    <input type="hidden" name="order_id" value="11">
   <input type="submit" name="delete_submit" value="delete"/>
 </form>
        
 </body>
 </html>
 <!-- <!DOCTYPE html>
 <html>
   <head>
     <meta charset="utf-8">
     <title></title>
   </head>
   <body>
     <button type="button" class="btn btn-primary" onclick="test('asdasd')" >asdasd</button>
     <div id="c">

     </div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script type="text/javascript">
     $(document).ready(function() {
      //  $("#SoXX").click(function (){
      //    /* Act on the event */
      //    $x = $("#SoXX").val();
      //    $('#c').html($x) ;
      //  });
      // $("#SoXX").click(function() {
      //   var pro_id;
      //   pro_id = "SoXX";
      //   $.ajax({
      //     url: "function/order.php",
      //     type: "post",
      //     data: {
      //       pro_id: pro_id
      //     },
      //     success: function(data) {
      //       alert("Add to cart success");
      //     }
      //   });
      // });
     });
     function test(name){
       var pro_id;
       pro_id = name;
       alert(pro_id);
     }
     </script>
   </body>
 </html> -->
