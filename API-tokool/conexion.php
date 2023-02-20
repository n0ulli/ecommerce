<?php
	header("Access-Control-Allow-Origin: *");

	$connect = new mysqli("localhost","root","123456","tokool");

	if($connect){
		
	}
	else{
		echo "Gagal Konek";
		exit();
	}
?>