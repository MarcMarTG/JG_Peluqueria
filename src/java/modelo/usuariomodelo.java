package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class usuariomodelo {

    private String codigo, nombre, pass, tipo, estado, personal, mensaje;
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

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPersonal() {
        return personal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List listar() {
        ArrayList<usuariomodelo> list = new ArrayList<>();
        String sql = "select * from usuarios";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                usuariomodelo modelo = new usuariomodelo();

                modelo.setCodigo(rs.getString("idusuarios"));
                modelo.setNombre(rs.getString("usu_nombre"));
                modelo.setPass(rs.getString("usu_clave"));
                modelo.setTipo(rs.getString("usu_tipo"));
                modelo.setEstado(rs.getString("usu_estado"));
                modelo.setPersonal(rs.getString("idpersonales"));
                list.add(modelo);
            }

            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuariomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void guardar() {
        String sql = "insert into usuarios(idusuarios, usu_nombre, usu_clave, usu_tipo, usu_estado, idpersonales) "
                + "value ('" + codigo + "', '" + nombre + "', '" + pass + "', '" + tipo + "', '" + estado + "', '" + personal + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "USUARIO GUARDADO CON EXITO";
        } catch (SQLException ex) {
            Logger.getLogger(usuariomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) {
        ArrayList<usuariomodelo> list = new ArrayList<>();
        String sql = "select * from usuarios where idusuarios = '" + id + "'";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                usuariomodelo modelo = new usuariomodelo();
                modelo.setCodigo(rs.getString("idusuarios"));
                modelo.setNombre(rs.getString("usu_nombre"));
                modelo.setPass(rs.getString("usu_clave"));
                modelo.setTipo(rs.getString("usu_tipo"));
                modelo.setEstado(rs.getString("usu_estado"));
                modelo.setPersonal(rs.getString("idpersonales"));
                list.add(modelo);
            }

            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuariomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void modificar() {
        String sql = "Update usuarios set "
                + "usu_nombre='" + nombre + "',"
                + "usu_clave='" + pass + "',"
                + "usu_tipo='" + tipo + "',"
                + "usu_estado='" + estado + "',"
                + "idpersonales='" + personal + "' where idusuarios='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(usuariomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from usuarios where idusuarios='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuariomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
