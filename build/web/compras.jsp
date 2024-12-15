<%-- 
    Document   : compras
    Created on : 3 jun. 2024, 19:37:31
    Author     : manu_
--%>

<%@page import="modelo.comprasmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/css.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="plantilla.jsp" %>


        <div class="container-form">
            <main class="container">
                <form action="comprascontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO COMPRAS</h1>
                    <div class = "buttons">
                        <button type="submit" name="accion" value="add" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR UNA NUEVA COMPRA</button>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped text-center">
                        <thead>
                            <tr class="table-dark">
                                <th>Nº</th>
                                <th>FECHA</th>
                                <th>CONDICION</th>
                                <th>ESTADO</th>
                                <th>USUARIO</th>
                                <th>PROVEEDOR</th>
                                <th>APERTURA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                            comprasmodelo modelo = new comprasmodelo();
                                List<comprasmodelo> list = modelo.listarcompras();
                                Iterator<comprasmodelo> iter = list.iterator();
                                comprasmodelo m = null;
                                while (iter.hasNext()) {
                                    m = iter.next();
                            %>
                            <tr class="table-dark">
                                <td><%=m.getIdcompras()%></td>
                                <td><%=m.getFecha()%></td>
                                <td><%=m.getCondicion()%></td>
                                <td><%=m.getEstado()%></td>
                                <td><%=m.getIdusuario()%></td>
                                <td><%=m.getIdproveedor()%></td>
                                <td><%=m.getIdapertura()%></td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </body>
</html>
