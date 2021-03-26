<%-- 
    Document   : VistaError
    Created on : 02-dic-2019, 12:20:33
    Author     : addaw19
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String mensaje = request.getParameter("codigo");%>
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
        <title>Mensajes de Error</title>
    </head>
    <body>
        <%if (mensaje.equals("login_no")) {%>
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
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">No has podido iniciar sesión, comprueba bien tus credenciales. <a href="VistaIniciarSesion.jsp"> Vuelve a iniciar sesión</a>.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("Alta Incorrecta")) {%>
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
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">No te has podido registrar, comprueba bien tus credenciales. <a href="../ControladorCompruebaRegistro"> Vuelve a registrarte</a>.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("ya existe este login")) {%>
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
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">El NIF con el que intentas registrarte ya se encuentra dado de alta, por favor comprueba bien tus datos. <a href="../ControladorCompruebaRegistro"> Vuelve a registrarte</a>.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("Ya no puedes darte de alta")) {%>
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
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">Ya no puedes registrarte, las votaciones han comenzado o ya han finalizado.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("Modificacion Incorrecta")) {%>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">La modificación de los datos no ha podido llevarse a cabo <a href="../ControladorDispatcher?opcion=ModificarVotante"> Vuelve a registrarte</a>.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("Baja Incorrecta")) {%>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">La baja de tu perfil no ha podido llevarse a cabo <a href="../ControladorDispatcher?opcion=BajaVotante"> Vuelve a darte de baja</a>.</p>
            </div>
         </section>
        <%}%>
        
        <%if (mensaje.equals("Escrutinio cerrado") || mensaje.equals("Escrutinio abierto") || mensaje.equals("Escrutinio finalizado")) {%>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">No puedes realizar esta acción debido al estado del escrutinio o porque no tienes permisos.</p>
            </div>
         </section>
        <%}%>
        <%if (mensaje.equals("votado_ok")) {%>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Error</h1>
        </header>
        <section class="container contenedorPrincipal">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Mensaje de error</h4>
                <hr>
                <p class="mb-0">No puedes volver a votar otra vez, espera a los resultados.</p>
            </div>
         </section>
        <%}%>
        
        
        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
