<?php
	header("Access-Control-Allow-Origin: *");
	include 'conexion.php';
	$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
	$table = 'users';
	
	$user = $_POST['username'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	//$pass= $_POST['password'];
	
	$result = $connect->query("UPDATE ".$table." set email='".$email."', phone='".$phone."' 
					 where username='".$user."';");
	
	if($result)
	{
		$response=array(
		 'error' => false,
		 'message' =>null
		);
	}
	else
	{
		$response=array(
		 'error' => true,
		 'message' =>'Ubah user gagal'
		);
	}
	header('Content-Type: application/json');
	echo json_encode($response);
?>