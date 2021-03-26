<%-- 
    Document   : VistaVotar
    Created on : 13-dic-2019, 12:12:00
    Author     : addaw19
--%>

<%@page import="Modelo.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession Session = (HttpSession) request.getSession();
        ArrayList<Partido> ListadoPartidos = (ArrayList) session.getAttribute("ListadoPartidos");
    %>
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
        <title>Votaciones de partidos</title>
    </head>
    <body>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Listado de Partidos de las elecciones</h1>
            <h2>Vota tu partido.</h2>
        </header>
        <section class="container contenedorPrincipal">

            <form action="../ControladorVotarPartido" method="POST">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>DENOMINACIÓN</th>
                            <th>SIGLAS</th>
                            <th style="width: 30%;">LOGO</th>
                            <th class="text-center">VOTA TU PARTIDO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Partido ObjPartido : ListadoPartidos) {%>
                        <tr>
                            <td><%out.print(ObjPartido.getDemonimacion());%></td>
                            <td><%out.print(ObjPartido.getSiglas());%></td>
                            <td><img src="<%out.print(ObjPartido.getLogo());%>"></td>
                            <td class="text-center"><input type="radio" name="partidos" value="<%out.print(ObjPartido.getSiglas());%>" required></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <button class="btn btn-primary float-right" type="submit">Realizar voto</button>
            </form>
        </section>
        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
