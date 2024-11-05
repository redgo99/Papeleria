function openModal() {
  document.getElementById("loginModal").style.display = "flex";
}

function closeModal() {
  document.getElementById("loginModal").style.display = "none";
}

window.onclick = function (event) {
  const modal = document.getElementById("loginModal");
  if (event.target == modal) {
    closeModal();
  }
};

$(document).ready(function () {
  $("#login-form").on("submit", function (event) {
    event.preventDefault();

    $.ajax({
      url: "PHP/login.php",
      type: "POST",
      data: $(this).serialize(),
      success: function (response) {
        try {
          var data = JSON.parse(response);
          if (data.error) {
            $("#error-message").text(data.error).show();
          } else {
            window.location.href = "/Papeleria-JJJA/index.php";
          } 
        } catch (e) {
          console.error("Error al analizar la respuesta:", e);
        }
      },
      error: function () {
        $("#error-message").text("Hubo un error en la solicitud.").show();
      },
    });
  });
});
/* $(document).ready(function () {
  $("#loginForm").on("submit", function (event) {
    event.preventDefault();

    $.ajax({   no actualiza si comenta
      url: "PHP/login.php",
      type: "POST",
      data: $(this).serialize(),
      success: function (response) {
        try {
          var data = JSON.parse(response);
          if (data.error) {
            $("#error-message").text(data.error).show();
          } else if (data.success) {
            
            location.reload();
          }
        } catch (e) {
          console.error("Error al analizar la respuesta:", e);
        }
      },
      error: function () {
        $("#error-message").text("Hubo un error en la solicitud.").show();
      },
    });
  });
});
 */
