<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/rutina.php';

$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new Rutina($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->duracion_semanas) && !empty($datos->num_sesiones)) {
    //Se rellena el objeto Rutina con los datos menos el id
    $rest->duracion_semanas = $datos->duracion_semanas;
    $rest->num_sesiones = $datos->num_sesiones;
    $rest->dificultad = $datos->dificultad;

    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Rutina Creada!", "id" => $rest->id, "duracion_semanas" => $rest->duracion_semanas,
        "num_sesiones" => $rest->num_sesiones, "dificultad" => $rest->dificultad));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}
?>