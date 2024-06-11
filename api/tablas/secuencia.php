<?php
class Secuencia
{

	private $tabla = "secuencia";
	public $id;
	public $series;
	public $repeticiones;
	public $duracion;
	public $id_ejercicio;
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

	//Función para insertar nuevos restaurantes
	function insertar()
	{
		//Sentencia para insertar los datos
		$stmt = $this->conn->prepare("
		    INSERT INTO " . $this->tabla . "(`series`, `repeticiones`, `duracion`, `id_ejercicio`)
			VALUES(?,?,?,?)");

		//Se eliminan etiquetas HTML
		$this->series = $this->series ? strip_tags($this->series) : NULL;
		$this->repeticiones = $this->repeticiones ? strip_tags($this->repeticiones) : NULL;
		$this->duracion = $this->duracion ? strip_tags($this->duracion) : NULL;
		$this->id_ejercicio = strip_tags($this->id_ejercicio);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iiii", $this->series, $this->repeticiones, $this->duracion, $this->id_ejercicio);

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
			SET series= ?, repeticiones = ?, duracion = ?, id_ejercicio = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->series = $this->series ? strip_tags($this->series) : NULL;
		$this->repeticiones = $this->repeticiones ? strip_tags($this->repeticiones) : NULL;
		$this->duracion = $this->duracion ? strip_tags($this->duracion) : NULL;
		$this->id_ejercicio = strip_tags($this->id_ejercicio);
		$this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iiiii", $this->series, $this->repeticiones, $this->duracion, $this->id_ejercicio, $this->id);

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