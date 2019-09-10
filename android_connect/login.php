<?php
	require 'db_connect.php';
	
	$usuario = $_POST['usuario'];
	$pass = $_POST['pass']; 
	
	//$usuario = "Anthony";
	//$pass = "Gaston";
	
	$query = "SELECT * FROM usuario  WHERE 
				Nombre = '$usuario' AND
				Email = '$pass'";	

	
	$result = mysqli_query($mysqli, $query);
	
	//Verificacion si trajo el resultado 
	if (mysqli_num_rows ($result) > 0){
		//Trajo un resultado
		$datos = array();
		//Insertamos en el array la fila que se obtunvo de la consulta
		//Array map parsea los datos en formato utf8
		$datos[] = array_map("utf8_encode", mysqli_fetch_assoc($result));
		
		$json_array = json_encode($datos);
		
		echo $json_array;
	
	
	} else {
		echo "0";
	}
?>				