<%-- 
    Document   : guardarpersonal
    Created on : 23 abr. 2024, 11:57:02
    Author     : manu_
--%>

<%@page import="modelo.personalmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/css.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            body{
                background-image: url('../img/fondo_menu.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                color: white;
            }
        </style>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            GUARDAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-4">AGREGAR UN NUEVO PERSONAL</h1>
                            <form action="../personalcontrolador" method="post">
                                <%  personalmodelo facturaModelo = new personalmodelo();
                                    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
                                    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
                                %>
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" name="txtcodigo" value="<%= nuevoNumeroFactura%>" readonly id="txtcodigo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtapellido">APELLIDO</label>
                                    <input type="text" name="txtapellido" id="txtapellido" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtci">CI</label>
                                    <input type="text" name="txtci" id="txtci" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txttelefono">TELEFONO</label>
                                    <input type="text" name="txttelefono" id="txttelefono" class="form-control">
                                </div>

                                <button type="submit" name="accion" value="Agregar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR</button>
                                <a href="../personales.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
