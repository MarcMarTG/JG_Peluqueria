
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.comprasmodelo;
import modelo.pagosmodelo;

/**
 *
 * @author manu_
 */
@WebServlet(name = "pagoscontrolador", urlPatterns = {"/pagoscontrolador"})
public class pagoscontrolador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String acceso = "";
        String action = request.getParameter("accion");

        if (action != null) {
            if (action.equalsIgnoreCase("home")) {
                acceso = "index.jsp";
            } else if (action.equalsIgnoreCase("add")) {
                acceso = "vistas/guardarpagos.jsp";
            } else if (action.equalsIgnoreCase("guardarpago")) {
                pagosmodelo modelo = new pagosmodelo();
                modelo.setCodigo(request.getParameter("txtcodigo"));
                modelo.setFecha(request.getParameter("txtfecha"));
                modelo.setEstado("PAGADO");
                modelo.setIdproveedores(request.getParameter("txtcodigoprov"));
                modelo.setIdapertura(request.getParameter("txtaper"));
                modelo.guardarpago();

                // Obtener los IDs de las facturas seleccionadas
                String[] facturasSeleccionadas = request.getParameterValues("facturasSeleccionadas");

                if (facturasSeleccionadas != null) {
                    for (String facturaId : facturasSeleccionadas) {
                        // Obtener el monto correspondiente a la factura seleccionada
                        String monto = request.getParameter("monto_" + facturaId);
                        // Guardar el detalle del cobro
                        modelo.guardardetalle(facturaId, request.getParameter("txtcodigo"), monto);
                    }
                }
                acceso = "pagos.jsp";
            } else if (action.equalsIgnoreCase("buscarFacturasPendientes")) {
                String proveedorId = request.getParameter("proveedorId");
                pagosmodelo modelo = new pagosmodelo();
                List<comprasmodelo> facturasPendientes = modelo.obtenerFacturasPendientes(proveedorId);

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                for (comprasmodelo factura : facturasPendientes) {
                    out.println("<tr>");
                    out.println("<td><span class='dato-input'>" + factura.getIdcompras()+ "</span></td>");
                    out.println("<td><span class='dato-input'>" + factura.getEstado() + "</span></td>");
                    out.println("<td><span class='dato-input'>" + factura.getCondicion() + "</span></td>");
                    out.println("<td><input type='text' name='monto_" + factura.getIdcompras() + "' value='" + factura.getMonto() + "'></td>");
                    out.println("<td><input type='checkbox' name='facturasSeleccionadas' value='" + factura.getIdcompras() + "'></td>");
                    out.println("</tr>");
                }
                return;
            } else if (action.equalsIgnoreCase("informe")) {
                acceso = "reportes/rptpagos.jsp";
            }
        }

        if (!acceso.equals("")) {
            RequestDispatcher vista = request.getRequestDispatcher(acceso);
            vista.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
