<%-- 
    Document   : facturaventa
    Created on : 26 may. 2024, 20:52:34
    Author     : manu_
--%>
<%@page import="modelo.facturaventamodelo"%>
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
                <form action="facturacontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO FACTURACION</h1>
                    <div class = "buttons">
                        <button type="submit" name="accion" value="add" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR UNA NUEVA FACTURA</button>
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
                                <th>APERTURA</th>
                                <th>CLIENTE</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%                            facturaventamodelo modelo = new facturaventamodelo();
                            List<facturaventamodelo> list = modelo.listarfacturas();
                            Iterator<facturaventamodelo> iter = list.iterator();
                            facturaventamodelo m = null;
                            while (iter.hasNext()) {
                                m = iter.next();
                        %>
                            <tr class="table-dark">
                                <td><%=m.getIdfacturacion()%></td>
                                <td><%=m.getFecha()%></td>
                                <td><%=m.getCondicion()%></td>
                                <td><%=m.getEstado()%></td>
                                <td><%=m.getIdusuario()%></td>
                                <td><%=m.getIdapertura()%></td>
                                <td><%=m.getCliente()%></td>
                                <td>
                                    <form action="facturacontrolador" method="post"> 
                                    <input type="hidden" name="accion" value="imprimir">
                                    <button type="submit" name="factura" value="<%=m.getIdfacturacion()%>"class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">IMPRIMIR</button>
                                    </form>
                                </td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </body>
</html>
