<?php
	header("Access-Control-Allow-Origin: *");
	include 'conexion.php';
	$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
	$table = 'users';
	
	$user = $_POST['username'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$pass= $_POST['password'];
	
	$result = $connect->query("INSERT INTO ".$table." (username,email,phone,password) 
							   VALUES ('".$user."','".$email."','".$phone."',md5('".$pass."'))");
	
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
		 'message' =>'Daftar user gagal'
		);
	}
	header('Content-Type: application/json');
	echo json_encode($response);
?>