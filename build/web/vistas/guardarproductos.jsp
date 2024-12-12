<%-- 
    Document   : guardarproductos
    Created on : 23 abr. 2024, 16:12:12
    Author     : manu_
--%>

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
        
        <div class="container">
            <div class="row">
                 <div class="col-md-3"></div>
                <div class="col-md-7">
                    <br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            GUARDAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-12">AGREGAR UN NUEVO PRODUCTO</h1>

                            <form action="../productoscontrolador" method="post">
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" name="txtcodigo" id="txtcodigo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtcosto">COSTO</label>
                                    <input type="text" name="txtcosto" id="txtcosto" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtprecio">PRECIO</label>
                                    <input type="text" name="txtprecio" id="txtprecio" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtstock">STOCK</label>
                                    <input type="text" name="txtstock" id="txtstock" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtminimo">MINIMO</label>
                                    <input type="text" name="txtminimo" id="txtminimo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtiva">IVA</label>
                                    <input type="text" name="txtiva" id="txtiva" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtproveedor">PROVEEDOR</label>
                                    <input type="text" name="txtproveedor" id="txtproveedor" class="form-control">
                                </div>

                                <button type="submit" name="accion" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR</button>
                                <a href="../productos.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
