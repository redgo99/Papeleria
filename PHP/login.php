<?php
session_start();

$error_message = "";
$servername = "localhost";
$username = "root";
$contra = "";
$dbname = "proyecto_mp4_db2";
$port = "33065";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $conn = new mysqli($servername, $username, $contra, $dbname, $port);

    if ($conn->connect_error) {
        die(json_encode(['error' => "Error de conexión: " . $conn->connect_error]));
    }

    $sql = "CALL listarUsuarioPorCorreo('$email', @error)";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($password === $row['contraseña']) {
            $_SESSION['nombre'] = $row['nombre'];
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['email'] = $row['correo'];
            $_SESSION['login_message'] = "Inicio de sesión exitoso " . $_SESSION['user_id'];
            $_SESSION['rol'] = $row['rol'];
            header("Location: /Papeleria-JJJA/index.php");
            exit();
        } else {
            $error_message = "Contraseña incorrecta";

            header("Location: /Papeleria-JJJA/index.php");
            exit();
        }
    } else {
        $error_message = "No existe una cuenta con este correo";

        header("Location: /Papeleria-JJJA/index.php");
        exit();
    }

    $conn->close();
}
?>