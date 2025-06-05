
<%@page import="modelo.pagosmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.comprasmodelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.proveedormodelo"%>
<%@page import="modelo.modeloabrircaja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>JSP Page</title>
        <style>
            form{

            }
            .container{
                display: flex;
                justify-content: center;
                width: 1000px;
                height: 250px;
                margin-bottom: 10px;
            }
            .container3{
                display: flex;
                justify-content: center;
            }
            .container2{
                display: flex;
                justify-content: center;
            }
            .window2{
                width: 1080px;
                height: 85px;
                border: 1px solid #ccc;
                margin: 10px;
                padding: 10px;
                text-align: center;
            }
            .window{
                width: 1020px;
                height: 240px;
                border: 1px solid #ccc;
                margin: 10px;
                padding: 10px;
                text-align: center;
                overflow: auto;
            }
            .window3{
                width: 1080px;
                height: 200px;
                border: 1px solid #ccc;
                margin: 10px;
                padding: 10px;
                overflow: auto;
            }
            table{
                width: 80%;
                border-collapse: collapse;
            }
            .table2{
                width: 100%;
                border-collapse: collapse;
            }
            th, td{
                padding: 8px;
                text-align: left;
            }
            th{
                background-color: #f2f2f2;
            }
            button{
                margin: 5px;
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
                background-image: url('img/fondo_menu.png');
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 1080px;
                height: 600px;
                overflow: auto;
                text-align: center;
            }
            .modal-contenido2{
                background-image: url('img/fondo_menu.png');
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
            #txtnombrepro{
                width: 250px;
                height: 30px;
                display: inline-block;
            }
            .madre{
                position: flex;
                justify-content: center;
            }
            body{
                background-image: url('img/fondo_menu.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            modeloabrircaja verificar = new modeloabrircaja();
            Object a = sesion.getAttribute("idusuarios");
            verificar.setIdusuario((String) a);
            if (!verificar.validarcaja().equals("ABIERTA")) {
                request.setAttribute("validarcaja", "cerrada");
                request.getRequestDispatcher("../menuprincipal.jsp").forward(request, response);
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <br><br><br>
                    <div class="card text-white bg-dark mb-3" style="max-width:100rem;">
                        <div class="card-header" style="padding-left: 500px; font-size: 24px;">
                            PAGOS
                        </div>
                        <div class="card-body">
                            <form action="pagoscontrolador" method="post">
                                <%  pagosmodelo facturaModelo = new pagosmodelo();
                                    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
                                    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
                                %>
                                <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("codigo")%>">
                                <div class="container">
                                    <div class="window">
                                        <div class="container-form">
                                            <table class="table table-striped text-center">
                                                <tbody>
                                                    <tr class="table-dark">
                                                        <td>N° PAGO</td>
                                                        <td><input type="text" class="form-control" name="txtcodigo" id="txtcodigo" value="<%= nuevoNumeroFactura%>" readonly></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>FECHA</td>
                                                        <td><input type="text" class="form-control" id="txtfecha" name="txtfecha" readonly></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>ESTADO</td>
                                                        <td><input type="text" class="form-control" name="txtestado" value="PENDIENTE" readonly></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="window">
                                        <div class="container-form">
                                            <table class="table table-striped text-center">
                                                <tbody>
                                                    <tr class="table-dark">
                                                        <td>CODIGO</td>
                                                        <td><input type="text" class="form-control" name="txtcodigoprov" id="txtcodigoprov" readonly></td>
                                                        <td><button type="button" class="btn w-20" style="background-color: #00214D; border-color: #00214D; color: white;" name="btnbuscarprov" onclick="mostrarModal()">BUSCAR</button></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>NOMBRE</td>
                                                        <td><input type="text" class="form-control" name="txtnombre" id="txtnombre" readonly></td><td></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>RUC/CI</td>
                                                        <td><input type="text" class="form-control" name="txtci" id="txtci" readonly></td><td></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>TELEFONO</td>
                                                        <td><input type="text" class="form-control" name="txttelefono" id="txttelefono" readonly></td>
                                                            <%
                                                                modeloabrircaja mf = new modeloabrircaja();
                                                                mf.setIdusuario((String) sesion.getAttribute("idusuarios"));
                                                            %>
                                                        <td>
                                                            <input type="hidden" name="txtaper" id="txtaper" value="<%= mf.obtenerultimapertura()%>" readonly>
                                                            <input type="hidden" name="txtusu" id="txtusu" value="<%= sesion.getAttribute("idusuarios")%>" readonly>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>      


                                <div id="miModal" class="modal">
                                    <div class="modal-contenido">
                                        <div class="card-header" style="padding-left: 20px; font-size: 26px; text-decoration: bold;">
                                            BUSCADOR DE PROVEEDOR
                                            <span class="cerrar" onclick="cerrarModal()">&times;</span>
                                        </div>
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr class="table-dark">
                                                    <th>CODIGO</th>
                                                    <th>NOMBRE</th>
                                                    <th>RUC/CI</th>
                                                    <th>TELEFONO</th>
                                                    <th>CORREO</th>
                                                    <th>CIUDAD</th>
                                                    <th>ACCION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    proveedormodelo modelo = new proveedormodelo();
                                                    List<proveedormodelo> list = modelo.listar();
                                                    Iterator<proveedormodelo> iter = list.iterator();
                                                    proveedormodelo m = null;
                                                    while (iter.hasNext()) {
                                                        m = iter.next();
                                                %>
                                                <tr class="table-dark">
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getCodigo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getNombre()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getRuc()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getTelefono()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getCorreo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= m.getCiudad()%></span></td>
                                                    <td><button type="button" onclick="obtenerFilaProveedor(this)" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">SELECCIONAR</button></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                                <div class="container3">
                                    <div class="window3">
                                        <table class="table table-striped text-center">
                                            <thead class="table-dark">
                                                <tr class="table-dark">
                                                    <th>CODIGO</th>
                                                    <th>ESTADO</th>
                                                    <th>CONDICION</th>
                                                    <th>MONTO</th>
                                                    <th>SELECCIONAR</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tablaCuerpo">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                                <div class="container3">
                                    <div class="window2">
                                        <button type="submit" name="accion" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;" value="guardarpago">GUARDAR</button>
                                        <a href="pagos.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>     
                </div>
            </div> 
        </div>                    


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Función para obtener la fecha actual y establecerla en un campo de texto
                var fechaActual = new Date();
                var dia = fechaActual.getDate();
                var mes = fechaActual.getMonth() + 1;
                var año = fechaActual.getFullYear();

                if (mes <= 9) {
                    mes = "0" + mes;
                }

                var fechaFormateada = año + "-" + mes + "-" + dia;
                document.getElementById("txtfecha").value = fechaFormateada.toString();
            });

            // Función para mostrar la ventana modal
            function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }

            // Función para cerrar la ventana modal
            function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }

            // Función para obtener datos de fila de cliente seleccionado
            function obtenerFilaProveedor(boton) {
                event.preventDefault();
                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }

                document.getElementById("txtcodigoprov").value = datosFila[0];
                document.getElementById("txtnombre").value = datosFila[1];
                document.getElementById("txtci").value = datosFila[2];
                document.getElementById("txttelefono").value = datosFila[3];
                cerrarModal();

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "pagoscontrolador", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("tablaCuerpo").innerHTML = xhr.responseText;
                    }
                };

                var params = "accion=buscarFacturasPendientes&proveedorId=" + datosFila[0];
                xhr.send(params);
            }
        </script>
    </body>
</html>
