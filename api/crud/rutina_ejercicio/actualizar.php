<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/rutina_ejercicio.php';

$database = new Gimnasio();
$db = $database->dameConexion();
$act = new RutinaEjercicio($db);

$datos = json_decode(file_get_contents("php://input"));

// Comprobar que los datos no están vacíos
if (!empty($datos->id_rutina) && !empty($datos->id_ejercicio) && !empty($datos->dia)) {

    $act->id_rutina = $datos->id_rutina;
    $act->id_ejercicio = $datos->id_ejercicio;
    $act->dia = $datos->dia;

    if ($act->actualizar()) {
        http_response_code(200);
        echo json_encode(array("info" => "Rutina_Ejercicio actualizado"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se ha podido actualizar"));
    }

} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se ha podido actualizar. Datos incompletos."));
}
?>
