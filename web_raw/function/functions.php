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
	function get_catalog_items ()
	{
		include "connect.php";
		$query =  "select catalog_id,catalog_name from catalog";
		$data = $conn->query($query);
		if( $data->num_rows >0)
		{
			while ($row = $data->fetch_assoc()) {
				# code...?>
			
				<a href="#" class="list-group-item" <?php echo 'id="'.$row['catalog_name'].'"' ;?>  ><?php echo $row['catalog_name'];  ?></a>
				
			<?php 
			}
			 
		}		
	}
	function get_product_items($cata_id)
	{
		include "connect.php";
		$query = "select product_name, product_price, product_content, product_image from product where catalog_id=".$cata_id."";
		$data = $conn->query($query);	
		//var_dump($data);	
		// $results = array();
		$row_count = 0;
		if($data->num_rows >0)
		{
			?>
			<div class="row row_space"> 	
			<?php
			while ($row =  $data->fetch_assoc()) 
			{
				# code...
				// $pr_name = $row['product_name'];
				// //echo $pr_name;
				// $pr_price = $row['product_price'];
				// $pr_content= $row['product_content'];
				// $pr_image =  $row['product_image'];
				// $results[]=array("pr_name" => $pr_name,"pr_price"=>$pr_price, "pr_content"=>$pr_content, "pr_image"=>$pr_image);
				?>
		
				<div class="col-xs-12 col-lg-4">
					<img class="img-thumbnail" width="300px" height="350px" src='data:image;base64,<?php echo $row["product_image"];?>'>
				</div>
				
				
			<?php $row_count += 1;
				if ($row_count == 3)
				{
					?>
					</div>
					<div class= "row">
						
					<?php
					$row_count = 0;
				}
			}
				?>

			</div>
		
<?php  
			
		}
		//var_dump($data);
		//var_dump($results);
		// echo json_encode($results);
	}
// ------------------------------- addion function --------------------------
if(isset($_POST['cata_id'])){
	//var_dump($_POST);
	echo get_product_items($_POST['cata_id']);
}
 ?>
