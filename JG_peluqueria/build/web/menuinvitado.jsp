<%-- 
    Document   : menuinvitado
    Created on : 17 abr. 2024, 11:08:21
    Author     : ALUMNOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/css.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("sesion") == null) {
                out.print("<script>location.replace('index.jsp')</script>");
            }
        %>
        <header>
            <div class="logo-header">
                <a href="menuprincipal.jsp"><img id="logo-img" src="img/logoMM.png" 
                                                 alt="logo"/></a>              
            </div>
            <nav>
                <ul>
                    <li><a href="cerrarsesion">Cerrar Sesión</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h1>BIENVENIDO AL MENUINVITADO!</h1>
        </main>
        <footer>
            <%
                String usunombre = (String) request.getAttribute("usu_nombre");
                String idusuario = (String) request.getAttribute("idusuarios");
            %>

            <label id="txtnombre"><%=usunombre%></label>
            <label id="txtid"><%=idusuario%></label>
        </footer>

    </body>
</html>
