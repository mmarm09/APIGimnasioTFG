<?php
$target_dir = "fotosperfil/";
$target_file = $target_dir . basename($_FILES["file"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Comprobar si el archivo es una imagen real
$check = getimagesize($_FILES["file"]["tmp_name"]);
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
if ($_FILES["file"]["size"] > 500000) {
    $uploadOk = 0;
}

// Comprobar formatos permitidos
if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif") {
    $uploadOk = 0;
}

// Intentar subir el archivo
if ($uploadOk == 0) {
    echo json_encode(array("status" => "error", "message" => "File upload failed."));
} else {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
        echo json_encode(array("status" => "success", "url" => $target_file));
    } else {
        echo json_encode(array("status" => "error", "message" => "Error uploading file."));
    }
}
?>
