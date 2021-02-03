<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {
    
	require_once  'dbConnection.php';

    $id = $_POST['id'];


    $sql = "SELECT username, contact, email, photo_path FROM user ";

    $response = mysqli_query($con, $sql);

    $result = array();
    $result['user'] = array();

    if( mysqli_num_rows($response) == 1 ) {
        
        if ($row = mysqli_fetch_assoc($response)) {
 
             $index['username']    = $row['username'] ;
             $index['contact']    = $row['contact'] ;
             $index['email']       = $row['email'] ;
             $index['photo_path']       = $row['photo_path'] ;
			             
             array_push($result["user"], $index);
 
             $result["code"] = '1';
             $result["message"] = "success";
             echo json_encode($result);
        }else{
        	$result["code"] = "0";
		     $result["message"] = "Error!";
		     echo json_encode($result);
        }
 
   }else {
 
     $result["code"] = "0";
     $result["message"] = "Error!";
     echo json_encode($result);
	}
	
	mysqli_close($con);
 }
 
 ?>