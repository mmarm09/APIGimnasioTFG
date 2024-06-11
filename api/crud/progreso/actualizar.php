<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/progreso.php';

$database = new Gimnasio();
$db = $database->dameConexion();
$act = new Progreso($db);

$datos = json_decode(file_get_contents("php://input"));

// Comprobar que los datos no están vacíos
if (!empty($datos->id) && !empty($datos->peso_kg) && !empty($datos->altura_cm) 
&& !empty($datos->imc) && !empty($datos->fecha) && !empty($datos->id_usuario)) {

    $act->id = $datos->id;
    $act->peso_kg = $datos->peso_kg;
    $act->altura_cm = $datos->altura_cm;
    $act->imc = $datos->imc;
    $act->fecha = $datos->fecha;
    $act->id_usuario = $datos->id_usuario;

    if ($act->actualizar()) {
        http_response_code(200);
        echo json_encode(array("info" => "Progreso actualizado"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se ha podido actualizar"));
    }

} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se ha podido actualizar. Datos incompletos."));
}
?>
