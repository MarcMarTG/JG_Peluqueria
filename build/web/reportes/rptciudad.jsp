<%-- 
    Document   : rptciudad
    Created on : 15 dic 2024, 11:18:24
    Author     : marcm
--%>

<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dirPath = "/rpt";
    String realPath = this.getServletContext().getRealPath(dirPath);
    String jasperReport = "ciudades.jasper";
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
