<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");

//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/ejercicio.php';

//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new Ejercicio($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->nombre) && !empty($datos->tipo)) {

    //Se rellena el objeto Restaurante con los datos menos el id
    $rest->nombre = $datos->nombre;
    $rest->tipo = $datos->tipo;
    $rest->complemento = $datos->complemento;
    $rest->grupo_muscular = $datos->grupo_muscular;
    $rest->foto = $datos->foto;
    $rest->foto_detalle = $datos->foto_detalle;


    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Ejercicio Creado!"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}

?>