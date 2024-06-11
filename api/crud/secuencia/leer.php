<?php
//Se han activado los ERRORES (displayError) en el servidor!!!
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Rutas de los archivos que necesitamos
include_once '../../basedatos/gimnasio.php';
include_once '../../tablas/secuencia.php';


//Se crea conexión y el objeto Restaurantes
$database = new Gimnasio();
$db = $database->dameConexion();
$act = new Secuencia($db);

//Verificamos que se le está pasando una variable id y no está vacía, en cuyo caso buscará ese id, si no, devuelve -1
//Y mostrará todo
if (isset($_GET['id']) && $_GET['id'])
	$act->id=$_GET['id'];
else
	$act->id=-1;//Mostrará todo

$result = $act->leer();

if($result->num_rows > 0){   
    $listaSecuencias=array(); //Hace un array y dentro otro llamado RESTAURANTES
	while ($secuencia = $result->fetch_assoc()) { //Crea un array asociativo con cada restaurante	
        extract($secuencia);//Exporta las variables de un array
        $datosExtraidos=array(
            "id" => $id,
            "series" => $series,
            "repeticiones" => $repeticiones,            
            "duracion" => $duracion,
			"id_ejercicio" => $id_ejercicio
            ); 
        array_push($listaSecuencias, $datosExtraidos);//Hace un append al final de la lista 
    }    
    http_response_code(200);     
    echo json_encode($listaSecuencias);
}else{     
    http_response_code(404);     
    echo json_encode(
        array("info" => "No se encontraron datos")
    );
} 