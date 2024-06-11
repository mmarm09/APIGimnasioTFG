<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");

//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/rutina_ejercicio.php';

//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new RutinaEjercicio($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->id_rutina) && !empty($datos->id_ejercicio) && !empty($datos->dia)) {

    //Se rellena el objeto Restaurante con los datos menos el id
    $rest->id_rutina = $datos->id_rutina;
    $rest->id_ejercicio = $datos->id_ejercicio;
    $rest->dia = $datos->dia;

    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Rutina_Ejercicio Creado!"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}

?>