<?php session_start();

  include 'functions.php';
  include 'class.php';
if(!isset($_SESSION['user_name']))
{
    header('Location: index.php');
}

 ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″/>
    <title></title>

    <!-- Bootstrap -->
    <link href="../bootstrap.3.3.7/content/Content/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/custom_ver1.css">
    <link rel="stylesheet" href="../css/imagehover.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <div class="navbar fixed navbar-inverse ischanged navbar-fixed-top ">
      <!-- icon menu -->
      <!-- <div class="menu_info ">
        <div class="user_info">
          <h5> <?php
            echo "User name: ".$_SESSION['user_name'];
           ?>
         </h5>
         <div class="btn-group" role="group">
         <button type="button" class="btn btn-default" onclick="window.location.href='function/register.php'">Control panel</button>
         <button type="button" class="btn btn-default" onclick="window.location.href='function/logout.php'">Logout</button>
       </div>
       </div>

      </div> -->
      <div class="input-group menu_info">
          <h4><span class="label label-primary">
            <?php
              echo "User name: ".$_SESSION['user_name'];
             ?>

          </span></h4>
          <div class="btn-group" role="group">
          <button type="button" class="btn btn-default btn-xs" >Control panel</button>
          <button type="button" class="btn btn-default btn-xs" onclick="window.location.href='logout.php'">Logout</button>
        </div>
        <!-- /input-group -->
      </div>

      <!--cast menu  -->

      <!-- Icon of shop -->
      <div class="logo">
        <img src="../images/logo.png" id="home_in">
      </div>
    </div>



    <!-- -------------------------------div content---------------------------------------------- -->
<!--     <input type="button" id="test" value="test"> </input> -->
  <?php
    $user = new user();
    $user->get_user($_SESSION['user_mail']);

   ?>
    <div class="container main_body" id="content" >

      <div class="row">
        <div class="form-horizontal">
          <div class="form-group">
              <label for="user_email" class="col-sm-2 control-label">Email:</label>
              <div class="col-sm-6">
              <input type="text" class="form-control" id="user_email" name="" value="<?php echo $user->get_mail();?>">
            </div>
          </div>
          <div class="form-group">
              <label for="user_name" class="col-sm-2 control-label">Name:</label>
              <div class="col-sm-6">
              <input type="text" class="form-control" id="user_name" name="" value="<?php echo $user->get_name();?>">
            </div>
          </div>
          <div class="form-group">
              <label for="user_phone" class="col-sm-2 control-label">Số điện thoại:</label>
              <div class="col-sm-6">
              <input type="text" class="form-control" id="user_phone" name="" value="<?php echo $user->get_phone();?>">
            </div>
          </div>
        </div>
      </div>

      <!-- function  -->
      <?php
        $order = new order();
        // var_dump($_POST);
          if(isset($_POST['delete_submit']))
          {
            delete_product_ordered($_POST['pro_id'],$_POST['order_id']);
            unset($_POST);
          }
        ?>
      <div class="row">
        <div class="col-sm-12" style=" text-align: center;">
          <h3>Danh sách sản phẩm</h3>
        </div>
      </div>
      <div class="row">
        <table class="table table-striped">
            <tr>
              <th>Tên Sản Phẩm</th>
              <th> Số lượng </th>
              <th> Giá </th>
              <th> Hủy mua</th>
            </tr>

            <!-- <tr>
              <td>Tên Sản Phẩm</td>
              <td> Số lượng </td>
              <td> Giá </td>
              <td> <button type="button" class="btn btn-danger">Hủy</button></td>
            </tr> -->
          <?php $order->get_order_list($user->get_id()); ?>
        </table>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <div class="col-xs-4">
          <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#paird" aria-expanded="false" aria-controls="collapseExample">Thanh toán</button>
          <button type="button" class="btn btn-default" onclick="window.location.href='../main.php'">Tiếp tục mua</button>
        </div>
        <!-- checkout function -->
          <?php 
            if(isset($_POST['checkout']) && isset($_POST['trans_payment']))
            {
              $query = 'UPDATE transactions SET status=1,trans_amount='.$_POST['trans_amount'].',trans_payment="'.$_POST['trans_payment'].'",trans_payment_info="'.$_POST['trans_payment_info'].'" WHERE trans_id="'.$_SESSION['trans_id'].'" and user_id='.$_SESSION['user_id'].'' ;

              require ('connect.php');
              if($conn->query($query)!== false)
              {
                $message="thanh toan thanh cong";
                $_SESSION['trans_id']= gen_tran_id();
                set_trans($_SESSION['user_id'],$_SESSION['trans_id']);
              }
              //$message="thanh toan thanh cong";
            }

           ?>
      </div>
      <div class="row">
      <br>
        <div class="collapse" id="paird">
          <div class="well">
            <form method="post" class="form-horizontal">
            <div class="error-message-box"><?php if(isset($message)) { echo $message; } ?></div>
            <div class="form-group">
              <label for="method" class="col-sm-3 control-label">Phương thức thanh toán:</label> 
              <div class="col-sm-3">
              <select class="form-control" id="method" name="trans_payment">
                <option value="">Chọn phương thức thanh toán </option>
                <option value="cash">Tiền mặt</option>
                <option value="credit card">Thẻ ngân hàng</option>    
              </select>
              </div>
            </div>
              <?php $sum = sum_orders($_SESSION['trans_id']); ?>
              <div class="form-group">
                <label for="money" class="col-sm-3 control-label">Số tiền thanh toán:</label> 
                <div class="col-sm-3">
                  <input type="hidden" class="form-control" name="trans_amount" id="money" value="<?php echo $sum['sum'];?>">
                  <div class="form-control" >
                    <?php echo number_format($sum['sum'], 0).' VND';?>
                  </div>
                  </div>
              </div>              
              <div class="form-group">
                <label for="add_info" class="col-sm-3 control-label">Thông tin thêm (Option):</label> 
                <div class="col-sm-3">
                  <input type="text" class="form-control" name="trans_payment_info" id="money" value=" ">
                  </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-5 "> 
                <input type="submit" name="checkout" value="Xác Nhận" class="btn btn-primary" >               
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>  
    </div>
<div class="checked">

</div>
 <?php 
// var_dump($_SESSION);
// echo "<br>";
//   var_dump($_POST);
//   echo "<br>";
//   echo $query;
// unset($_POST);
 ?>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../bootstrap.3.3.7\content\Scripts\bootstrap.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../script/jquery.js" type="text/javascript"></script>
    <script>jQuery.noConflict();</script>

  </body>
</html>
