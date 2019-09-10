<?php
	
	
	//Variable que almacena la conexion a la dba_close
	$mysqli = new mysqli("localhost","root","","app_db");
	if($mysqli->connect_errno){
		die("Fallo la conexion");
	}else {
		echo "Conexion exitosa";
	}
 
?>