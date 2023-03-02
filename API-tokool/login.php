<?php
	header("Access-Control-Allow-Origin: *");
    include 'conexion.php';

    $phone = $_POST['phone'];
    $password = $_POST['password'];

    $sql=$connect->query("SELECT * FROM users WHERE phone='".$phone."' and password=md5('".$password."')");
	$ceklogin = $sql->num_rows;
	
    $hasil=array();

    while($fetchSql=$sql->fetch_assoc()){
        $hasil[]=$fetchSql;
    }

	if ($ceklogin>0)
	{
		$response=array(
			'error' => false,
			'message' =>null,
			'data' => $hasil
		);
	}
	else
	{
		$response=array(
			'error' => true,
			'message' =>'Password/Username Salah',
			'data' => null
		);
	}
	
    header('Content-Type: application/json');
    echo json_encode($response);

?>