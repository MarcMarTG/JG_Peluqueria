
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.comprasmodelo;


@WebServlet(name = "comprascontrolador", urlPatterns = {"/comprascontrolador"})
public class comprascontrolador extends HttpServlet {

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
        String compraId = request.getParameter("txtnumero");
        
        if (action != null) {
            if (action.equalsIgnoreCase("home")) {
                acceso = "index.jsp";
            } else {
                if (action.equalsIgnoreCase("add")) {
                    acceso = "vistas/guardarcompras.jsp";
                } else {
                    if (action.equalsIgnoreCase("guardarcompras")) {
                        comprasmodelo modelo = new comprasmodelo();
                         
                        modelo.setIdcompras(request.getParameter("txtnumero"));
                        System.out.println("ID de compra recibido: " + compraId);
                        modelo.setFecha(request.getParameter("txtfecha"));
                        modelo.setCondicion(request.getParameter("condicion"));

                        String condicion = request.getParameter("condicion");
                        String estado = condicion.equalsIgnoreCase("contado") ? "PENDIENTE" : "PENDIENTE";
                        modelo.setEstado(estado);

                        modelo.setIdusuario(request.getParameter("txtusu"));
                        modelo.setIdapertura(request.getParameter("txtaper"));
                        modelo.setIdproveedor(request.getParameter("txtcodigoprov"));
                        modelo.guardarcompras();
                        String[] codigos = request.getParameterValues("codigo[]");
                        String[] cantidades = request.getParameterValues("cantidad[]");
                        String[] preciosUnitarios = request.getParameterValues("precio[]");

                        for (int i = 0; i < codigos.length; i++) {
                            String codigo = codigos[i];
                            String cantidad = cantidades[i];
                            String precioUnitario = preciosUnitarios[i];
                            modelo.guardardetalle(request.getParameter("txtnumero"), codigo, cantidad, precioUnitario);
                        }
                        acceso = "compras.jsp";
                    } 
                }
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
