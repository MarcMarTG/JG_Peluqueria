package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class facturaventamodelo {

    Statement st;
    ResultSet rs;

    private String idfacturacion;
    private String fecha;
    private String condicion;
    private String estado;
    private String idusuario;
    private String idapertura;
    private String cliente;
    private String monto;

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getIdfacturacion() {
        return idfacturacion;
    }

    public void setIdfacturacion(String idfacturacion) {
        this.idfacturacion = idfacturacion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getIdapertura() {
        return idapertura;
    }

    public void setIdapertura(String idapertura) {
        this.idapertura = idapertura;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public List listarfacturas() {
        ArrayList<facturaventamodelo> lista = new ArrayList<>();
        String sql = "select * from ventas";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                facturaventamodelo modelo = new facturaventamodelo();
                modelo.setIdfacturacion(rs.getString(1));
                modelo.setFecha(rs.getString(2));
                modelo.setCondicion(rs.getString(3));
                modelo.setEstado(rs.getString(4));
                modelo.setIdusuario(rs.getString(5));
                modelo.setIdapertura(rs.getString(7));
                modelo.setCliente(rs.getString(6));
                lista.add(modelo);
            }
            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public void guardarfactura() {
        String sql = "insert into ventas(idventas, ven_fecha, ven_condicion,"
                + "ven_estado, idusuarios, idclientes, idaperturas)"
                + "values ('" + idfacturacion + "', '" + fecha + "','" + condicion + "',"
                + "'" + estado + "','" + idusuario + "','" + cliente + "','" + idapertura + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardardetalle(String id, String idpro, String can, String pre) {
        String sql = "insert into detalleventas(idventas, idproductos, det_precio, det_cantidad)"
                + "values('" + id + "','" + idpro + "','" + pre + "','" + can + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String obtenerTotal(String factura) {
        String sql = "select sum(det_cantidad*det_precio) as suma from detalleventas "
                + "where idventas='" + factura + "'";
        String aux = "";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            rs.next();
            aux = rs.getString("suma");
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aux;
    }

    public String obtenerUltimoNumeroFactura() {
        String sql = "SELECT MAX(idventas) as ultimoNumero FROM ventas";
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
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ultimoNumero;
    }
    
    
}
