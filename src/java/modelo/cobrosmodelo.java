
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class cobrosmodelo {
    Statement st;
    ResultSet rs;
    private String codigo, fecha, estado, idclientes, idapertura;

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

    public String getIdclientes() {
        return idclientes;
    }

    public void setIdclientes(String idclientes) {
        this.idclientes = idclientes;
    }

    public String getIdapertura() {
        return idapertura;
    }

    public void setIdapertura(String idapertura) {
        this.idapertura = idapertura;
    }

    public void guardarcobro() {

        String sql = "insert into cobros(idcobros, cob_fecha, cob_estado, idclientes, idaperturas) "
                + "values ('" + codigo + "','" + fecha + "','" + estado + "','" + idclientes + "','" + idapertura + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(cobrosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardardetalle(String idventa, String cobro, String monto) {
        String sql = "insert into detallecobros(idcobros, idventas, monto) "
                + "values('" + cobro + "','" + idventa + "','" + monto + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(cobrosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<facturaventamodelo> obtenerFacturasPendientes(String clienteId) {
        List<facturaventamodelo> facturasPendientes = new ArrayList<>();
        String sql = "SELECT * FROM ventas WHERE idclientes = '" + clienteId + "' AND ven_estado = 'PENDIENTE'";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                facturaventamodelo factura = new facturaventamodelo();
                factura.setIdfacturacion(rs.getString("idventas"));
                factura.setEstado(rs.getString("ven_estado"));
                factura.setCondicion(rs.getString("ven_condicion"));

                // Calcular el monto total a partir del detalle de ventas
                String idVenta = rs.getString("idventas");
                String detalleSql = "SELECT SUM(det_precio * det_cantidad) AS total_monto FROM detalleventas WHERE idventas = '" + idVenta + "'";
                Statement detalleSt = utilidades.conexion.sta(st);
                ResultSet detalleRs = detalleSt.executeQuery(detalleSql);
                if (detalleRs.next()) {
                    //se crea la variable monto en el modelo de la factura para guardar el monto obtenido del lsitado
                    factura.setMonto(detalleRs.getString("total_monto"));
                }
                detalleRs.close();
                detalleSt.close();

                facturasPendientes.add(factura);
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return facturasPendientes;
    }

    public List<cobrosmodelo> listarCobros() {
        List<cobrosmodelo> listaCobros = new ArrayList<>();
        String sql = "SELECT * FROM cobros";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                cobrosmodelo cobro = new cobrosmodelo();
                cobro.setCodigo(rs.getString("idcobros"));
                cobro.setFecha(rs.getString("cob_fecha"));
                cobro.setEstado(rs.getString("cob_estado"));
                cobro.setIdclientes(rs.getString("idclientes"));
                cobro.setIdapertura(rs.getString("idaperturas"));
                listaCobros.add(cobro);
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(cobrosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaCobros;
    }
    
     public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idcobros) as ultimoNumero FROM cobros";
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
