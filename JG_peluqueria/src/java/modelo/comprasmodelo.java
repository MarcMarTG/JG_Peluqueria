package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class comprasmodelo {

    Statement st;
    ResultSet rs;

    private String idcompras;
    private String fecha;
    private String condicion;
    private String estado;
    private String idusuario;
    private String idapertura;
    private String idproveedor;
    private String monto;

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getIdcompras() {
        return idcompras;
    }

    public void setIdcompras(String idcompras) {
        this.idcompras = idcompras;
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

    public String getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(String idproveedor) {
        this.idproveedor = idproveedor;
    }

    public List listarcompras() {
        ArrayList<comprasmodelo> lista = new ArrayList<>();
        String sql = "select * from compras";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                comprasmodelo modelo = new comprasmodelo();
                modelo.setIdcompras(rs.getString(1));
                modelo.setFecha(rs.getString(2));
                modelo.setCondicion(rs.getString(3));
                modelo.setEstado(rs.getString(4));
                modelo.setIdusuario(rs.getString(5));
                modelo.setIdapertura(rs.getString(7));
                modelo.setIdproveedor(rs.getString(6));
                lista.add(modelo);
            }
            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(comprasmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public void guardarcompras() {
        String sql = "insert into compras(idcompras, com_fecha, com_condicion,"
                + "com_estado, idusuarios, idproveedores, idaperturas)"
                + "values ('" + idcompras + "', '" + fecha + "','" + condicion + "',"
                + "'" + estado + "','" + idusuario + "','" + idproveedor + "','" + idapertura + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(comprasmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardardetalle(String id, String idpro, String can, String pre) {
        String sql = "insert into detallecompra(idcompras, idproductos, det_precio, det_cantidad)"
                + "values('" + id + "','" + idpro + "','" + pre + "','" + can + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(comprasmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String obtenerTotal(String compra) {
        String sql = "select sum(det_cantidad*det_precio) as suma from detallecompra "
                + "where idcompras='" + compra + "'";
        String aux = "";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            rs.next();
            aux = rs.getString("suma");
        } catch (SQLException ex) {
            Logger.getLogger(comprasmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aux;
    }
    
    public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idcompras) as ultimoNumero FROM compras";
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
