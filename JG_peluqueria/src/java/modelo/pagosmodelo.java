package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class pagosmodelo {

    Statement st;
    ResultSet rs;
    private String codigo, fecha, estado, idproveedores, idapertura;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdproveedores() {
        return idproveedores;
    }

    public void setIdproveedores(String idproveedores) {
        this.idproveedores = idproveedores;
    }

    public String getIdapertura() {
        return idapertura;
    }

    public void setIdapertura(String idapertura) {
        this.idapertura = idapertura;
    }

    public void guardarpago() {

        String sql = "insert into pagos(idpagos, pag_fecha, pag_estado, idproveedores, idaperturas) "
                + "values ('" + codigo + "','" + fecha + "','" + estado + "','" + idproveedores + "','" + idapertura + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(pagosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardardetalle(String idcompras, String pago, String monto) {
        String sql = "insert into detallepagos(idpagos, idcompras, monto) "
                + "values('" + pago + "','" + idcompras + "','" + monto + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(pagosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<comprasmodelo> obtenerFacturasPendientes(String proveedorId) {
        List<comprasmodelo> facturasPendientes = new ArrayList<>();
        String sql = "SELECT * FROM compras WHERE idproveedores = '" + proveedorId + "' AND com_estado = 'PENDIENTE'";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                comprasmodelo compras = new comprasmodelo();
                compras.setIdcompras(rs.getString("idcompras"));
                compras.setEstado(rs.getString("com_estado"));
                compras.setCondicion(rs.getString("com_condicion"));

                // Calcular el monto total a partir del detalle de ventas
                String idCompras = rs.getString("idcompras");
                String detalleSql = "SELECT SUM(det_precio * det_cantidad) AS total_monto FROM detallecompra WHERE idcompras = '" + idCompras + "'";
                Statement detalleSt = utilidades.conexion.sta(st);
                ResultSet detalleRs = detalleSt.executeQuery(detalleSql);
                if (detalleRs.next()) {
                    //se crea la variable monto en el modelo de la factura para guardar el monto obtenido del lsitado
                    compras.setMonto(detalleRs.getString("total_monto"));
                }
                detalleRs.close();
                detalleSt.close();

                facturasPendientes.add(compras);
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(comprasmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return facturasPendientes;
    }

    public List<pagosmodelo> listarPagos() {
        List<pagosmodelo> listarPagos = new ArrayList<>();
        String sql = "SELECT * FROM pagos";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                pagosmodelo pago = new pagosmodelo();
                pago.setCodigo(rs.getString("idpagos"));
                pago.setFecha(rs.getString("pag_fecha"));
                pago.setEstado(rs.getString("pag_estado"));
                pago.setIdproveedores(rs.getString("idproveedores"));
                pago.setIdapertura(rs.getString("idaperturas"));
                listarPagos.add(pago);
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(pagosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listarPagos;
    }
    
    
    public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idpagos) as ultimoNumero FROM pagos";
        String ultimoNumero = "0";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            if (rs.next()) {
                ultimoNumero = rs.getString("ultimoNumero");
                if (ultimoNumero == null) {
                    ultimoNumero = "0";
                }
            }
            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ultimoNumero;
    }
}
