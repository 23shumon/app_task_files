<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

	require_once  'dbConnection.php';
	
	$username = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
	//$phone = $_POST['phone'];
    

    $password = password_hash($password, PASSWORD_DEFAULT); ////password hashing
	
	$query = "SELECT name, email FROM users WHERE name = '{$username}' or email = '{$email}'";
	$result = mysqli_query($con, $query);
	if(mysqli_num_rows($result) > 0){
		$response['success'] = 0;
		$response['message'] = "username or email already exist ";
		echo json_encode($response);
	}else{									    
		$query3 = "INSERT INTO users (name, email, password) VALUES ('$username', '$email', '$password')";
		if ( mysqli_query($con, $query3) ) {
				$last_id = mysqli_insert_id($con);
				$response['success'] = 1; //// returning the id of recently added row
				$response['message'] = "user id = $last_id";
				echo json_encode($response);
		}else {
			$response['success'] = 0;
			$response['message'] = "Data Insertion Failed";
			echo json_encode($response);			
		}			
	}
	mysqli_close($con);		
}

?>