<%-- 
    Document   : guardarusuario
    Created on : 23 abr. 2024, 12:34:18
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
                <div class="col-md-6">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            GUARDAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-4">AGREGAR UN NUEVO USUARIO</h1>
                            <form action="../usuariocontrolador" method="post">
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" name="txtcodigo" id="txtcodigo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtpass">CONTRASEÑA</label>
                                    <input type="password" name="txtpass" id="txtpass" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txttipo">TIPO</label>
                                    <input type="text" name="txttipo" id="txttipo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtestado">ESTADO</label>
                                    <input type="text" name="txtestado" id="txtestado" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtpersonal">PERSONAL</label>
                                    <input type="text" name="txtpersonal" id="txtpersonal" class="form-control">
                                </div>

                                <button type="submit" name="accion" value="Agregar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR</button>
                                <a href="../usuarios.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
