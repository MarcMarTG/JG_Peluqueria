package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ciudadmodelo {

    private String codigo, nombre, mensaje;
    Statement st;
    ResultSet rs;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List listar() {

        ArrayList<ciudadmodelo> list = new ArrayList<>();

        String sql = "Select * from ciudades";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                ciudadmodelo modelo = new ciudadmodelo();
                modelo.setCodigo(rs.getString("idciudades"));
                modelo.setNombre(rs.getString("ciu_nombre"));
                list.add(modelo);
            }
            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(ciudadmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void guardar() throws SQLException {

        String sql = "INSERT INTO ciudades (idciudades, ciu_nombre) "
                + "VALUES ('" + codigo + "','" + nombre + "')";

        mensaje = "Ciudad guardada con éxito";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "Ciudad guardado con exito";
        } catch (SQLException ex) {
            Logger.getLogger(ciudadmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) { 
        ArrayList<ciudadmodelo> list = new ArrayList<>();
        String sql = "select * from ciudades where idciudades ='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                ciudadmodelo modelo = new ciudadmodelo();
                modelo.setCodigo(rs.getString("idciudades"));
                modelo.setNombre(rs.getString("ciu_nombre"));
                list.add(modelo);
            }
            st.close(); 
            rs.close(); 
        } catch (SQLException ex) {
            Logger.getLogger(ciudadmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list; 
    }

    public void modificar() {
        String sql = " UPDATE ciudades SET ciu_nombre='" + nombre + "'  WHERE idciudades='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(ciudadmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from ciudades where idciudades='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(ciudadmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idciudades) as ultimoNumero FROM ciudades";
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
