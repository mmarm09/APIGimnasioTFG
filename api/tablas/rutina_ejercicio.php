<?php
class RutinaEjercicio
{

	private $tabla = "rutina_ejercicio";
	public $id_rutina ;
	public $id_ejercicio ;
	public $dia;
	private $conn;

	//Conexión con la base de datos
	public function __construct($db)
	{
		$this->conn = $db;
	}

	function leer()
	{
		if ($this->id_rutina >= 0) {
            $stmt = $this->conn->prepare("SELECT * FROM " . $this->tabla . " WHERE id_rutina = ?");
            $stmt->bind_param("i", $this->id_rutina);
        } else if ($this->id_ejercicio >= 0) {
            $stmt = $this->conn->prepare("SELECT * FROM " . $this->tabla . " WHERE id_ejercicio = ?");
            $stmt->bind_param("i", $this->id_ejercicio);
        }else {
            // Si no se le pasa un parámetro correcto hace un SELECT masivo
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
		    INSERT INTO " . $this->tabla . "(`id_rutina`, `id_ejercicio`, `dia`)
			VALUES(?,?,?)");

		//Se eliminan etiquetas HTML
		$this->id_rutina = strip_tags($this->id_rutina);
		$this->id_ejercicio = strip_tags($this->id_ejercicio);
		$this->dia = strip_tags($this->dia);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iii", $this->id_rutina, $this->id_ejercicio, $this->dia);

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
			SET dia = ? WHERE id_rutina = ? AND id_ejercicio = ?");

		//Se eliminan etiquetas HTML
		$this->dia = strip_tags($this->dia);
		$this->id_rutina = strip_tags($this->id_rutina);
		$this->id_ejercicio = strip_tags($this->id_ejercicio);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("iii", $this->dia, $this->id_rutina, $this->id_ejercicio);

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
			WHERE id_rutina = ? AND id_ejercicio = ?");

		//Se eliminan etiquetas HTML
		$this->id_rutina = strip_tags($this->id_rutina);
		$this->id_ejercicio = strip_tags($this->id_ejercicio);

		//Rellena la consulta con el parámetro, donde i especifica el tipo de dato int
		$stmt->bind_param("ii", $this->id_rutina, $this->id_ejercicio);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}

}
?>