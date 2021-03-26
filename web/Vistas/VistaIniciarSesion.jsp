<%-- 
    Document   : login
    Created on : 02-dic-2019, 12:50:04
    Author     : addaw19
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css/style.css">

        <!-- Fuentes -->
        <link href="https://fonts.googleapis.com/css?family=Heebo|Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Montserrat+Subrayada&display=swap" rel="stylesheet">

        <!-- Iconos -->
        <title>Bienvenido al proceso de votaciones del 10N</title>
    </head>
    <body>
        <img class="imglogin" src="../img/logoVotacion.png" alt="Logo de Votaciones">
        <header class="cabecera-login text-center">
            <h1>Bienvenido al proceso de votaciones del 10N</h1>
        </header>
        <section class="banner2">

        </section>
        <section class="container contenedorPrincipal login">
            <h2>Inicio de sesión</h2>
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-8">
                    <form class="needs-validation" novalidate action="../ControladorIniciarSesion" method="POST">
                        <div class="form-row col-lg-12 justify-content-center align-items-center minh-100">
                            <div class="col-md-5 mb-4">
                                <label for="validationCustom01">NIF</label>
                                <input type="text" class="form-control" id="validationCustom01" name="nif" placeholder="NIF" required>
                                <div class="valid-feedback">
                                    ¡Correcto!
                                </div>
                                <div class="invalid-feedback">
                                    ¡Por favor introduce un NIF!
                                </div>
                            </div>
                            <div class="col-md-5 mb-4">
                                <label for="validationCustom02">Contraseña</label>
                                <input type="password" class="form-control" id="validationCustom02" name="password" placeholder="Contraseña" required>
                                <div class="valid-feedback">
                                    ¡Correcto!
                                </div>
                                <div class="invalid-feedback">
                                    ¡Por favor introduce una contraseña!
                                </div>
                            </div>
                        </div>
                        <div class="form-row col-lg-12 justify-content-center align-items-center minh-100">
                            <button class="btn btn-primary" type="submit">Iniciar Sesión</button>
                        </div>
                        <div class="form-row col-lg-12 justify-content-center align-items-center minh-100 infoRegistro">
                            <div class="alert alert-warning" role="alert">
                                Si todavía no estás inscrito <a href="../ControladorCompruebaRegistro" class="alert-link">regístrate</a> aquí.
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </section>
        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
