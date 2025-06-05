
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.proveedormodelo;

/**
 *
 * @author manu_
 */
@WebServlet(name = "proveedorcontrolador", urlPatterns = {"/proveedorcontrolador"})
public class proveedorcontrolador extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         
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
        
         String acceso ="";
        String action= request.getParameter("accion");
 
        if(action.equalsIgnoreCase("Agregar")){
            proveedormodelo modelo = new proveedormodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));
            modelo.setRuc(request.getParameter("txtruc"));
            modelo.setTelefono(request.getParameter("txttelefono"));
            modelo.setCorreo(request.getParameter("txtcorreo"));
            modelo.setCiudad(request.getParameter("txtciudad"));
            modelo.guardar();
            acceso="proveedores.jsp";
        }else if(action.equalsIgnoreCase("Editar")){
            proveedormodelo modelo = new proveedormodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));
            modelo.setRuc(request.getParameter("txtruc"));
            modelo.setTelefono(request.getParameter("txttelefono"));
            modelo.setCorreo(request.getParameter("txtcorreo"));
            modelo.setCiudad(request.getParameter("txtciudad"));
            modelo.modificar();
            acceso="proveedores.jsp";
        }else if(action.equalsIgnoreCase("delete")){
            proveedormodelo modelo = new proveedormodelo();
            modelo.eliminar(request.getParameter("id"));
            acceso="proveedores.jsp";
        }else if (action.equalsIgnoreCase("informe")) {
            acceso ="reportes/rptproveedores.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
