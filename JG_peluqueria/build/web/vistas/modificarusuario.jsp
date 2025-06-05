<%-- 
    Document   : modificarusuario
    Created on : 23 abr. 2024, 12:34:28
    Author     : manu_
--%>

<%@page import="modelo.personalmodelo"%>
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
            .modal{
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
            }
            .modal-contenido{
                background-image: url('../img/fondo_menu.png');
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 1080px;
                height: 600px;
                overflow: auto;
                text-align: center;
            }
            .cerrar{
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }
            .cerrar:hover,
            .cerrar:focus{
                color: #000;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <%
                String id = request.getParameter("id");
                usuariomodelo modelo = new usuariomodelo();
                List<usuariomodelo> list = modelo.listarporid(id);
                usuariomodelo m = null;
                if (list.size() > 0) {
                    m = list.get(0);
                }
            %>
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
                                <input type="hidden" readonly name="txtcodigo" value="<%= m != null ? m.getCodigo() : ""%>">
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input readonly type="text" name="txtcodigo" id="txtcodigo" class="form-control" value="<%= m != null ? m.getCodigo() : ""%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control" value="<%= m != null ? m.getNombre() : ""%>">
                                </div>
                                <div class="form-group">
                                    <label for="txtpass">CONTRASEÑA</label>
                                    <input type="password" name="txtpass" id="txtpass" class="form-control" value="<%= m != null ? m.getPass() : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="tipo" class="form-label">TIPO</label>
                                    <select name="tipo" id="tipo" class="form-select bg-dark text-white border-light">
                                        <option value="ADMINISTRADOR">ADMINISTRADOR</option>
                                        <option value="INVITADO">INVITADO</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="estado" class="form-label">ESTADO</label>
                                    <select name="estado" id="estado" class="form-select bg-dark text-white border-light">
                                        <option value="ACTIVO">ACTIVO</option>
                                        <option value="INACTIVO">INACTIVO</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="txtpersonal">ID</label> 
                                    <button type="button" name="btnbuscarper" onclick="mostrarModal()" class="btn w-20" style="background-color: #00214D; border-color: #00214D; color: white;">BUSCAR</button>
                                    <input type="text" class="form-control" id="txtpersonal" name="txtpersonal" value="<%= m != null ? m.getPersonal() : ""%>">
                                    <label for="txtpersonal">PERSONAL</label>
                                    <input type="text" class="form-control" id="txtpernombre" name="txtpernombre" value="<%= m != null ? m.getPersonalnombre() : ""%>">
                                </div>
                                <button type="submit" name="accion" value="Editar" class="btn w-30" style="background-color: #014421; border-color: #014421; color: white;">EDITAR</button>
                                <a href="../usuarios.jsp" class="btn w-20" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>


                                <div id="miModal" class="modal">
                                    <div class="modal-contenido" id="modal-contenido">
                                        <div class="card-header" style="padding-left: 20px; font-size: 26px; text-decoration: bold;">
                                            BUSCADOR DE PERSONALES
                                            <span class="cerrar" onclick="cerrarModal()">&times;</span>
                                        </div>
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr class="table-dark">
                                                    <th>CODIGO</th>
                                                    <th>NOMBRE</th>
                                                    <th>ACCION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    personalmodelo modelo2 = new personalmodelo();
                                                    List<personalmodelo> list2 = modelo2.listar2();
                                                    Iterator<personalmodelo> iter = list2.iterator();
                                                    personalmodelo m2 = null;
                                                    while (iter.hasNext()) {
                                                        m2 = iter.next();
                                                %>
                                                <tr class="table-dark">
                                                    <td><span class="dato-input p-2 bg-dark"><%= m2.getCodigo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m2.getNombrecompleto()%></span></td>
                                                    <td><button type="button" onclick="obtenerfilaper(this)" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">SELECCIONAR</button></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>  
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script>

            function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }
            function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }
            function obtenerfilaper(boton) {
                event.preventDefault();

                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }
                document.getElementById("txtpersonal").value = datosFila[0];
                document.getElementById("txtpernombre").value = datosFila[1];
                cerrarModal();
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    </body>
</html>
