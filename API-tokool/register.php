<?php
	header("Access-Control-Allow-Origin: *");
	include 'conexion.php';
	$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
	$table = 'users';
	if($uriSegments[3]=='getuser')
	{
		$user = $_POST['username'];
		$queryResult=$connect->query("select * from ".$table." where username = '".$user."'");

		$result=array();
		while($fetchData=$queryResult->fetch_assoc()){
			$result[]=$fetchData;
		}
		
		echo json_encode($result);
	}
	else if($uriSegments[3]=='tambahuser')
	{
		$user = $_POST['username'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];
		$pass= $_POST['password'];
		
		$connect->query("INSERT INTO ".$table." (username,email,phone,password) 
						 VALUES ('".$user."','".$email."','".$phone."',md5('".$pass."'))");
	}
	else if($uriSegments[3]=='ubahuser')
	{
		$user = $_POST['username'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];
		$pass= $_POST['password'];
		
		$connect->query("UPDATE ".$table." set email='".$email."', phone='".$phone."' 
						 where username='".$user."';");
	}
?>