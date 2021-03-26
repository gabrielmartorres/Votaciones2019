<%-- 
    Document   : VistaAltaVotante
    Created on : 02-dic-2019, 0:00:40
    Author     : Gabriel
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
        <title>Registro del votante</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg menu">
            <a class="navbar-brand" href="VistaIniciarSesion.jsp"><img src="../img/logoVotacion.png" alt="Logo de Votaciones"></a>
            <button class="navbar-toggler menuc" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item" active>
                        <a class="nav-link menua" href="../index.jsp">Salir</a>
                    </li>
                </ul>
            </div>
        </nav>
        <header class="cabecera text-center">
            <h1>Registro del votante</h1>
        </header>
        <section class="container contenedorPrincipal">
            <form class="needs-validation" novalidate action="../ControladorAltasVotante" method="POST">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">NIF</label>
                        <input type="text" class="form-control" id="validationCustom01" name="nif" placeholder="NIF" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>   
                        <div class="invalid-feedback">
                            ¡Por favor introduce un NIF!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom02">Nombre</label>
                        <input type="text" class="form-control" id="validationCustom02" name="nombre" placeholder="Nombre" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>
                        <div class="invalid-feedback">
                            ¡Por favor introduce un nombre!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom03">Apellidos</label>
                        <input type="text" class="form-control" id="validationCustom03" name="apellidos" placeholder="Apellidos" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>
                        <div class="invalid-feedback">
                            ¡Por favor introduce unos apellidos!
                        </div>
                    </div>    
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom04">Domicilio</label>
                        <input type="text" class="form-control" id="validationCustom04" name="domicilio" placeholder="Domicilio" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>
                        <div class="invalid-feedback">
                            ¡Por favor introduce un domicilio!
                        </div>
                    </div>   
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom05">Fecha de nacimiento</label>
                        <input type="date" class="form-control" id="validationCustom05" name="fechaNac" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>
                        <div class="invalid-feedback">
                            ¡Por favor introduce una fecha de nacimiento!
                        </div>
                    </div>    
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom06">Contraseña</label>
                        <input type="password" class="form-control" id="validationCustom06" name="password" placeholder="Contraseña" required>
                        <div class="valid-feedback">
                            ¡Correcto!
                        </div>
                        <div class="invalid-feedback">
                            ¡Por favor introduce una contraseña!
                        </div>
                    </div> 

                    <button class="btn btn-primary" type="submit">Aceptar</button>
            </form>
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
