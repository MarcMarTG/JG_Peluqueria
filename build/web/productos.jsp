<%-- 
    Document   : productos
    Created on : 23 abr. 2024, 16:11:54
    Author     : manu_
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.productosmodelo"%>
<%@page import="java.util.List"%>
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
                <form action="productoscontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO PRODUCTOS</h1>
                    <a href="vistas/guardarproductos.jsp" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">GUARDAR PRODUCTO</a>
                    <button type="submit" name="accion" value="informe" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">IMPRIMIR</button>
                </form>
                <table class="table table-striped text-center">
                    <thead>
                        <tr class="table-dark">
                            <th>CÓDIGO</th>
                            <th>NOMBRE</th>    
                            <th>COSTO</th>
                            <th>PRECIO</th>
                            <th>STOCK</th>
                            <th>MINIMO</th>
                            <th>IVA</th>
                            <th>CATEGORIA</th>
                            <th>PROVEEDOR</th>
                            <th>ACCION</th>
                        <tr>  
                    </thead>
                    <tbody>
                        <%                productosmodelo modelo = new productosmodelo();
                            List<productosmodelo> list = modelo.listar();
                            Iterator<productosmodelo> iter = list.iterator();
                            productosmodelo m = null;
                            while (iter.hasNext()) {
                                m = iter.next();

                        %>
                        <tr class="table-dark">
                            <td><%= m.getCodigo()%></td>
                            <td><%= m.getNombre()%></td>
                            <td><%= m.getCosto()%></td>
                            <td><%= m.getPrecio()%></td>
                            <td><%= m.getStock()%></td>
                            <td><%= m.getMinimo()%></td>
                            <td><%= m.getIva()%></td>
                            <td><%= m.getCategoria()%></td>
                            <td><%= m.getProveedor()%></td>
                            <td>
                                <a href="vistas/modificarproductos.jsp?id=<%= m.getCodigo()%>" class="btn w-100" style="background-color: #00214D; border-color: #00214D; color: white;">EDITAR</a>
                                <form action="productoscontrolador" method="post">
                                    <input type="hidden" name="accion" value="delete">
                                    <input type="hidden" name="id" value="<%= m.getCodigo()%>">
                                    <button type="submit" class="btn w-100" style="background-color: #B11226; border-color: #B11226; color: white;">ELIMINAR</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </main>
        </div>
    </body>
</html>
