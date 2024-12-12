<%-- 
    Document   : modificarproductos
    Created on : 23 abr. 2024, 16:12:19
    Author     : manu_
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.productosmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/css.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <title>JSP Page</title>
        <style>
            body{
                background-image: url('../img/fondo_menu.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                color: white;
            }
        </style>
    </head>
    <body>

        <%
            String id = request.getParameter("id");
            productosmodelo modelo = new productosmodelo();
            List<productosmodelo> list = modelo.listarporid(id);
            Iterator<productosmodelo> iter = list.iterator();
            productosmodelo m = null;
            iter.hasNext();
            m = iter.next();
        %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-7">
                    <br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            MODIFICAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-12">MODIFICAR PRODUCTO</h1>


                            <form action="../productoscontrolador" method="post">
                                <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>"> 
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control" value="<%= m.getNombre()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtcosto">COSTO</label>
                                    <input type="text" name="txtcosto" id="txtcosto" class="form-control" value="<%= m.getCosto()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtprecio">PRECIO</label>
                                    <input type="text" name="txtprecio" id="txtprecio" class="form-control" value="<%= m.getPrecio()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtstock">STOCK</label>
                                    <input type="text" name="txtstock" id="txtstock" class="form-control" value="<%= m.getStock()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtminimo">MINIMO</label>
                                    <input type="text" name="txtminimo" id="txtminimo" class="form-control" value="<%= m.getMinimo()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtiva">IVA</label>
                                    <input type="text" name="txtiva" id="txtiva" class="form-control" value="<%= m.getIva()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtproveedor">PROVEEDOR</label>
                                    <input type="text" name="txtproveedor" id="txtproveedor" class="form-control" value="<%= m.getProveedor()%>">
                                </div>
                                <button type="submit" name="accion" value="Editar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">EDITAR</button>
                                <a href="../productos.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
