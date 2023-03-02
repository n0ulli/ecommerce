<?php
	header("Access-Control-Allow-Origin: *");
	include 'conexion.php';
	$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
	$table = 'users';
	
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
?>