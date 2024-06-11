<?php
class Progreso
{

	private $tabla = "progreso";
	public $id;
	public $peso_kg;
	public $altura_cm;
	public $imc;
	public $fecha;
	public $id_usuario;
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
		    INSERT INTO " . $this->tabla . "(`peso_kg`, `altura_cm`, `imc`, `fecha`, `id_usuario`)
			VALUES(?,?,?,?,?)");

		//Se eliminan etiquetas HTML
		$this->peso_kg = strip_tags($this->peso_kg);
		$this->altura_cm = strip_tags($this->altura_cm);
		$this->imc = strip_tags($this->imc);
		$this->fecha = strip_tags($this->fecha);
		$this->id_usuario = strip_tags($this->id_usuario);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("didsi", $this->peso_kg, $this->altura_cm, $this->imc, $this->fecha, $this->id_usuario);

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
			SET peso_kg= ?, altura_cm = ?, imc = ?, fecha = ?, id_usuario = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->peso_kg = strip_tags($this->peso_kg);
		$this->altura_cm = strip_tags($this->altura_cm);
		$this->imc = strip_tags($this->imc);
		$this->fecha = strip_tags($this->fecha);
		$this->id_usuario = strip_tags($this->id_usuario);
		$this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("didsii", $this->peso_kg, $this->altura_cm, $this->imc, $this->fecha, $this->id_usuario, $this->id);

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