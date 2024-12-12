<%-- 
    Document   : modificarusuario
    Created on : 23 abr. 2024, 12:34:28
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
            usuariomodelo modelo = new usuariomodelo();
            List<usuariomodelo> list = modelo.listarporid(id);
            Iterator<usuariomodelo> iter = list.iterator();
            usuariomodelo m = null;
            iter.hasNext();
            m = iter.next();
        %>

        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            MODIFICAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-4">MODIFICAR USUARIO</h1>
                            <form action="../usuariocontrolador" method="post">
                                <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>"> 
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control" value="<%= m.getNombre()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtpass">CONTRASEÑA</label>
                                    <input type="password" name="txtpass" id="txtpass" class="form-control" value="<%= m.getPass()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txttipo">TIPO</label>
                                    <input type="text" name="txttipo" id="txttipo" class="form-control" value="<%= m.getTipo()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtestado">ESTADO</label>
                                    <input type="text" name="txtestado" id="txtestado" class="form-control" value="<%= m.getEstado()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtpersonal">PERSONAL</label>
                                    <input type="text" name="txtpersonal" id="txtpersonal" class="form-control" value="<%= m.getPersonal()%>">
                                </div>
                                <button type="submit" name="accion" value="Editar" class="btn w-30" style="background-color: #014421; border-color: #014421; color: white;">EDITAR</button>
                                <a href="../usuarios.jsp" class="btn w-20" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
