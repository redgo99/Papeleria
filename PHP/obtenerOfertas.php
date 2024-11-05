<?php
include 'conexion.php';

$query = "CALL productosPromocionMayorUno(@error)";
$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "
            <div class='p_producto'>
                <h3>{$row['nombre']}</h3>
                <p>Img no existe{$row['imagen']}<p>
                <p>Descripción: {$row['descripcion']}</p>
                <p>Precio: $" . number_format($row['precio'], 2) . "</p>
                <p>Stock disponible: {$row['stock']}</p>
                <p>Categoría: {$row['tipo']}</p>
                <p>Promoción: {$row['promocion']}%</p>
                <button id='aggCarrito' onclick=\"addToCart('{$row['nombre']}','{$row['precio']}')\">Agregar al carrito</button>
                
            </div>
        ";
    }
} else {
    echo "<p class='alertaPO'>Actualmente, no hay productos en oferta. ¡Vuelve pronto para ver nuevas promociones!</p>";
}

$conn->close();
?>