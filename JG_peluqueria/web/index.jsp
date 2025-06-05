<%@page import="modelo.loginmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css.min.css"/>
        <title>CONTROL DE ACCESO</title>
        <style>
            body{
                background-image: url('img/fondo.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                color: white;
            }
            .card-header h1,
            .form-group label{
                color: white;
            }
            .container{
                margin-top: 100px;
                padding-top: 100px;
            }
            .card-body{
                display: flex;
                align-items: center;
            }
            .card-img{
                width: 300px;
                height: auto;
            }
            .form-control{
                font-size: 18px;
                padding: 10px;
            }
            .card{
                width: 600px;
                margin: 0 auto;
            }
            #logo-img {
                opacity: 1;
                background-color: transparent;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card bg-dark"> <!-- Aplicamos el estilo de fondo de Bootstrap -->
                        <div class="card-body">
                            <img id="logo-img" src="img/logo_login.png" alt="" class="card-img">
                            <form action="logincontrolador" method="post">
                                <div class="form-group">
                                    <label for="txtusuario" class="font-weight-bold">Usuario</label>
                                    <input type="text" name="txtusuario" id="txtusuario" class="form-control" placeholder="Ingrese su usuario">
                                </div>
                                <div class="form-group">
                                    <label for="txtclave" class="font-weight-bold">Contraseña</label>
                                    <input type="password" name="txtclave" id="txtclave" class="form-control" placeholder="Ingrese su contraseña">
                                </div>
                                <br>
                                <button type="submit" name="accion" value="Ingresar" class="btn w-100" style="background-color: #FBCA4C; border-color: #FBCA4C; color: black;">Ingresar</button>

                                <%
                                    loginmodelo m = new loginmodelo();
                                    m = (loginmodelo) request.getAttribute("error");
                                    if (m != null) {
                                        out.print("<div class='alert alert-danger mt-3 text-center'>Usuario no existe</div>");
                                    }
                                %>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
