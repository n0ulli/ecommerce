<?php
	header("Access-Control-Allow-Origin: *");
    include 'conexion.php';

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql=$connect->query("SELECT * FROM users WHERE username='".$username."' and password=md5('".$password."')");

    $hasil=array();

    while($fetchSql=$sql->fetch_assoc()){
        $hasil[]=$fetchSql;
    }

    echo json_encode($hasil);

?>