package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class modeloabrircaja {

    private String id;
    private String fechai;
    private String montoi;
    private String fechac;
    private String montoc;
    private String idusuario;

    Statement st;
    ResultSet rs;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFechai() {
        return fechai;
    }

    public void setFechai(String fechai) {
        this.fechai = fechai;
    }

    public String getMontoi() {
        return montoi;
    }

    public void setMontoi(String montoi) {
        this.montoi = montoi;
    }

    public String getFechac() {
        return fechac;
    }

    public void setFechac(String fechac) {
        this.fechac = fechac;
    }

    public String getMontoc() {
        return montoc;
    }

    public void setMontoc(String montoc) {
        this.montoc = montoc;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public void abrirCaja() {
        String sql = "INSERT INTO aperturas(ape_fecha,ape_monto,ape_estado,idusuarios)"
                + "VALUES('" + fechai + "','" + montoi + "','ABIERTA','" + idusuario + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(modeloabrircaja.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String validarcaja() {
        String sql = "SELECT * FROM aperturas WHERE idusuarios= '" + idusuario + "' AND ape_estado='ABIERTA'";
        String mensaje = "";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            rs.next();
            if (rs.getRow() == 0) {
                mensaje = "CERRADA";
            } else {
                mensaje = "ABIERTA";
            }
            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(modeloabrircaja.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mensaje;
    }

    public String obtenerultimapertura() {
        String sql = "select * from aperturas where idusuarios='" + idusuario + "' and ape_estado='ABIERTA'";
        String cod = "";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            rs.next();
            cod = rs.getString("idaperturas");
        } catch (SQLException ex) {
            Logger.getLogger(modeloabrircaja.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cod;
    }

    public void cerrarcaja() {
        String sql = "INSERT INTO cierres (cie_fecha, cie_monto, idaperturas)"
                + "VALUES ('" + fechac + "','" + montoc + "','" + obtenerultimapertura() + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(modeloabrircaja.class.getName()).log(Level.SEVERE, null, ex);
        }

        sql = "Update aperturas set ape_estado='CERRADA' where idaperturas='" + obtenerultimapertura() + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(modeloabrircaja.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
