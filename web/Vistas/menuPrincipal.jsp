<nav class="navbar navbar-expand-lg menu">
            <a class="navbar-brand" href="VistaMenu.jsp"><img src="../img/logoVotacion.png" alt="Logo de Votaciones"></a>
            <button class="navbar-toggler menuc" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link menua" href="VistaMenu.jsp">Inicio<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menua" href="../ControladorDispatcher?opcion=ListadoCenso">Listado General</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menua" href="../ControladorDispatcher?opcion=Escrutinio">Gestionar Escrutinio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menua" href="../ControladorDispatcher?opcion=Votar">Votar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menua" href="../ControladorDispatcher?opcion=Electos">Resultados</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle menua" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Votante
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item menua" href="../ControladorDispatcher?opcion=ModificarVotante">Modificación de datos</a>
                            <a class="dropdown-item menua" href="../ControladorDispatcher?opcion=BajaVotante">Darse de baja</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menua" href="../index.jsp">Salir</a>
                    </li>
                </ul>
            </div>
        </nav>
