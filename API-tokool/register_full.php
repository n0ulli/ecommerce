<?php
	header("Access-Control-Allow-Origin: *");
	include 'conexion.php';
	$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
	$table = 'users';
	if($uriSegments[3]=='getuser')
	{
		$user = $_POST['username'];
		$queryResult=$connect->query("select * from ".$table." where username = '".$user."'");
		$cekuser = $queryResult->num_rows;

		$result=array();
		while($fetchData=$queryResult->fetch_assoc()){
			$result[]=$fetchData;
		}
		
		if ($cekuser>0)
		{
			$response=array(
				'error' => false,
				'message' =>null,
				'data' => $result
			);
		}
		else
		{
			$response=array(
				'error' => true,
				'message' =>'Get User gagal',
				'data' => null
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);
	}
	else if($uriSegments[3]=='tambahuser')
	{
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
	}
	else if($uriSegments[3]=='ubahuser')
	{
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
	}
?>