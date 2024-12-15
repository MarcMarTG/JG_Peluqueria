<%-- 
    Document   : cliente
    Created on : 22 abr. 2024, 22:58:33
    Author     : manu_
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
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
                <form action="ciudadcontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO CIUDAD</h1>
                    <div class = "buttons">
                        <a href="vistas/guardar_ciudad.jsp" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">GUARDAR CIUDAD</a>
                        <button type="submit" name="accion" value="informe" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">IMPRIMIR</button>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped text-center">
                        <thead>
                            <tr class="table-dark">
                                <th>CÓDIGO</th>
                                <th>NOMBRE</th>
                                <th>ACCIÓN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                ciudadmodelo modelo = new ciudadmodelo();
                                List<ciudadmodelo> list = modelo.listar();
                                Iterator<ciudadmodelo> iter = list.iterator();
                                ciudadmodelo m = null;
                                while (iter.hasNext()) {
                                    m = iter.next();
                            %>
                            <tr class="table-dark">
                                <td><%= m.getCodigo()%></td>
                                <td><%= m.getNombre()%></td>
                                <td>
                                    <a href="vistas/modificar_ciudad.jsp?id=<%= m.getCodigo()%>" class="btn w-50" style="background-color: #00214D; border-color: #00214D; color: white;">EDITAR</a>
                                    <form action="ciudadcontrolador" method="post">
                                        <input type="hidden" name="accion" value="delete">
                                        <input type="hidden" name="id" value="<%= m.getCodigo()%>">
                                        <button type="submit" class="btn w-50" style="background-color: #B11226; border-color: #B11226; color: white;">ELIMINAR</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>           
            </main>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
