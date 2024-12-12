<%-- 
    Document   : rptpersonales
    Created on : 23 abr. 2024, 22:19:33
    Author     : manu_
--%>

<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dirPath = "/rpt";
    String realPath = this.getServletContext().getRealPath(dirPath);
    String jasperReport = "personales.jasper";
    JasperPrint print = null;
    Connection conn = null;
    
    try {
        conn = utilidades.conexion.Enlace(conn);
        print = JasperFillManager.fillReport(realPath + "//" + jasperReport, null, conn);
        response.setContentType("application/pdf");
        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
        response.getOutputStream().flush();
        response.getOutputStream().close();
    } catch (Exception ex) {
        ex.printStackTrace();
        out.println(ex.getMessage()); 
    } finally {
        if (conn != null) {
            conn.close();
        }
    }
%>
