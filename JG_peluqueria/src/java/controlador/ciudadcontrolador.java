package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ciudadmodelo;

/**
 *
 * @author User
 */
@WebServlet(name = "ciudadcontrolador", urlPatterns = {"/ciudadcontrolador"})
public class ciudadcontrolador extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //IMPORTANTE AQUI SE BORRA EL CONTENIDO
        }
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
        if (action.equalsIgnoreCase("Agregar")) {
            ciudadmodelo modelo = new ciudadmodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));

            try {
                modelo.guardar();
            } catch (SQLException ex) {
                Logger.getLogger(ciudadcontrolador.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = "ciudades.jsp";

        } else if (action.equalsIgnoreCase("Editar")) {
            ciudadmodelo modelo = new ciudadmodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));
            modelo.modificar();
            acceso = "ciudades.jsp";
        } else if (action.equalsIgnoreCase("delete")) {
            ciudadmodelo modelo = new ciudadmodelo();
            modelo.eliminar(request.getParameter("id"));
            acceso = "ciudades.jsp";
        } else if (action.equalsIgnoreCase("informe")) {
            acceso = "reportes/rptciudad.jsp";
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
