<%-- 
    Document   : cerrar
    Created on : 20 may. 2024, 21:09:48
    Author     : manu_
--%>

<%@page import="modelo.modeloabrircaja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/css.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .titulo{
                justify-content: center;
                align-items: center;
                color: white;
            }
            .modalnn{
                background-color: #212529;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #212529;
                width: 80%;
                max-width: 400px;
            }
            #miModalLabel{
                color: white;
            }
            #modalColor{
                background-color: #212529;
            }
        </style>
    </head>
    <body>

        <%@ include file="plantilla.jsp" %>

        <% modeloabrircaja m = new modeloabrircaja();
            Object p = sesion.getAttribute("idusuarios");
            m.setIdusuario(p.toString());
            if (m.validarcaja().equals("CERRADA")) {
                request.setAttribute("validarcaja", "cerrado");
                out.print("<script>location.replace('menuprincipal.jsp')</script>");
            }
        %>

        <br><br><br><br><br><br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-4">CERRAR CAJA</h1>
                            <form action="abrircajacontrolador" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("idusuarios")%>">
                                    <label for="txtmontocierre">Ingrese un monto</label>
                                    <input type="number" name="txtmontocierre" id="txtmontocierre" class="form-control">
                                </div>

                                <div class = "buttons">
                                    <button type="button" class="btn w-20" style="background-color: #B11226; border-color: #B11226; color: white;" data-bs-toggle="modal" data-bs-target="#miModal">CERRAR CAJA</button>
                                </div>


                                <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
                                    <br><br><br><br><br><br><br><br><br><br><br><br>
                                    <div class="modal-dialog">
                                        <div class="modal-content" id="modalColor">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="miModalLabel">¿Desea Cerrar la Caja?</h5>
                                                <button type="button" class="btn-close" style="background-color: white; border-color: white; color: white;" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body text-center">
                                                <button type="submit" name="accion" value="cerrar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">SI</button>
                                                <button type="button" class="btn w-20" style="background-color: #B11226; border-color: #B11226; color: white;" data-bs-dismiss="modal">NO</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
        <script src="js/caja.js"></script>
    </body>
</html>
