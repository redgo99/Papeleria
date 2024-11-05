/* document.addEventListener("DOMContentLoaded", cargarProductos);

function cargarProductos() {
  fetch("PHP/productos.php")
    .then((response) => response.json())
    .then((data) => {
      let productosDiv = document.getElementById("cargar_productos");
      productosDiv.innerHTML = "";
      data.forEach((producto) => {
        productosDiv.innerHTML += `
                    <div class="p_producto">
                        <h2>${producto.nombre}</h2>
                        <p>${producto.descripcion}</p>
                        <p>${producto.stock}</p>
                        <p>${producto.tipo}</p>
                        <p>Precio: $${producto.precio}</p> 
                        <button onclick="addToCart('${producto.nombre}', ${producto.precio})">
              Agregar al Carrito
            </button>

                    </div>
                `;
      });
    });
}
 */

async function cargarProductos() {
  
  try {
      const response = await fetch('PHP/obtenerprod.php');
      const html = await response.text();
      document.getElementById('cargar_productos').innerHTML = html;
  } catch (error) {
      console.error("Error al cargar productos:", error);
      document.getElementById('cargar_productos').innerHTML = "Hubo un problema cargando los productos.";
  }

  try {
    const response = await fetch("PHP/obtenerOfertas.php");
    const html = await response.text();
    document.getElementById("cargar_ofertas").innerHTML = html;
  } catch (error) {
    console.error("Error al cargar ofertas:", error);
    document.getElementById("cargar_ofertas").innerHTML = "Hubo un problema cargando los productos.";
  }

}

window.onload = cargarProductos;
