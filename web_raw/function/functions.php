<?php 
	function saveimage ($name_product,$image){
			include 'connect.php';
			$query = "update product set product_image ='$image' where product_name = '$name_product'";
			// $query = "select * from product where product_name = '$name_product'";
			
			  $conn->query($query);
			// while( $row = $data->fetch_assoc())
			// {
			// 	echo $row['product_name'];
			// }
			$conn->close();
		}
	// display image code: <img height="200" width="200" src="data:image;base64,'.row['*nameof_image_colum'].">

 ?>