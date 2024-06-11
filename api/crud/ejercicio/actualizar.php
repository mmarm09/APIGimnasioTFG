<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/ejercicio.php';

$database = new Gimnasio();
$db = $database->dameConexion();
$act = new Ejercicio($db);

$datos = json_decode(file_get_contents("php://input"));

// Comprobar que los datos no están vacíos
if (!empty($datos->id) && !empty($datos->nombre) && !empty($datos->tipo)) {

    $act->id = $datos->id;
    $act->nombre = $datos->nombre;
    $act->tipo = $datos->tipo;
    $act->complemento = $datos->complemento;
    $act->grupo_muscular = $datos->grupo_muscular;
    $act->foto = $datos->foto;
    $act->foto_detalle = $datos->foto_detalle;

    if ($act->actualizar()) {
        http_response_code(200);
        echo json_encode(array("info" => "Ejercicio actualizado"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se ha podido actualizar"));
    }

} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se ha podido actualizar. Datos incompletos."));
}
?>
