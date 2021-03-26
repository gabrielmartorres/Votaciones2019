<%-- 
    Document   : VistaMensajeVotar
    Created on : 27-dic-2019, 17:17:01
    Author     : Gabriel
--%>

<%@page import="Modelo.Votante"%>
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
        <title>Mensajes</title>
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
            <h1>Información</h1>
        </header>
        <section class="container contenedorPrincipal">
            <%
                if (mensaje.equals("voto_ok")) {
                    HttpSession Session = (HttpSession) request.getSession();
                    Votante OVotante = (Votante) Session.getAttribute("Votante");
            %>
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Mensaje de información</h4>
                <hr>
                <p class="mb-0"><%out.println(OVotante.getNombre() + " su voto ha sido registrado, gracias.");%></p>
            </div>
            <%
            }
            if (mensaje.equals("alta_ok")) {
            %>
                <div class="alert alert-success" role="alert">
                    <h4 class="alert-heading">Mensaje de información</h4>
                    <hr>
                    <p class="mb-0"><%out.println("Te has dado de alta.");%><a href="VistaIniciarSesion.jsp"> Inicia sesión</a>.</p>
                </div>
            <%    
            }
            if (mensaje.equals("baja_ok")) {
                HttpSession Session = (HttpSession) request.getSession();
                Votante OVotante = (Votante) Session.getAttribute("Votante");
            %>
                <div class="alert alert-success" role="alert">
                    <h4 class="alert-heading">Mensaje de información</h4>
                    <hr>
                    <p class="mb-0"><%out.println(OVotante.getNombre() + " su perfil ha sido dado de baja.");%></p>
                </div>
            <%
            }%>

        </section>
        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>

