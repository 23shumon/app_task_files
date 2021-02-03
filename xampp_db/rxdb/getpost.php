<?php 

require_once 'connect.php';

        $query = "SELECT * FROM post_tbl";
        $result = mysqli_query($conn, $query);
        $response = array();
        while( $row = mysqli_fetch_assoc($result) ){
            array_push($response, 
            array(
                'id'=>$row['id'], 
				'userId'=>$row['userId'],
				'title'=>$row['title'],
                'body'=>$row['body'])
            );
        }
        echo json_encode($response);   
    


mysqli_close($conn);

?>