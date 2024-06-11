<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");

//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/secuencia.php';

//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new Secuencia($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->id_ejercicio)) {

    //Se rellena el objeto Restaurante con los datos menos el id
    $rest->series = $datos->series;
    $rest->repeticiones = $datos->repeticiones;
    $rest->duracion = $datos->duracion;
    $rest->id_ejercicio = $datos->id_ejercicio;


    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Secuencia Creada!"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}

?>