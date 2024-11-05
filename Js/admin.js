document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("enviar").addEventListener("click", function () {
    // Recoger datos del formulario
    const cedula = document.getElementById("cedula").value;
    const nombre = document.getElementById("nombre").value;
    const correo = document.getElementById("email").value;
    const contraseña = document.getElementById("contraseña").value;
    const celular = document.getElementById("celular").value;
    const direccion = document.getElementById("direccion").value;
    const rol = document.querySelector('input[name="rol"]:checked').value;

    // Crear objeto de datos
    const datos = {
      table: "usuario",
      cedula: cedula,
      nombre: nombre,
      correo: correo,
      contraseña: contraseña,
      celular: celular,
      direccion: direccion,
      rol: rol,
    };

    // Enviar solicitud POST
    fetch("PHP/CRUD-U.php", {
      // Cambia 'ruta/a/tu/archivo.php' por la ruta de tu archivo PHP
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(datos),
    })
      .then((response) => response.json())
      .then((data) => {
        const mensajeEmergente = document.getElementById("mensajeEmergente");
        //alert(data.respuesta);
        // Mostrar la respuesta al usuario
        if (data.respuesta == "Error: 1") {
          mensajeEmergente.innerText = "Error al crear usuario, tipo:\n" + data.respuesta;
          mensajeEmergente.style.backgroundColor = "var(--rojo)";
        } else {
          mensajeEmergente.innerText = "" + data.respuesta;
          mensajeEmergente.style.backgroundColor = "var(--verde)";
          setTimeout(() => {
            window.location.href = "index.php"; // Cambia "index.html" a la URL de tu página de inicio
          }, 2000);
        }

        mensajeEmergente.style.display = "block";

        setTimeout(() => {
          mensajeEmergente.style.display = "none";
        }, 3000);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});
