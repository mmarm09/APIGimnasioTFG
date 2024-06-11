<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");

//header("Access-Control-Allow-Headers: Content-Type");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/usuario.php';

//Se crea conexión y el objeto Usuario
$database = new Gimnasio();
$db = $database->dameConexion();
$rest = new Usuario($db);

$datos = json_decode(file_get_contents("php://input"));

//Comprobar que los datos no están vacios
if (!empty($datos->dni) && !empty($datos->nombre) && !empty($datos->apellidos) 
    && !empty($datos->telefono) && !empty($datos->correo) && !empty($datos->fecha_nacimiento)
    && !empty($datos->contrasena) /*&& !empty($datos->foto) && !empty($datos->id_rutina)*/) {

    //Se rellena el objeto Usuario con los datos menos el id
    $rest->dni = $datos->dni;
    $rest->nombre = $datos->nombre;
    $rest->apellidos = $datos->apellidos;
    $rest->telefono = $datos->telefono;
    $rest->correo = $datos->correo;
    $rest->fecha_nacimiento = $datos->fecha_nacimiento;
    $rest->contrasena = $datos->contrasena;
    $rest->foto = $datos->foto;
    $rest->id_rutina = $datos->id_rutina;

    if ($rest->insertar()) {
        http_response_code(201);
        echo json_encode(array("info" => "Usuario Creado!", "id" => $rest->id, "dni" => $rest->dni, 
        "nombre" => $rest->nombre, "apellidos" => $rest->apellidos, "telefono" => $rest->telefono, 
        "correo" => $rest->correo, "fecha_nacimiento" => $rest->fecha_nacimiento, "contrasena" => $rest->contrasena, 
        "foto" => $rest->foto, "id_rutina" => $rest->id_rutina));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se puede crear"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se puede crear, falta algo!"));
}
?>