<?php
session_start();
session_unset(); // Elimina todas las variables de sesión
session_destroy(); // Destruye la sesión

header("Location: /Papeleria-JJJA/index.php"); // Redirige a la página de inicio
exit(); // Asegúrate de salir del script
?>