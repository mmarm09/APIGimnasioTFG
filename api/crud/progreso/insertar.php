<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");

//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/progreso.php';

//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new Progreso($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->peso_kg) && !empty($datos->altura_cm) && !empty($datos->imc) && !empty($datos->fecha) && !empty($datos->id_usuario)) {

    //Se rellena el objeto Restaurante con los datos menos el id
    $rest->peso_kg = $datos->peso_kg;
    $rest->altura_cm = $datos->altura_cm;
    $rest->imc = $datos->imc;
    $rest->fecha = $datos->fecha;
    $rest->id_usuario = $datos->id_usuario;


    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Progreso Creado!"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}

?>