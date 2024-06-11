<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/secuencia.php';

//Se crea conexión y el objeto Restaurante
$database = new Gimnasio();
$db = $database->dameConexion();
$act = new Secuencia($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que el id no está vacio
if (!empty($datos->id)) {
	//Relleno el id
	$act->id = $datos->id;
	if ($act->borrar()) {
		http_response_code(200);
		echo json_encode(array("info" => "Secuencia borrada con éxito o no está en el sistema!"));
	} else {
		http_response_code(503);
		echo json_encode(array("info" => "No se puede borrar"));
	}
} else {
	http_response_code(400);
	echo json_encode(array("info" => "No se puede borrar, datos incompletos"));
}
?>