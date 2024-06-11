<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/rutina_ejercicio.php';

//Se crea conexión y el objeto Restaurante
$database = new Gimnasio();
$db = $database->dameConexion();
$act = new RutinaEjercicio($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que el id no está vacio
if (!empty($datos->id_rutina) && !empty($datos->id_ejercicio)) {
	//Relleno el id
	$act->id_rutina = $datos->id_rutina;
	$act->id_ejercicio = $datos->id_ejercicio;

	if ($act->borrar()) {
		http_response_code(200);
		echo json_encode(array("info" => "Rutina_Ejercicio borrada con éxito o no está en el sistema!"));
	} else {
		http_response_code(503);
		echo json_encode(array("info" => "No se puede borrar"));
	}
} else {
	http_response_code(400);
	echo json_encode(array("info" => "No se puede borrar, datos incompletos"));
}
?>