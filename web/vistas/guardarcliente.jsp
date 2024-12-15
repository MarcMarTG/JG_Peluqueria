<%-- 
    Document   : guardarcliente
    Created on : 22 abr. 2024, 20:28:15
    Author     : manu_
--%>

<%@page import="modelo.clientemodelo"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header">
                            GUARDAR
                        </div>
                        <div class="card-body">
                            <h1 class="text-center mb-4">AGREGAR UN NUEVO CLIENTE</h1>
                            <form action="../clientecontrolador" method="post">
                                <%  clientemodelo facturaModelo = new clientemodelo();
                                    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
                                    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
                                %>
                                <div class="form-group">
                                    <label for="txtcodigo">CÓDIGO</label>
                                    <input type="text" name="txtcodigo" value="<%= nuevoNumeroFactura%>" readonly id="txtcodigo" class="form-control ">
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre">NOMBRE</label>
                                    <input type="text" name="txtnombre" id="txtnombre" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtapellido">APELLIDO</label>
                                    <input type="text" name="txtapellido" id="txtapellido" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtruc">RUC</label>
                                    <input type="text" name="txtruc" id="txtruc" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txttelefono">TELEFONO</label>
                                    <input type="text" name="txttelefono" id="txttelefono" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="txtciudad">ID</label> 
                                    <button type="button" name="btnbuscarciu" onclick="mostrarModal()" class="btn w-20" style="background-color: #00214D; border-color: #00214D; color: white;">BUSCAR</button>
                                    <input type="text" class="form-control" id="txtciudad" name="txtciudad">
                                    <label for="txtciudad">CIUDAD</label>
                                    <input type="text" class="form-control" id="txtciudadnombre" name="txtciudadnombre">
                                </div>

                                <button type="submit" name="accion" value="Agregar" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">AGREGAR</button>
                                <a href="../clientes.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>




                                <div id="miModal" class="modal">
                                    <div class="modal-contenido" id="modal-contenido">
                                        <div class="card-header" style="padding-left: 20px; font-size: 26px; text-decoration: bold;">
                                            BUSCADOR DE CIUDADES
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
                                                    ciudadmodelo modelo = new ciudadmodelo();
                                                    List<ciudadmodelo> list = modelo.listar();
                                                    Iterator<ciudadmodelo> iter = list.iterator();
                                                    ciudadmodelo m = null;
                                                    while (iter.hasNext()) {
                                                        m = iter.next();
                                                %>
                                                <tr class="table-dark">
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getCodigo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getNombre()%></span></td>
                                                    <td><button type="button" onclick="obtenerfilaciu(this)" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">SELECCIONAR</button></td>
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
            <script>

                function mostrarModal() {
                    event.preventDefault();
                    document.getElementById("miModal").style.display = "block";
                }
                function cerrarModal() {
                    event.preventDefault();
                    document.getElementById("miModal").style.display = "none";
                }
                function obtenerfilaciu(boton) {
                    event.preventDefault();

                    var fila = boton.parentNode.parentNode;
                    var celdas = fila.getElementsByTagName("td");
                    var datosFila = [];

                    for (var i = 0; i < celdas.length - 1; i++) {
                        var valor = celdas[i].querySelector(".dato-input").textContent;
                        datosFila.push(valor);
                    }
                    document.getElementById("txtciudad").value = datosFila[0];
                    document.getElementById("txtciudadnombre").value = datosFila[1];
                    cerrarModal();
                }
                </script>

            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


    </body>
</html>
