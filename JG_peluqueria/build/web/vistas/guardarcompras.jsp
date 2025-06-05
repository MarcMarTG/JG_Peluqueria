
<%@page import="modelo.proveedormodelo"%>
<%@page import="modelo.comprasmodelo"%>
<%@page import="modelo.productosmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                            COMPRAS
                        </div>
                        <div class="card-body">
                            <form action="comprascontrolador" method="post">
                                <%  comprasmodelo facturaModelo = new comprasmodelo();
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
                                                        <td>Nº COMPRAS</td>
                                                        <td><input type="text" class="form-control" name="txtnumero" value="<%= nuevoNumeroFactura%>" readonly></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>CONDICIÓN</td>
                                                        <td>
                                                            <select class="form-select" name="condicion">
                                                                <option value="CONTADO">CONTADO</option>
                                                                <option value="CREDITO">CREDITO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>FECHA</td>
                                                        <td><input type="text" class="form-control" id="txtfecha" name="txtfecha" readonly></td>
                                                    </tr>
                                                    <tr class="table-dark">
                                                        <td>ESTADO</td>
                                                        <td><input type="text" class="form-control" id="txtestado" value="PENDIENTE" readonly></td>
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
                                                        <td><input type="text" class="form-control" name="txtcodigoprov" id="txtcodigo" readonly></td>
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
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div> 
                                </div>    



                                <div class="container2">
                                    <div class="window2">
                                        <div class="table-responsive">
                                            <table class="table table-striped text-center">
                                                <tbody>
                                                    <tr class="table-dark">
                                                        <td>CODIGO</td>
                                                        <td>
                                                            <input type="text" class="form-control" name="txtcodpro" id="txtcodpro" disabled>
                                                            <input type="text" class="form-control" name="txtiva" id="txtiva" hidden>
                                                            <input type="text" class="form-control" name="txtprecio" id="txtprecio" hidden>
                                                        </td>
                                                        <td><button type="button" class="btn w-20" style="background-color: #00214D; border-color: #00214D; color: white;" onclick="mostrarModalp()">BUSCAR</button></td>
                                                        <td><label id="txtnombrepro"></label></td>
                                                        <td>CANTIDAD</td>
                                                        <td><input type="number" class="form-control" name="txtcantidad" id="txtcantidad"></td>
                                                        <td><button type="button" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;" onclick="cargarproducto()">AGREGAR</button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>



                                <div id="miModalp" class="modal">
                                    <div class="modal-contenido2">
                                        <div class="card-header" style="padding-left: 20px; font-size: 26px; text-decoration: bold;">
                                            BUSCADOR DE PRODUCTOS
                                            <span class="cerrar" onclick="cerrarModalp()">&times;</span>
                                        </div>
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr class="table-dark">
                                                    <th>CODIGO</th>
                                                    <th>NOMBRE</th>
                                                    <th>STOCK</th>
                                                    <th>COSTO</th>
                                                    <th>PRECIO</th>
                                                    <th>MINIMO</th>
                                                    <th>IVA</th>
                                                    <th>ACCION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    productosmodelo modelop = new productosmodelo();
                                                    List<productosmodelo> listp = modelop.listar();
                                                    Iterator<productosmodelo> iterp = listp.iterator();
                                                    productosmodelo mp = null;
                                                    while (iterp.hasNext()) {
                                                        mp = iterp.next();
                                                %>
                                                <tr class="table-dark">
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getCodigo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getNombre()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getStock()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getCosto()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getPrecio()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getMinimo()%></span></td>
                                                    <td><span class="dato-input p-2 bg-dark"><%= mp.getIva()%></span></td>
                                                    <td><button type="button" onclick="moverFila(this)" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">SELECCIONAR</button></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>  
                                </div>  


                                <div class="container3">
                                    <div class="window3">
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr class="table-dark">
                                                    <th>CODIGO</th>
                                                    <th>CANTIDAD</th>
                                                    <th>DESCRIPCION</th>
                                                    <th>P.U.</th>
                                                    <th>EXENTA</th>
                                                    <th>5%</th>
                                                    <th>10%</th>
                                                    <th>ACCION</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tablaCuerpo">
                                            </tbody>
                                        </table>
                                    </div> 
                                </div> 


                                <div class="container3">
                                    <div class="window2">
                                        <button type="submit" name="accion" value="guardarcompras" class="btn w-20" style="background-color: #014421; border-color: #014421; color: white;">GUARDAR</button>
                                        <a href="compras.jsp" class="btn w-80" style="background-color: #1E81B0; border-color: #1E81B0; color: white;">REGRESAR</a>
                                    </div>
                                </div>


                            </form>
                        </div>
                    </div>     
                </div>
            </div> 
        </div>
        <script src="js/caja.js"></script>
        <script>
                                                        var fechaActual = new Date();
                                                        var dia = fechaActual.getDate();
                                                        var mes = fechaActual.getMonth();
                                                        var año = fechaActual.getFullYear();
                                                        if (mes <= 9) {
                                                            mes = "0" + mes;
                                                        }
                                                        var fechaFormateada = año + "-" + mes + "-" + dia;
                                                        document.getElementById("txtfecha").value = fechaFormateada.toString();

                                                        function mostrarModal() {
                                                            event.preventDefault();
                                                            document.getElementById("miModal").style.display = "block";
                                                        }

                                                        function cerrarModal() {
                                                            event.preventDefault();
                                                            document.getElementById("miModal").style.display = "none";
                                                        }
                                                        function mostrarModalp() {
                                                            event.preventDefault();
                                                            document.getElementById("miModalp").style.display = "block";
                                                        }

                                                        function cerrarModalp() {
                                                            event.preventDefault();
                                                            document.getElementById("miModalp").style.display = "none";
                                                        }
                                                        function obtenerFilaProveedor(boton) {
                                                            event.preventDefault();

                                                            var fila = boton.parentNode.parentNode;
                                                            var celdas = fila.getElementsByTagName("td");
                                                            var datosFila = [];

                                                            for (var i = 0; i < celdas.length - 1; i++) {
                                                                var valor = celdas[i].querySelector(".dato-input").textContent;
                                                                datosFila.push(valor);
                                                            }
                                                            document.getElementById("txtcodigo").value = datosFila[0];
                                                            document.getElementById("txtnombre").value = datosFila[1];
                                                            document.getElementById("txtci").value = datosFila[2];
                                                            document.getElementById("txttelefono").value = datosFila[3];

                                                            cerrarModal();
                                                        }

                                                        function moverFila(boton) {
                                                            event.preventDefault();
                                                            var fila = boton.parentNode.parentNode;
                                                            var celdas = fila.getElementsByTagName("td")
                                                            var datosFila = [];

                                                            for (var i = 0; i < celdas.length - 1; i++) {
                                                                var valor = celdas[i].querySelector(".dato-input").textContent;
                                                                datosFila.push(valor);
                                                            }
                                                            document.getElementById("txtcodpro").value = datosFila[0];
                                                            document.getElementById("txtnombrepro").textContent = datosFila[1];
                                                            document.getElementById("txtiva").value = datosFila[6];
                                                            document.getElementById("txtprecio").value = datosFila[4];

                                                            cerrarModalp();
                                                            var input = document.getElementById("txtcantidad");
                                                            input.focus();
                                                        }

                                                        function cargarproducto() {
                                                            event.preventDefault();
                                                            var codigo = document.getElementById("txtcodpro").value;
                                                            var nombre = document.getElementById("txtnombrepro").textContent;
                                                            var cantidad = document.getElementById("txtcantidad").value;
                                                            var precio = document.getElementById("txtprecio").value;
                                                            var iva = document.getElementById("txtiva").value;

                                                            if (iva == "0") {
                                                                var exenta = cantidad * precio;
                                                            } else {
                                                                var exenta = "";
                                                            }
                                                            if (iva == "10") {
                                                                var diez = cantidad * precio;
                                                            } else {
                                                                var diez = "";
                                                            }
                                                            if (iva == "5") {
                                                                var cinco = cantidad * precio;
                                                            } else {
                                                                var cinco = "";
                                                            }

                                                            var cuerpoTabla = document.getElementById("tablaCuerpo");
                                                            var fila = document.createElement("tr");

                                                            var celdaCodigo = document.createElement("td");
                                                            var inputCodigo = document.createElement("input");
                                                            inputCodigo.type = "text";
                                                            inputCodigo.value = codigo;
                                                            inputCodigo.name = "codigo[]";
                                                            inputCodigo.classList.add("form-control-plaintext");
                                                            inputCodigo.readOnly = true;
                                                            celdaCodigo.appendChild(inputCodigo);
                                                            fila.appendChild(celdaCodigo);

                                                            var celdaCantidad = document.createElement("td");
                                                            var inputCantidad = document.createElement("input");
                                                            inputCantidad.type = "text";
                                                            inputCantidad.value = cantidad;
                                                            inputCantidad.name = "cantidad[]";
                                                            inputCantidad.classList.add("form-control-plaintext");
                                                            inputCantidad.readOnly = true;
                                                            celdaCantidad.appendChild(inputCantidad);
                                                            fila.appendChild(celdaCantidad);

                                                            var celdaNombre = document.createElement("td");
                                                            var textoNombre = document.createTextNode(nombre);
                                                            celdaNombre.appendChild(textoNombre);
                                                            fila.appendChild(celdaNombre);

                                                            var celdaPrecio = document.createElement("td");
                                                            var inputPrecio = document.createElement("input");
                                                            inputPrecio.type = "text";
                                                            inputPrecio.value = precio;
                                                            inputPrecio.name = "precio[]";
                                                            inputPrecio.classList.add("form-control-plaintext");
                                                            inputPrecio.readOnly = true;
                                                            celdaPrecio.appendChild(inputPrecio);
                                                            fila.appendChild(celdaPrecio);

                                                            var celdaExenta = document.createElement("td");
                                                            var textoExenta = document.createTextNode(exenta);
                                                            celdaExenta.appendChild(textoExenta);
                                                            fila.appendChild(celdaExenta);

                                                            var celdaCinco = document.createElement("td");
                                                            var textoCinco = document.createTextNode(cinco);
                                                            celdaCinco.appendChild(textoCinco);
                                                            fila.appendChild(celdaCinco);

                                                            var celdaDiez = document.createElement("td");
                                                            var textoDiez = document.createTextNode(diez);
                                                            celdaDiez.appendChild(textoDiez);
                                                            fila.appendChild(celdaDiez);

                                                            var celdaBoton = document.createElement("td");
                                                            var boton = document.createElement("button");
                                                            boton.textContent = "Eliminar";
                                                            boton.classList.add("btn", "btn-warning");
                                                            boton.id = "eliminar";
                                                            boton.addEventListener("click", function () {
                                                                var fila = this.parentNode.parentNode;
                                                                fila.remove();
                                                            });
                                                            celdaBoton.appendChild(boton);
                                                            fila.appendChild(celdaBoton);
                                                            cuerpoTabla.appendChild(fila);
                                                        }
        </script>
    </body>
</html>
