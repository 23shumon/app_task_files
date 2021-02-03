<?php 

require_once 'connect.php';

        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            
            $query = "SELECT * FROM post_tbl Where userId = $id ";
            $result = mysqli_query($conn, $query);
            $response = array();
            while( $row = mysqli_fetch_assoc($result) ){
                array_push($response, 
                array(
                    'id'=>$row['id'],                 
                    'title'=>$row['title'],
                    'body'=>$row['body'])
                );
            }
            echo json_encode($response);   
                # code...
        }else{
            echo "no data";
        }


    


mysqli_close($conn);

?>