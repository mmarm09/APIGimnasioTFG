<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/usuario.php';

$database = new Gimnasio();
$db = $database->dameConexion();
$act = new Usuario($db);

$datos = json_decode(file_get_contents("php://input"));

// Comprobar que los datos no están vacíos
if (!empty($datos->id) && !empty($datos->dni) && !empty($datos->nombre) && !empty($datos->apellidos) 
    && !empty($datos->telefono) && !empty($datos->correo) && !empty($datos->fecha_nacimiento)
    && !empty($datos->contrasena)) {

    // Rellenar el objeto Usuario con los datos
    $act->id = $datos->id;
    $act->dni = $datos->dni;
    $act->nombre = $datos->nombre;
    $act->apellidos = $datos->apellidos;
    $act->telefono = $datos->telefono;
    $act->correo = $datos->correo;
    $act->fecha_nacimiento = $datos->fecha_nacimiento;
    $act->contrasena = $datos->contrasena;
    $act->id_rutina = $datos->id_rutina;

    // Manejar la subida de la foto
    if (isset($_FILES['foto'])) {
        $ruta_foto = $act->subirFoto($_FILES['foto']);
        if ($ruta_foto) {
            $act->foto = $ruta_foto;
        } else {
            http_response_code(400);
            echo json_encode(array("info" => "Error al subir la foto."));
            exit();
        }
    } else {
        $act->foto = $datos->foto; // Conservar la foto existente si no se sube una nueva
    }

    if ($act->actualizar()) {
        http_response_code(200);
        echo json_encode(array("info" => "Usuario actualizado"));
    } else {
        http_response_code(503);
        echo json_encode(array("info" => "No se ha podido actualizar"));
    }

} else {
    http_response_code(400);
    echo json_encode(array("info" => "No se ha podido actualizar. Datos incompletos."));
}
?>
