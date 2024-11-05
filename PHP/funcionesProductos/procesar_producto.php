<?php
include '../conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $codigo_barras = $_POST['codigo_barras'];
    $nombre = $_POST['nombre'];
    $stock = $_POST['stock'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $tipo = $_POST['tipo'];
    $promocion = $_POST['promocion'];

    $imagen = null;
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] == UPLOAD_ERR_OK) {
        $imagen = file_get_contents($_FILES['imagen']['tmp_name']);
    } else {
        // Manejo de error si la imagen no se subió correctamente
        echo "Error al cargar la imagen.";
        exit;
    }

    if ($id) {
        // Actualizar producto
        $sql = "CALL actualizarProducto(?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssbisdsi", $codigo_barras, $nombre, $imagen, $stock, $descripcion, $precio, $tipo, $promocion);
    } else {
        // Insertar nuevo producto
        $sql = "CALL crearProducto(?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssbisdsi", $codigo_barras, $nombre, $imagen, $stock, $descripcion, $precio, $tipo, $promocion);
    }

    // Ejecutar la declaración
    if ($stmt->execute()) {
        // Obtener el valor de error
        $result = $conn->query("SELECT @error AS error");
        $row = $result->fetch_assoc();
        if ($row['error'] == 1) {
            echo "Error al crear/actualizar el producto.";
        } else {
            header("Location: ../productos.php");
        }
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
