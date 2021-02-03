<?php 

require_once 'connect.php';

//$type = $_GET['item_type'];
    $key = $_GET["key"];
if (isset($_GET['key'])) {
        $query = "SELECT * FROM searchable WHERE category LIKE '%$key%'
												OR manufacturer LIKE '%$key%'
												OR name LIKE '%$key%'
												OR price LIKE '%$key%'";
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
				'short_dec'=>$row['short_dec'],
				'long_dec'=>$row['long_dec'],
                'image'=>$row['image']) 
            );
        }
        echo json_encode($response);   
    
} else {   
        $query = "SELECT * FROM searchable";
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
				'short_dec'=>$row['short_dec'],
				'long_dec'=>$row['long_dec'],
                'image'=>$row['image'])
            );
        }
        echo json_encode($response);   
    
}

mysqli_close($conn);

?>