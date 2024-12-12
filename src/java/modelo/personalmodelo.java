package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class personalmodelo {

    private String codigo, nombre, apellido, ci, telefono, mensaje;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List listar() {
        ArrayList<personalmodelo> list = new ArrayList<>();
        String sql = "select * from personales";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                personalmodelo modelo = new personalmodelo();

                modelo.setCodigo(rs.getString("idpersonales"));
                modelo.setNombre(rs.getString("per_nombre"));
                modelo.setApellido(rs.getString("per_apellido"));
                modelo.setCi(rs.getString("per_ci"));
                modelo.setTelefono(rs.getString("per_telefono"));
                list.add(modelo);
            }

            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void guardar() {
        String sql = "insert into personales(idpersonales, per_nombre, per_apellido, per_ci, per_telefono) "
                + "value ('" + codigo + "', '" + nombre + "', '" + apellido + "', '" + ci + "', '" + telefono + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "PERSONAL GUARDADO CON EXITO";
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) {
        ArrayList<personalmodelo> list = new ArrayList<>();
        String sql = "select * from personales where idpersonales = '" + id + "'";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                personalmodelo modelo = new personalmodelo();
                modelo.setCodigo(rs.getString("idpersonales"));
                modelo.setNombre(rs.getString("per_nombre"));
                modelo.setApellido(rs.getString("per_apellido"));
                modelo.setCi(rs.getString("per_ci"));
                modelo.setTelefono(rs.getString("per_telefono"));
                list.add(modelo);
            }

            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void modificar() {
        String sql = "Update personales set "
                + "per_nombre='" + nombre + "',"
                + "per_apellido='" + apellido + "',"
                + "per_ci='" + ci + "',"
                + "per_telefono='" + telefono + "' where idpersonales='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from personales where idpersonales='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
