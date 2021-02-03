<?php 

require_once 'connect.php';

        $query = "SELECT * FROM product_view";
        $result = mysqli_query($conn, $query);
        $response = array();
        while( $row = mysqli_fetch_assoc($result) ){
            array_push($response, 
            array(
                'id'=>$row['id'], 
				'category'=>$row['category'],
				'manufacturer'=>$row['manufacturer'],
                'name'=>$row['name'], 
				'price'=>$row['price'],
				'quantity'=>$row['quantity'],
				'status'=>$row['status'],
				'short_dec'=>$row['short_dec'],
				'long_dec'=>$row['long_dec'],
                'image'=>$row['image'])
            );
        }
        echo json_encode($response);   
    


mysqli_close($conn);

?>