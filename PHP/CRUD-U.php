<?php
$metodo = $_SERVER['REQUEST_METHOD'];
//echo ($metodo);

$datos = json_decode(file_get_contents("php://input"), true);

//CRUD Usuarios
if ($metodo == "GET") {
    include('conexion.php');
    if(isset($datos['id'])){
        $query = "select * FROM usuario WHERE id =  '$datos[id]'";

    }else{
        $query = "select * from usuario";
    }
  
    $resultado = $conn->query($query);
    $datos = array();
    while ($fila = $resultado->fetch_assoc()) {
        $datosi[] = $fila;
    }
    $respuesta = json_encode($datosi);
    header('Content-Type: application/json');
    echo $respuesta;
    $conn->close();
}
//Crear Usuario
if ($metodo == "POST") {
    include('conexion.php');
    $tabla = $datos['table'];
    if ($tabla == "usuario") {
        $ced = $datos['cedula'];
        $name = $datos['nombre'];
        $email = $datos['correo'];
        $contr = $datos['contraseña'];
        $cel = $datos['celular'];
        $dir = $datos['direccion'];
        $rol = $datos['rol'];

        $query = "CALL crearUsuario('$ced', '$name', '$email', '$contr', '$cel', '$dir', '$rol', @error)";
        $conn->query($query);

        // Consulta para obtener el valor de @error y almacenarlo en $pp
        $result = $conn->query("SELECT @error AS error");
        $row = $result->fetch_assoc();
        $pp = $row['error'];

        if ($pp == 0) {
            $respuesta = "Usuario insertado correctamente";
        } else {
            $respuesta = "Error: " . $pp;
        }
    }
    $conn->close();
    header('Content-Type: application/json');
    echo json_encode(['respuesta' => $respuesta]);
}
//Borrar Usuario
if ($metodo == "DELETE") {
    include('conexion.php');
    $tabla = $datos['table'];

    if ($tabla == "usuario") {
        $id = $datos['id'];

        // Llama al procedimiento almacenado que establece @error
        $query = "CALL borrarUsuario('$id', @error)";
        $conn->query($query);

        // Consulta para obtener el valor de @error y almacenarlo en $pp
        $result = $conn->query("SELECT @error AS error");
        $row = $result->fetch_assoc();
        $pp = $row['error'];

        // Verifica el valor de $pp
        if ($pp == 0) {
            $respuesta = "Usuario eliminado";
        } else {
            $respuesta = "Error: " . $pp;
        }
    }
    $conn->close();
    header('Content-Type: application/json');
    echo $respuesta;
}
//Actulizar usuario
if ($metodo == "PUT") {
    include('conexion.php');
    $tabla = $datos['table'];
    if ($tabla == "usuario") {
        $ced = $datos['cedula'];
        $name = $datos['nombre'];
        $email = $datos['correo'];
        $contr = $datos['contraseña'];
        $cel = $datos['celular'];
        $dir = $datos['direccion'];
        $rol = $datos['rol'];

        // Ejecuta la llamada al procedimiento almacenado
        $query = "CALL actualizarUsuario('$ced', '$name', '$email', '$contr', '$cel', '$dir', '$rol', @error)";
        $conn->query($query);

        // Consulta para obtener el valor de @error
        $result = $conn->query("SELECT @error AS error");
        $row = $result->fetch_assoc();
        $pp = $row['error'];

        if ($pp == 0) {
            $respuesta = "Actualizo";
        } else {
            $respuesta = "Error: " . $conn->error;
        }
    }
    $conn->close();
    header('Content-Type: application/json');
    echo json_encode($respuesta);
}

?>