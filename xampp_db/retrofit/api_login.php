<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {
	
	require_once  'dbConnection.php';

    $username = $_POST['name'];
    $password = $_POST['password'];


    $sql = "SELECT id, name, email, password FROM users WHERE name = '$username' ";

    $response = mysqli_query($con, $sql);

    $result = array();
    $result['Users'] = array();
    
    if ( mysqli_num_rows($response) == 1 ) {
        
        $row = mysqli_fetch_assoc($response);

        if ( password_verify($password, $row['password']) ) { ////decrypting hash password
            
            $index['id'] 			= $row['id'];
			$index['name'] 		= $row['name'];
            $index['email'] 		= $row['email'];                   

            array_push($result['Users'], $index);

            $result['success'] = 1;
            $result['message'] = " Login Successfully ";
            echo json_encode($result);
            

        } else {

            $result['success'] = 0;
            $result['message'] = " Wrong Password";
            echo json_encode($result);          
        }

    }
		else{
			$result['success'] = 0;
            $result['message'] = " Wrong Username";
            echo json_encode($result); 
		}
	
	mysqli_close($con);

}

?>