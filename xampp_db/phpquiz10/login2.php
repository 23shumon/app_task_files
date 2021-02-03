<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {
	

	$ref      = @$_GET['q'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    require_once 'dbConnection.php';

    $sql = "SELECT * FROM user WHERE username = '$username' ";

    $response = mysqli_query($con, $sql);

    $result = array();
    $result['login'] = array();
    
    if ( mysqli_num_rows($response) === 1 ) {
        
        $row = mysqli_fetch_assoc($response);

        if ( password_verify($password, $row['password']) ) { ////decrypting hash password
            
            $index['username'] = $row['username'];
            $index['email'] = $row['email'];
            $index['id'] = $row['id'];
            $index['photo'] = $row['photo'];

            array_push($result['login'], $index);

            $result['success'] = "1";
            $result['message'] = " Login Successfully ";
            echo json_encode($result);
			//header("location:account.php?q=1");
			session_start();
			if (isset($_SESSION["username"])) {
				session_destroy();
			}
            

        } else {

            $result['success'] = "0";
            $result['message'] = " Wrong Password";
            echo json_encode($result);          
        }

    }
		else{
			$result['success'] = "0";
            $result['message'] = " Wrong Password or Username";
            echo json_encode($result); 
		}
	
	mysqli_close($con);

}

?>