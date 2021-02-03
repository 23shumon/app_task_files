<?php 

require_once 'connect.php';


		$query = "SELECT * FROM slider_images";
        $result = mysqli_query($conn, $query);
        $response = array();
        while( $row = mysqli_fetch_assoc($result) ){
            array_push($response, 
            array(
                'id'=>$row['id'], 
				'slider_image'=>$row['slider_image'],
				'publication_status'=>$row['publication_status'],
                'created_at'=>$row['created_at'], 
				'updated_at'=>$row['updated_at'])
            );
        }
        echo json_encode($response); 



/* 	$type = $_GET['item_type'];

    if ($type == 'slider_images') {
        $query = "SELECT * FROM slider_images ";
        $result = mysqli_query($conn, $query);
        $response = array();
        while( $row = mysqli_fetch_assoc($result) ){
            array_push($response, 
            array(
                'id'=>$row['id'], 
				'slider_image'=>$row['slider_image'],
				'publication_status'=>$row['publication_status'],
                'created_at'=>$row['created_at'], 
				'updated_at'=>$row['updated_at'])
            );
        }
        echo json_encode($response);   
    } 
 */
mysqli_close($conn);

?>		
