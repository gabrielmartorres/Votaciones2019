<%-- 
    Document   : VistaListadoCenso
    Created on : 09-dic-2019, 12:50:11
    Author     : addaw19
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Votante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession Session = (HttpSession) request.getSession();
        ArrayList<Votante> ListadoCenso = (ArrayList) session.getAttribute("ListadoCenso");
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
        <title>Listado del censo</title>
    </head>
    <body>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Listado de Censo</h1>
        </header>
        <section class="container contenedorPrincipal">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">NIF</th>
                        <th scope="col">NOMBRE</th>
                        <th scope="col">APELLIDOS</th>
                        <th scope="col">DOMICILIO</th>
                        <th scope="col">FECHA NACIMIENTO</th>
                        <th scope="col">VOTADO</th>
                        <th scope="col">ROL</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int vuelta = 0;
                    for (Votante ObjVotante : ListadoCenso) {%>
                        <%if (vuelta % 2 == 0) {%>    
                            <tr class="tablefile1">
                        <%} else {%>
                            <tr class="tablefile2">
                        <%}%>
                                <th scope="row"><%out.print(ObjVotante.getNif());%></th>
                                <td><%out.print(ObjVotante.getNombre());%></td>
                                <td><%out.print(ObjVotante.getApellidos());%></td>
                                <td><%out.print(ObjVotante.getDomicilio());%></td>
                                <td><%out.print(ObjVotante.getFechaNacString());%></td>
                                <td><%out.print(ObjVotante.getVotado());%></td>
                                <td><%out.print(ObjVotante.getRol());%></td>
                            </tr>
                        <%vuelta++;
                    }%>
                </tbody>
            </table>
        </section>
        <jsp:include page="footer.jsp" />
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
