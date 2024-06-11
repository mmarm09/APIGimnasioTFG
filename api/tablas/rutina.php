<?php
class Rutina
{
	private $tabla = "rutina";
	public $id;
	public $duracion_semanas;
	public $num_sesiones;
	public $dificultad;
	private $conn;
	//Conexión con la base de datos
	public function __construct($db)
	{
		$this->conn = $db;
	}
	function leer()
	{
		if ($this->id>=0) {
			$stmt = $this->conn->prepare("
			SELECT * FROM " . $this->tabla . " WHERE id = ?");
			$stmt->bind_param("i", $this->id);
		} else { //Si no se le pasa id correcto hace un SELECT masivo
			$stmt = $this->conn->prepare("SELECT * FROM " . $this->tabla);
		}

		//Ejecuta la sentencia
		$stmt->execute();
		$result = $stmt->get_result();
		return $result;
	}
	//Función para insertar nuevas rutinas
	function insertar()
	{
		//Sentencia para insertar los datos
		$stmt = $this->conn->prepare("
		    INSERT INTO " . $this->tabla . "(`duracion_semanas`, `num_sesiones`, `dificultad`)
			VALUES(?,?,?)");
		//Se eliminan etiquetas HTML
		$this->duracion_semanas = strip_tags($this->duracion_semanas);
		$this->num_sesiones = strip_tags($this->num_sesiones);
		$this->dificultad = $this->dificultad ? strip_tags($this->dificultad) : NULL;
		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iis", $this->duracion_semanas, $this->num_sesiones, $this->dificultad);
		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}
		return false;
	}

	//Función para actualizar un restaurante que ya existe
	function actualizar()
	{

		//Sentencia para actualizar los datos
		$stmt = $this->conn->prepare("
		    UPDATE " . $this->tabla . " 
			SET duracion_semanas= ?, num_sesiones = ?, dificultad = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->duracion_semanas = strip_tags($this->duracion_semanas);
		$this->num_sesiones = strip_tags($this->num_sesiones);
		$this->dificultad = $this->dificultad ? strip_tags($this->dificultad) : NULL;
        $this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iisi", $this->duracion_semanas, $this->num_sesiones, $this->dificultad, $this->id);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}

	//Función para eliminar un restaurante
	function borrar()
	{
		//Sentencia para eliminar el restaurante con el id pasado como parámetro
		$stmt = $this->conn->prepare("
			DELETE FROM " . $this->tabla . " 
			WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->id = strip_tags($this->id);

		//Rellena la consulta con el parámetro, donde i especifica el tipo de dato int
		$stmt->bind_param("i", $this->id);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}

}
?>