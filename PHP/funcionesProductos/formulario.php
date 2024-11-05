<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="../../css/estilosEditar.css">
</head>

<body>
    <h2><?php echo isset($_GET['id']) ? "Editar Producto" : "Agregar Producto"; ?></h2>

    <?php
    include '../conexion.php';

    $id = "";
    $codigo_barras = "";
    $nombre = "";
    $stock = "";
    $descripcion = "";
    $precio = "";
    $tipo = "";
    $promocion = "";

    if (isset($_GET['id'])) {
        $id = intval($_GET['id']);
        $sql = "SELECT * FROM producto WHERE codigo_barras = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $resultado = $stmt->get_result();
        $producto = $resultado->fetch_assoc();

        $codigo_barras = $producto['codigo_barras'];
        $nombre = $producto['nombre'];
        $stock = $producto['stock'];
        $descripcion = $producto['descripcion'];
        $precio = $producto['precio'];
        $tipo = $producto['tipo'];
        $promocion = $producto['promocion'];
    }
    ?>

    <form action="procesar_producto.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php echo $id; ?>">

        <label for="codigo_barras">Código de Barras:</label><br>
        <input type="text" id="codigo_barras" name="codigo_barras" value="<?php echo $codigo_barras; ?>"
            required><br><br>

        <label for="nombre">Nombre:</label><br>
        <input type="text" id="nombre" name="nombre" value="<?php echo $nombre; ?>" required><br><br>

        <label for="imagen">Imagen:</label><br>
        <input type="file" id="imagen" name="imagen"><br><br>

        <label for="stock">Stock:</label><br>
        <input type="number" id="stock" name="stock" value="<?php echo $stock; ?>" required><br><br>

        <label for="descripcion">Descripción:</label><br>
        <textarea id="descripcion" name="descripcion" rows="4" cols="50"><?php echo $descripcion; ?></textarea><br><br>

        <label for="precio">Precio:</label><br>
        <input type="number" id="precio" name="precio" step="0.01" value="<?php echo $precio; ?>" required><br><br>

        <label for="tipo">Tipo:</label><br>
        <input type="text" id="tipo" name="tipo" value="<?php echo $tipo; ?>"><br><br>

        <label for="promocion">Promoción:</label><br>
        <input type="number" id="promocion" name="promocion" value="<?php echo $promocion; ?>"><br><br>

        <input type="submit" value="<?php echo isset($_GET['id']) ? 'Actualizar Producto' : 'Agregar Producto'; ?>">
    </form>

    <a href="../productos.php">Volver al listado de Productos</a>
</body>

</html>