<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.cobrosmodelo"%>
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
                <form action="cobroscontrolador" method="post">
                    <br><br><br>
                    <h1>FORMULARIO COBROS</h1>
                    <div class = "buttons">
                        <button type="submit" name="accion" value="add" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR UN NUEVO COBRO</button>
                        <button type="submit" name="accion" value="informe" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">IMPRIMIR</button>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped text-center">
                        <thead>
                            <tr class="table-dark">
                                <th>Nº</th>
                                <th>FECHA</th>
                                <th>ESTADO</th>
                                <th>CLIENTE</th>
                                <th>APERTURA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                
                                cobrosmodelo modelo = new cobrosmodelo();
                                List<cobrosmodelo> list = modelo.listarCobros();
                                Iterator<cobrosmodelo> iter = list.iterator();
                                cobrosmodelo m = null;
                                while (iter.hasNext()) {
                                    m = iter.next();
                            %>
                            <tr class="table-dark">
                                <td><%= m.getCodigo()%></td>
                                <td><%= m.getFecha()%></td>
                                <td><%= m.getEstado()%></td>
                                <td><%= m.getIdclientes()%></td>
                                <td><%= m.getIdapertura()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>           
            </main>
        </div>
    </body>
</html>