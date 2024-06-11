<?php
class Usuario
{
	private $tabla = "usuario";
	public $id;
	public $dni;
	public $nombre;
	public $apellidos;
	public $telefono;
	public $correo;
	public $fecha_nacimiento;
	public $contrasena;
	public $foto;
	public $id_rutina;
	private $conn;

	//Conexión con la base de datos
	public function __construct($db)
	{
		$this->conn = $db;
	}

	//Función para leer los datos de los usuarios
	function leer()
	{
		if ($this->id>=0) {
			$stmt = $this->conn->prepare("
			SELECT * FROM " . $this->tabla . " WHERE id = ?");
			$stmt->bind_param("i", $this->id);
		} else { //Si no se le pasa el codigo correcto hace un SELECT masivo
			$stmt = $this->conn->prepare("SELECT * FROM " . $this->tabla);
		}

		//Ejecuta la sentencia
		$stmt->execute();
		$result = $stmt->get_result();
		return $result;
	}

	//Función para insertar nuevos Usuarios
	function insertar()
	{
		//Sentencia para insertar los datos
		$stmt = $this->conn->prepare("
		    INSERT INTO " . $this->tabla . "(`dni`, `nombre`, `apellidos`, `telefono`, `correo`, `fecha_nacimiento`, 
			`contrasena`, `foto`, `id_rutina`) VALUES(?,?,?,?,?,?,?,?,?)");

		//Se eliminan etiquetas HTML
		$this->dni = strip_tags($this->dni);
		$this->nombre = strip_tags($this->nombre);
		$this->apellidos = strip_tags($this->apellidos);
		$this->telefono = strip_tags($this->telefono);
		$this->correo = strip_tags($this->correo);
		$this->fecha_nacimiento = strip_tags($this->fecha_nacimiento);
		$this->contrasena = strip_tags($this->contrasena);
		/*$this->foto = strip_tags($this->foto);
		$this->id_rutina = strip_tags($this->id_rutina);*/
		$this->foto = $this->foto ? strip_tags($this->foto) : NULL;
		$this->id_rutina = $this->id_rutina ? strip_tags($this->id_rutina) : NULL;

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("sssissssi", $this->dni, $this->nombre, $this->apellidos, $this->telefono, $this->correo, 
		$this->fecha_nacimiento, $this->contrasena, $this->foto, $this->id_rutina);

		//Ejecuta la sentencia
		if ($stmt->execute()) {
			return true;
		}

		return false;
	}

	// Función para subir una foto
    function subirFoto($archivo)
    {
        $target_dir = "fotosperfil/";
        $target_file = $target_dir . basename($archivo["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Comprobar si el archivo es una imagen real
        $check = getimagesize($archivo["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }

        // Comprobar si el archivo ya existe
        if (file_exists($target_file)) {
            $uploadOk = 0;
        }

        // Comprobar el tamaño del archivo
        if ($archivo["size"] > 500000) { // Limite de tamaño de archivo (500KB)
            $uploadOk = 0;
        }

        // Comprobar formatos permitidos
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif") {
            $uploadOk = 0;
        }

        // Intentar subir el archivo
        if ($uploadOk == 0) {
            return false;
        } else {
            if (move_uploaded_file($archivo["tmp_name"], $target_file)) {
                return $target_file;
            } else {
                return false;
            }
        }
    }
	
	function actualizar()
	{

		//Sentencia para actualizar los datos
		$stmt = $this->conn->prepare("
		    UPDATE " . $this->tabla . " 
			SET dni = ?, nombre = ?, apellidos = ?, telefono = ?, correo = ?, fecha_nacimiento = ?, contrasena = ?, foto = ?, id_rutina = ? WHERE id = ?");

		//Se eliminan etiquetas HTML
		$this->dni = strip_tags($this->dni);
		$this->nombre = strip_tags($this->nombre);
		$this->apellidos = strip_tags($this->apellidos);
		$this->telefono = strip_tags($this->telefono);
		$this->correo = strip_tags($this->correo);
		$this->fecha_nacimiento = strip_tags($this->fecha_nacimiento);
		$this->contrasena = strip_tags($this->contrasena);
		$this->foto = $this->foto ? strip_tags($this->foto) : NULL;
		$this->id_rutina = $this->id_rutina ? strip_tags($this->id_rutina) : NULL;
		$this->id = strip_tags($this->id);

		//Rellena la consulta con los parámetros, donde s especifica el tipo de dato string e i de int
		$stmt->bind_param("sssissssii", $this->dni, $this->nombre, $this->apellidos, $this->telefono, $this->correo, $this->fecha_nacimiento, $this->contrasena, $this->foto, $this->id_rutina, $this->id);

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