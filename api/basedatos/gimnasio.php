<?php
//Clase para conectarse con la base de datos
class Gimnasio
{
	//Propiedades para la conexión: dirección del servidor, usuario, contraseña, nombre de la base de datos que se va a utilizar.
	private $host = 'localhost';
	private $user = 'root';
	private $password = "";
	private $database = "gimnasio";

	//Función para la conexión
	public function dameConexion()
	{
		$conn = new mysqli($this->host, $this->user, $this->password, $this->database);
		$conn->set_charset("utf8"); //Para evitar problemas con tildes, ñ y caracteres no estandar
		if ($conn->connect_error) {
			die("Error al conectar con MYSQL" . $conn->connect_error);
		} else {
			return $conn;
		}
	}
}
?>