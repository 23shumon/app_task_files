<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

	require_once 'dbConnection.php';

	
	$username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $photo = $_POST['photo'];
	
	///this is for the image id
	$str= "AA000";
	$sql1 = "SELECT id FROM user";
	$result1 = mysqli_query($con,$sql1);	
	$id = mysqli_num_rows($result1);
	$id++;
	$num = $str.$id;

	
    $path = "uploads/$num.jpeg";
    $finalPath = "http://10.80.111.103/phpquiz10/".$path;

    $password = password_hash($password, PASSWORD_DEFAULT); ////password hashing
	
	$query = "SELECT username,email from user where username = '{$username}' or email = '{$email}'";
	$result2 = mysqli_query($con, $query);
	if(mysqli_num_rows($result2) > 0){
			$result["error"] = " username or email already exists ";
			echo json_encode($result);
		}
	else{									    
		$sql = "INSERT INTO user (username, email, password, photo) VALUES ('$username', '$email', '$password', '$finalPath')";
		if ( mysqli_query($con, $sql) ) {
			if ( file_put_contents( $path, base64_decode($photo) ) ) {
				// $result["success"] = " New Account Created"; 
				$last_id = mysqli_insert_id($con);
				$result["success"] = " $last_id"; //// returning the id of recently added row
				echo json_encode($result);	
			}
		} 
		else {
			$result["error"] = " Data Insertion Failed";
			echo json_encode($result);			
		}			
	}
	mysqli_close($con);	
	
}

?>