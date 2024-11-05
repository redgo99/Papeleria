/* MODAL CRUDS */

function openProfileModal() {
  document.getElementById("profileModal").style.display = "block";
}

// Función para cerrar el modal
function closeProfileModal() {
  document.getElementById("profileModal").style.display = "none";
}

// Función para redirigir al primer CRUD
function openCrud1() {
  window.location.href = "PHP/productos.php"; // Ruta correcta si está en el mismo directorio
}

// Función para redirigir al segundo CRUD
function openCrud2() {
  window.location.href = "PHP/usuarios.php"; // Reemplaza con la ruta real
}
/* FIN MODAL CRUDS */

/* MODAL PERFIL */
function openPerfilModal() {
  document.getElementById("perfilModal").style.display = "block";
}

function closePerfilModal() {
  document.getElementById("perfilModal").style.display = "none";
}

// Cerrar el modal al hacer clic fuera de él
window.onclick = function (event) {
  const modal = document.getElementById("perfilModal");
  if (event.target === modal) {
    modal.style.display = "none";
  }
};
/* FIN MODAL PERFIL */
