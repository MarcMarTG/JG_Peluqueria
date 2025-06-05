<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>JSP Page</title>
        <style>
            .titulo {
                justify-content: center;
                align-items: center;
                color: white;
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
        <%@ include file="plantillamenu.jsp" %>
     
            <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
                <br><br><br><br><br><br><br><br><br><br><br><br>
                <div class="modal-dialog">
                    <div class="modal-content" id="modalColor">
                        <%
                        String validarcaja = (String) request.getAttribute("validarcaja");
                        if (validarcaja != null && validarcaja.equals("noabrir")) {
                        %>
                        <div class="modal-header">
                            <h5 class="modal-title" id="miModalLabel">CAJA ABIERTA, DEBE CERRAR</h5>
                            <button type="button" class="btn-close" style="background-color: white; border-color: white; color: white;" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <button type="button" class="btn w-20" style="background-color: #B11226; border-color: #B11226; color: white;" data-bs-dismiss="modal">ACEPTAR</button>
                        </div>
                        <% } else if (validarcaja != null && validarcaja.equals("abierta")) { %>
                        <div class="modal-header">
                            <h5 class="modal-title" id="miModalLabel">CAJA ABIERTA CORRECTAMENTE</h5>
                            <button type="button" class="btn-close" style="background-color: white; border-color: white; color: white;" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <button type="button" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;" data-bs-dismiss="modal">ACEPTAR</button>
                        </div>
                        <% } else if (validarcaja != null && validarcaja.equals("cerrada")) { %>
                        <div class="modal-header">
                            <h5 class="modal-title" id="miModalLabel">CAJA CERRADA</h5>
                            <button type="button" class="btn-close"  style="background-color: white; border-color: white; color: white;" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <button type="button" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;" data-bs-dismiss="modal">ACEPTAR</button>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
       
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                <% String validar3 = (String) request.getAttribute("validarcaja");
                if (validar3 != null) { %>
                var myModal = new bootstrap.Modal(document.getElementById('miModal'));
                myModal.show();
                <% } %>
            });
        </script>
    </body>
</html>


