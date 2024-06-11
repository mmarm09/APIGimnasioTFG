<?php
//Se han activado los ERRORES (displayError) en el servidor!!!
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/rutina_ejercicio.php';


//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$act = new RutinaEjercicio($db);

//Verificamos que se le está pasando una variable id y no está vacía, en cuyo caso buscará ese id, si no, devuelve -1
//Y mostrará todo
if (isset($_GET['id_rutina']) && $_GET['id_ejercicio']) {
    $act->id_rutina = $_GET['id_rutina'];
    $act->id_ejercicio = -1;
} else if (isset($_GET['id_rutina']) && $_GET['id_ejercicio']) {
    $act->id_ejercicio = $_GET['id_ejercicio'];
    $act->id_rutina = -1;
} else {
    $act->id_rutina = -1; // Mostrará todo
    $act->id_ejercicio = -1;
}

$result = $act->leer();

if($result->num_rows > 0){   
    $listaRutinaEjercicio=array(); //Hace un array y dentro otro llamado RESTAURANTES
	while ($rutinaEjercicio = $result->fetch_assoc()) { //Crea un array asociativo con cada restaurante	
        extract($rutinaEjercicio);//Exporta las variables de un array
        $datosExtraidos=array(
            "id_rutina" => $id_rutina,
            "id_ejercicio" => $id_ejercicio,
            "dia" => $dia
            ); 
        array_push($listaRutinaEjercicio, $datosExtraidos);//Hace un append al final de la lista 
    }    
    http_response_code(200);     
    echo json_encode($listaRutinaEjercicio);
}else{     
    http_response_code(404);     
    echo json_encode(
        array("info" => "No se encontraron datos")
    );
} 