

<?php

if(isset($_GET['send_notification'])){
   send_notification ();
}

function send_notification()
{
	echo 'Hello';
define( 'API_ACCESS_KEY', 'AAAA16JARGw:APA91bFWJc6eBm7zP7iWbH0Ndi6NAgTG9PPOsVMEe8BCwS4sBAYHgYXUnN3ay3sswC66RciPNFCUKb43D9YbFVlPFReWNhJecug6frz8WmaeoJs9vVrLZ8JErgp6rRvtMa7TnmGrXXhN');
 //   $registrationIds = ;
#prep the bundle
     $msg = array
          (
		'body' 	=> 'Firebase Notification',
		'title'	=> 'hi',
             	
          );
	$fields = array
			(
				'to'		=> $_REQUEST['token'],
				'notification'	=> $msg
			);
	
	
	$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json'
			);
#Send Reponse To FireBase Server	
		$ch = curl_init();
		curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
		curl_setopt( $ch,CURLOPT_POST, true );
		curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
		curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
		curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
		$result = curl_exec($ch );
		echo $result;
		curl_close( $ch );
}
?>