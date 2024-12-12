<%-- 
    Document   : modificarcliente
    Created on : 22 abr. 2024, 20:28:26
    Author     : manu_
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clientemodelo"%>
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
            clientemodelo modelo = new clientemodelo();
            List<clientemodelo> list = modelo.listarporid(id);
            Iterator<clientemodelo> iter = list.iterator();
            clientemodelo m = null;
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
                            <h1 class="text-center mb-4">MODIFICAR CLIENTE</h1>
                            <form action="../clientecontrolador" method="post">
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" name="txtcodigo" id="txtcodigo" class="form-control" value="<%= m.getCodigo()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control" value="<%= m.getNombre()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtapellido">APELLIDO</label>
                                    <input type="text" name="txtapellido" id="txtapellido" class="form-control" value="<%= m.getApellido()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtruc">RUC</label>
                                    <input type="text" name="txtruc" id="txtruc" class="form-control" value="<%= m.getRuc()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txttelefono">TELEFONO</label>
                                    <input type="text" name="txttelefono" id="txttelefono" class="form-control" value="<%= m.getTelefono()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtciudad">CIUDAD</label>
                                    <input type="text" name="txtciudad" id="txtciudad" class="form-control" value="<%= m.getCiudad()%>">
                                </div>

                                <button type="submit" name="accion" value="Editar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">EDITAR</button>
                                <a href="../clientes.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
