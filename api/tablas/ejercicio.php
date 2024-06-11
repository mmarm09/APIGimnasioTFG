<?php
class Ejercicio
{

	private $tabla = "ejercicio";
	public $id;
	public $nombre;
	public $tipo;
	public $complemento;
	public $grupo_muscular;
	public $foto;
	public $foto_detalle;
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
		    INSERT INTO " . $this->tabla . "(`nombre`, `tipo`, `complemento`, `grupo_muscular`, `foto`, `foto_detalle`)
			VALUES(?,?,?,?,?,?)");

		//Se eliminan etiquetas HTML
		$this->nombre = strip_tags($this->nombre);
		$this->tipo = strip_tags($this->tipo);
		$this->complemento = $this->complemento ? strip_tags($this->complemento) : NULL;
		$this->grupo_muscular = $this->grupo_muscular ? strip_tags($this->grupo_muscular) : NULL;
		$this->foto = $this->foto ? strip_tags($this->foto) : NULL;
		$this->foto_detalle = $this->foto_detalle ? strip_tags($this->foto_detalle) : NULL;

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("ssssss", $this->nombre, $this->tipo, $this->complemento, $this->grupo_muscular, $this->foto, $this->foto_detalle);

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
			SET nombre= ?, tipo = ?, complemento = ?, grupo_muscular = ?, foto = ?, foto_detalle = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->nombre = strip_tags($this->nombre);
		$this->tipo = strip_tags($this->tipo);
		$this->complemento = $this->complemento ? strip_tags($this->complemento) : NULL;
		$this->grupo_muscular = $this->grupo_muscular ? strip_tags($this->grupo_muscular) : NULL;
		$this->foto = $this->foto ? strip_tags($this->foto) : NULL;
		$this->foto_detalle = $this->foto_detalle ? strip_tags($this->foto_detalle) : NULL;
		$this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("ssssssi", $this->nombre, $this->tipo, $this->complemento, $this->grupo_muscular, $this->foto, $this->foto_detalle, $this->id);

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