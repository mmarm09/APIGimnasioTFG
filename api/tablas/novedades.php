<?php
class Novedades
{

	private $tabla = "novedades";
	public $id;
	public $tipo;
	public $titulo;
	public $descripcion;
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
	/*function insertar()
	{
		//Sentencia para insertar los datos
		$stmt = $this->conn->prepare("
		    INSERT INTO " . $this->tabla . "(`nombre`, `direccion`, `telefono`, `estrellas`)
			VALUES(?,?,?,?)");

		//Se eliminan etiquetas HTML
		$this->nombre = strip_tags($this->nombre);
		$this->direccion = strip_tags($this->direccion);
		$this->telefono = strip_tags($this->telefono);
		$this->estrellas = strip_tags($this->estrellas);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("ssii", $this->nombre, $this->direccion, $this->telefono, $this->estrellas);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}*/

	//Función para actualizar un restaurante que ya existe
	/*function actualizar()
	{

		//Sentencia para actualizar los datos
		$stmt = $this->conn->prepare("
		    UPDATE " . $this->tabla . " 
			SET nombre= ?, direccion = ?, telefono = ?, estrellas = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->nombre = strip_tags($this->nombre);
		$this->direccion = strip_tags($this->direccion);
		$this->telefono = strip_tags($this->telefono);
		$this->estrellas = strip_tags($this->estrellas);
		$this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("ssiii", $this->nombre, $this->direccion, $this->telefono, $this->estrellas, $this->id);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}*/

	//Función para eliminar un restaurante
	/*function borrar()
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
	}*/

}
?>