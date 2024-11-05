<?php
session_start();

if (isset($_SESSION["email"])) {
  /*  echo ('Bienvenido' . $_SESSION['email']); */
  echo "<script>alert(' Bienvenido  '" . $_SESSION['nombre'] . "');</script>";
  /* unset($_SESSION['email']) */
  ;
} else {

  /*  header("Location: http://localhost/Papeleria-JJJA/index.php"); */
}


?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Papelería Virtual</title>
  <!-- LINK TIPO DE LETRA  "Pacifico", cursive -->
  <link
    href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Fascinate+Inline&family=Pacifico&display=swap"
    rel="stylesheet" />
  <!--  -->

  <link rel="stylesheet" href="Css/estilos.css" />
  <link rel="stylesheet" href="Css/normalize.css" />
  <!--  -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Icono boostrap carrito -->

  <!-- JS -->

  <script src="Js/jquery.js"></script>

  <!-- Cargar Programas -->

  <script src="Js/Busquedas/allOfertas.js"></script>
  <script src="Js/Busquedas/allproductos.js"></script>

  <script
    src="https://sandbox.paypal.com/sdk/js?client-id=ARycnZz_TxwRbhcTSO4kuA1HUdj7uaujYx6KpD5EmGKDm47cei1RpDt8HUQBoM2Y5z6d7laDrd7N9DZC"></script>


</head>

<body>
  <header class="menu">
    <a href="#inicio" style="text-decoration: none; color: inherit">
      <div class="logo">
        <img src="img/Logo.png" alt="No carga wey">
        <p>Papelería</p>
      </div>
    </a>
    <nav>
      <ul>
        <li><a href="#inicio">Inicio</a> |</li>
        <li><a href="#productos">Productos</a> |</li>
        <li><a href="#ofertas">Ofertas</a> |</li>
        <li><a href="#contacto">Contacto</a></li>
      </ul>
    </nav>

    <nav>
      <ul>
        <li>
          <a id="car" href="javascript:void(0)" onclick="openCart()"><i class="bi bi-cart4" id="carr"></i></a> |
        </li>
        <!-- Carrito -->
        <?php if (isset($_SESSION['email'])): ?>
          <?php if ($_SESSION['rol'] === 'admin' || $_SESSION['rol'] === 'Administrador'): ?> <!-- poner Administrador -->
            <li>
              <a href="javascript:void(0);" class="menu-icon" onclick="openProfileModal()">
                <i id="conf" class="bi bi-gear-fill"></i></a>
            </li>
            <li> | </li>
          <?php endif; ?>
          <li>
            <a href="javascript:void(0);" onclick="openPerfilModal()">
              <i id="ins" class="bi bi-person-circle"></i>
            </a>
          </li>
          <li> | </li>
          <li>
            <a href="PHP/logout.php" class="logout-btn">Cerrar Sesión</a>
          </li>
        <?php else: ?>
          <li>
            <a class="open-modal-btn" onclick="openModal()">Iniciar Sesión</a>
          </li>
        <?php endif; ?>
      </ul>
    </nav>
  </header>

  <div class="cont">

    <!-- Inicio -->

    <section class="inicio" id="inicio">
      <div class="carrusel" id="carrusel">
        <img class="carrusel-image" src="img/balso.jpg" alt="Imagen 1" />
        <img class="carrusel-image" src="img/cuaderno.jpg" alt="Imagen 2" />
        <img class="carrusel-image" src="img/images.jpg" alt="Imagen 3" />
      </div>

    </section>

    <!-- Ofertas -->

    <section class="ofertas" id="ofertas">
      <h1>Ofertas</h1>


      <div id="cargar_ofertas">

      </div>
    </section>

    <!-- Productos -->

    <section class="productos" id="productos">
      <h1>Productos</h1>
      <!--  filtro-->
      <div class="filter-container">
        <input type="text" id="search" placeholder="Buscar por nombre o descripción"
          oninput="filtrarproductos()" /><!-- FILTRO POR DESCRIPCION -->
        <i id="sr" class="bi bi-search"></i>
        <select id="category" onchange="filtrarproductos()">
          <!-- HACER SCRIPT DE FILTRO DE PRODUCTOS POR CATEGORIA -->
          <option value="all">Todas las Categorías</option>
          <!-- Aca se agregan  las categorias -->
          <option value="Utiles escolares">Utiles escolares</option>
          <option value="Papeleria">Papeleria</option>
        </select>
      </div>

      <!--filtro  -->

      <div id="cargar_productos">
      </div>

    </section>
    <!-- Contactos -->
    <footer class="contactos" id="contacto">
      <h1>Contáctanos</h1>
      <p>Universidad Católica de Pereira</p>
      <p>Carrera 21 No. 49-95 Av. de las Américas Pereira, Colombia</p>
      <br />
      <a id="xx" href="https://wa.me/573122007849" target="_blank"><i class="bi bi-whatsapp"></i></a>
      <a id="xx" href="https://www.instagram.com/papeleriaucp/" target="_blank"><i class="bi bi-instagram"></i></a>
    </footer>
  </div>


  <script src="Js/sesion.js"></script>
  <!-- loginModal se usa en  el archivo sesion.js -->
  <div id="loginModal" class="modal">
    <div class="modal-content">
      <span class="close-modal-btn" onclick="closeModal()">&times;</span>
      <h2>Iniciar Sesión</h2>

      <div id="error-message" style="color: red; display: none;"></div>

      <form id="loginForm" action="PHP/login.php" method="POST">
        <div class="form-group">
          <label for="email">Correo Electrónico:</label>
          <input type="email" id="email" name="email" required />
        </div>
        <div class="form-group">
          <label for="password">Contraseña:</label>
          <input type="password" id="password" name="password" required />
        </div>
        <button type="submit" class="submit-btn">Entrar</button>
      </form>

      <br>
      <div class="create-account">
        <a href="registrar.php" id="crear">Crear Usuario</a>
      </div>
    </div>
  </div>


  <!-- modal carrito compra -->
  <script src="JS/carrito.js"></script>
  <div id="cartModal" class="modal">
    <div class="modal-content">
      <span class="close-modal-btn" onclick="closeCart()">&times;</span>
      <h2>Carrito de Compras</h2>
      <div id="cartItems">
        <!-- ACA VAN LOS PRODUCTOS QUE SE AGREGEN A CARRITO -->
      </div>
      <p>Total: $<span id="cartTotal">0</span></p>
      <!-- MONTO TOTAL -->
      <div id="paypal-button-container"></div>
      <script>
        paypal.Buttons({
          createOrder: function (data, actions) {
            return actions.order.create({
              purchase_units: [{
                amount: {
                  value: '0.01' // Monto de la transacción
                }
              }]
            });
          },
          onApprove: function (data, actions) {
            return actions.order.capture().then(function (details) {
              alert('Transacción completada por ' + details.payer.name.given_name);
              // Aquí puedes agregar el código para manejar la transacción completada
            });
          },
          onError: function (err) {
            console.error('Error en la transacción:', err);
            // Aquí puedes agregar el código para manejar errores
          }
        }).render('#paypal-button-container');

      </script>
      <button onclick="checkout()" class="submit-btn">Pagar con Nequi</button>
    </div>
  </div>

  <!-- Modal crud -->

  <script src="Js/modals.js"></script>
  <div id="profileModal" class="modal-profile">
    <div class="modal-content">
      <span class="close" onclick="closeProfileModal()">&times;</span>
      <h2>Bienvenido, <?php echo $_SESSION['nombre']; ?></h2> <!-- Muestra el email del usuario -->
      <button onclick="openCrud1()">Crud Productos</button>
      <button onclick="openCrud2()">Crud Usuarios</button>
    </div>
  </div>


  <!-- Modal de Perfil -->
  <div id="perfilModal" class="modal-perfil">
    <div class="modal-content">
      <span class="close-modal-btn" onclick="closePerfilModal()">&times;</span>
      <h2>Perfil de Usuario</h2>
      <p><strong>Nombre:</strong> <?php echo $_SESSION['nombre'] ?? 'Nombre no disponible'; ?></p>
      <p><strong>Correo:</strong> <?php echo $_SESSION['email'] ?? 'Correo no disponible'; ?></p>
    </div>
  </div>
</body>

</html>