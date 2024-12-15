<%-- 
    Document   : usuarios
    Created on : 23 abr. 2024, 12:34:09
    Author     : manu_
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuariomodelo"%>
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
        <%@ include file="plantilla.jsp" %>
        <div class="container-form">
            <main class="container">
                <form action="usuariocontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO USUARIO</h1>
                    <a href="vistas/guardarusuario.jsp" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">GUARDAR USUARIO</a>
                    <button type="submit" name="accion" value="informe" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">IMPRIMIR</button>
                </form>
                <table class="table table-striped text-center">
                    <thead>
                        <tr class="table-dark">
                            <th>CÓDIGO</th>
                            <th>NOMBRE</th>
                            <th>TIPO</th>
                            <th>ESTADO</th>
                            <th>PERSONAL</th>
                            <th>ACCION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            
                            usuariomodelo modelo = new usuariomodelo();
                            List<usuariomodelo> list = modelo.listar();
                            Iterator<usuariomodelo> iter = list.iterator();
                            usuariomodelo m = null;
                            while (iter.hasNext()) {
                                m = iter.next();
                        %>
                        <tr class="table-dark">
                            <td><%= m.getCodigo()%></td>
                            <td><%= m.getNombre()%></td>
                            <td><%= m.getTipo()%></td>
                            <td><%= m.getEstado()%></td>
                            <td><%= m.getPersonal()%></td>
                            <td>
                                <a href="vistas/modificarusuario.jsp?id=<%= m.getCodigo()%>" class="btn w-50" style="background-color: #00214D; border-color: #00214D; color: white;">EDITAR</a>
                                <form action="usuariocontrolador" method="post">
                                    <input type="hidden" name="accion" value="delete">
                                    <input type="hidden" name="id" value="<%= m.getCodigo()%>">
                                    <button type="submit" class="btn w-50" style="background-color: #B11226; border-color: #B11226; color: white;">ELIMINAR</button>
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </main>
        </div>

    </body>
</html>
