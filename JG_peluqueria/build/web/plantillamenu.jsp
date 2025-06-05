<%-- 
    Document   : plantillamenu
    Created on : 29 may. 2024, 04:50:54
    Author     : manu_
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/css.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <style>

            body{
                background-image: url('img/Mega.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                color: white;
            }
            #logo-img {
                width: 65px;
                height: 65px;
                filter: none;
                opacity: 1;
                background-color: transparent;
            }
            header, footer {
                background-color: #212529;
                padding: 10px;
            }
            footer {
                color: white;
            }
        </style>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("sesion") == null) {
                out.print("<script>location.replace('index.jsp')</script>");
            }
        %>
        <header>
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark" data-bs-theme="dark">
                <div class="container-fluid">
                    <div class="logo-header">
                        <a href="menuprincipal.jsp">
                            <img id="logo-img" src="img/logo_barra.png" alt="logo"/>
                        </a>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Mantenimiento</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                                    <a class="dropdown-item" href="personales.jsp">Personales</a>
                                    <a class="dropdown-item" href="usuarios.jsp">Usuarios</a>
                                    <a class="dropdown-item" href="productos.jsp">Productos</a>
                                    <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                                    <a class="dropdown-item" href="ciudades.jsp">Ciudades</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Compras</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="compras.jsp">Registro de Compras</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Ventas</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="facturaventa.jsp">Generación de Ventas</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Tesorería</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="apertura.jsp">Abrir Caja</a>
                                    <a class="dropdown-item" href="cobros.jsp">Cobrar</a>
                                    <a class="dropdown-item" href="pagos.jsp">Pagar</a>
                                    <a class="dropdown-item" href="cerrar.jsp">Cerrar Caja</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Cerrar Sesión</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="cerrarsesion">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main>

        </main>
        <footer>
            <%
                String usunombre = (String) sesion.getAttribute("usu_nombre");
                String idusuario = (String) sesion.getAttribute("idusuarios");
            %>

            <label id="txtnombre"><%=usunombre%></label>
            <label id="txtid"><%=idusuario%></label>
        </footer>
    </body>
</html>