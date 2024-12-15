package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class clientemodelo {

    private String codigo, nombre, apellido, ruc, telefono, ciudad, mensaje, Ciudadnombre;
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

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getCiudadnombre() {
        return Ciudadnombre;
    }

    public void setCiudadnombre(String Ciudadnombre) {
        this.Ciudadnombre = Ciudadnombre;
    }

    

    public List listar() {
        ArrayList<clientemodelo> list = new ArrayList<>();
        String sql = "SELECT clientes.idclientes, clientes.cli_nombre, clientes.cli_apellido, clientes.cli_ruc, clientes.cli_telefono, ciudades.ciu_nombre\n"
                + "FROM clientes\n"
                + "INNER JOIN ciudades ON clientes.idciudades = ciudades.idciudades";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                clientemodelo modelo = new clientemodelo();
                modelo.setCodigo(rs.getString("idclientes"));
                modelo.setNombre(rs.getString("cli_nombre"));
                modelo.setApellido(rs.getString("cli_apellido"));
                modelo.setRuc(rs.getString("cli_ruc"));
                modelo.setTelefono(rs.getString("cli_telefono"));
                modelo.setCiudad(rs.getString("ciu_nombre"));
                list.add(modelo);
            }
            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public void guardar() {
        String sql = "INSERT INTO clientes (idclientes, cli_nombre, cli_apellido, cli_ruc, cli_telefono, idciudades) "
                + "value ('" + codigo + "', '" + nombre + "', '" + apellido + "', '" + ruc + "', '" + telefono + "', '" + ciudad + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "CLIENTE GUARDADO CON EXITO";
        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) {
        ArrayList<clientemodelo> list = new ArrayList<>();
        String sql = "SELECT clientes.idclientes, clientes.cli_nombre, clientes.cli_apellido, clientes.cli_ruc, clientes.cli_telefono, clientes.idciudades, ciudades.ciu_nombre\n"
                + "FROM clientes\n"
                + "INNER JOIN ciudades ON clientes.idciudades = ciudades.idciudades where idclientes = " + id + "";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                clientemodelo modelo = new clientemodelo();
                modelo.setCodigo(rs.getString("idclientes"));
                modelo.setNombre(rs.getString("cli_nombre"));
                modelo.setApellido(rs.getString("cli_apellido"));
                modelo.setRuc(rs.getString("cli_ruc"));
                modelo.setTelefono(rs.getString("cli_telefono"));
                modelo.setCiudad(rs.getString("idciudades"));
                modelo.setCiudadnombre(rs.getString("ciu_nombre"));
                list.add(modelo);
            }

            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void modificar() {
        String sql = "Update clientes set "
                + "cli_nombre='" + nombre + "',"
                + "cli_apellido='" + apellido + "',"
                + "cli_ruc='" + ruc + "',"
                + "cli_telefono='" + telefono + "',"
                + "idciudades='" + ciudad + "' where idclientes='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from clientes where idclientes='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idclientes) as ultimoNumero FROM clientes";
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
