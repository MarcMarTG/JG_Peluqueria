
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
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
            ciudadmodelo modelo = new ciudadmodelo();
            List<ciudadmodelo> list = modelo.listarporid(id);
            Iterator<ciudadmodelo> iter = list.iterator();
            ciudadmodelo m = null;
            while (iter.hasNext()) {
                m = iter.next();
            }
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
                            <h1 class="text-center mb-4">MODIFICAR CIUDAD</h1>
                            <form action="../ciudadcontrolador" method="post">
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" readonly name="txtcodigo" id="txtcodigo" class="form-control" value="<%= m.getCodigo()%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control" value="<%= m.getNombre()%>">
                                </div>

                                <button type="submit" name="accion" value="Editar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">EDITAR</button>
                                <a href="../ciudades.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
