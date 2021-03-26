<%-- 
    Document   : VistaEscrutinio
    Created on : 09-dic-2019, 14:11:54
    Author     : addaw19
--%>

<%@page import="Modelo.Parametro"%>
<%@page import="javax.jms.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession Session = (HttpSession) request.getSession();
        Parametro ObjParametro = (Parametro) session.getAttribute("Parametro");
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
        <title>Gestión del escrutinio</title>
    </head>
    <body>
        <jsp:include page="menuPrincipal.jsp" />
        <header class="cabecera text-center">
            <h1>Gestión del escrutinio</h1>
        </header>
        <section class="container contenedorPrincipal">
            <form action="../ControladorEscrutinio" method="POST">
                <div class="card text-center">
                    <div class="card-header">
                        El estado del escrutinio es: <span class="estado" name="estado"><%out.print(ObjParametro.getEstado_escrutinio());%></span>
                    </div>
                    <div class="card-body">
                        <!--<h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>-->

                        <%if (ObjParametro.getEstado_escrutinio().equals("cerrado")) {%>
                            <h5 class="card-title">¿Deseas abrir el escrutinio?</h5>
                            <p class="card-text">Los ciudadanos pueden darse de alta/baja o modificar su información en el sistema de votaciones.</p>
                            <button class="btn btn-primary" type="submit">Abrir escrutinio</button>
                        <%} else {
                            if (ObjParametro.getEstado_escrutinio().equals("abierto")) {%>
                                <h5 class="card-title">¿Deseas finalizar el escrutinio?</h5>
                                <p class="card-text">El proceso de votación está abierto.</p>
                                <button class="btn btn-primary" type="submit">Finalizar escrutinio</button>
                        <%} else {%>
                                <p class="card-text"><%out.println("El escrutinio ha finalizado. Recuento de votos.");%></p>
                                
                        <%        
                          }
                        }%>

                    </div>
                    <div class="card-footer text-muted" id="hora">
                        Elecciones Generales 2019
                    </div>
                </div>
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
