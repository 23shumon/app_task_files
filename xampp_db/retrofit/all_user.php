<?php

require_once 'dbConnection.php';

if ($_SERVER['REQUEST_METHOD']=='GET') {
	

	$stmt = $con->prepare("SELECT id, name, email FROM users;");
	
	//executing the query 
	$stmt->execute();
	
	//binding results to the query 
	$stmt->bind_result($id, $name, $email);
	
	$users = array(); 
	
	//traversing through all the result 
	while($stmt->fetch()){
		$temp = array();
		$temp['id'] = "$id"; 
		$temp['name'] = $name; 
		$temp['email'] = $email; 
		array_push($users, $temp);
	}
	
	//displaying the result in json format 
	echo json_encode($users);
	

}
else {
	echo "wrong request method " ;
}

mysqli_close($con);
?>