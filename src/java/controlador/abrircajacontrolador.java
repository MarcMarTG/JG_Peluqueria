
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.modeloabrircaja;

/**
 *
 * @author manu_
 */
@WebServlet(name = "abrircajacontrolador", urlPatterns = {"/abrircajacontrolador"})
public class abrircajacontrolador extends HttpServlet {

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
       String acceso = "";
       String action = request.getParameter("accion");
       LocalDate fechaActual = LocalDate.now();
       DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       String fechaFormateada = fechaActual.format(formato);
       if(action != null){
           if (action.equalsIgnoreCase("abrir")){
               modeloabrircaja modelo = new modeloabrircaja();
               modelo.setIdusuario(request.getParameter("lblcodigo"));
               if(modelo.validarcaja().equals("ABIERTA")){
                   request.setAttribute("validarcaja", "noabrir");
                   acceso = "menuprincipal.jsp";
               }else{
                   if(modelo.validarcaja().equals("CERRADA")){
                       modelo.setFechai(fechaFormateada);
                       modelo.setMontoi(request.getParameter("txtmonto"));
                       modelo.setIdusuario(request.getParameter("lblcodigo"));
                       modelo.abrirCaja();
                       request.setAttribute("validarcaja", "abierta");
                       acceso = "menuprincipal.jsp";
                   }
               }
           }else{
               if(action.equalsIgnoreCase("cerrar")){
                   modeloabrircaja m = new modeloabrircaja();
                   m.setIdusuario(request.getParameter("lblcodigo"));
                   m.setFechac(fechaFormateada);
                   m.setMontoc(request.getParameter("txtmontocierre"));
                   m.cerrarcaja();
                   request.setAttribute("validarcaja", "cerrada");
                   acceso = "menuprincipal.jsp";
               }
           }
       }
       if(!acceso.equals("")){
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
