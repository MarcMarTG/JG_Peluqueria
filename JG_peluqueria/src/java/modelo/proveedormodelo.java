package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class proveedormodelo {

    private String codigo, nombre, ruc, telefono, correo, ciudad, mensaje, Ciudadnombre;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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
        ArrayList<proveedormodelo> list = new ArrayList<>();
        String sql = "SELECT proveedores.idproveedores, proveedores.prov_nombre, proveedores.prov_ruc, proveedores.prov_telefono, proveedores.prov_correo, ciudades.ciu_nombre\n"
                + "FROM proveedores\n"
                + "INNER JOIN ciudades ON proveedores.idciudades = ciudades.idciudades";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                proveedormodelo modelo = new proveedormodelo();

                modelo.setCodigo(rs.getString("idproveedores"));
                modelo.setNombre(rs.getString("prov_nombre"));
                modelo.setRuc(rs.getString("prov_ruc"));
                modelo.setTelefono(rs.getString("prov_telefono"));
                modelo.setCorreo(rs.getString("prov_correo"));
                modelo.setCiudad(rs.getString("ciu_nombre"));
                list.add(modelo);
            }

            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(proveedormodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void guardar() {
        String sql = "insert into proveedores(idproveedores, prov_nombre, prov_ruc, prov_telefono, prov_correo, idciudades) "
                + "value ('" + codigo + "', '" + nombre + "', '" + ruc + "', '" + telefono + "', '" + correo + "', '" + ciudad + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "PROVEEDOR GUARDADO CON EXITO";
        } catch (SQLException ex) {
            Logger.getLogger(proveedormodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) {
        ArrayList<proveedormodelo> list = new ArrayList<>();
        String sql = "SELECT proveedores.idproveedores, proveedores.prov_nombre, proveedores.prov_ruc, proveedores.prov_telefono, proveedores.prov_correo, proveedores.idciudades, ciudades.ciu_nombre\n"
                + "FROM proveedores\n"
                + "INNER JOIN ciudades ON proveedores.idciudades = ciudades.idciudades where idproveedores = " + id + "";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                proveedormodelo modelo = new proveedormodelo();
                modelo.setCodigo(rs.getString("idproveedores"));
                modelo.setNombre(rs.getString("prov_nombre"));
                modelo.setRuc(rs.getString("prov_ruc"));
                modelo.setTelefono(rs.getString("prov_telefono"));
                modelo.setCorreo(rs.getString("prov_correo"));
                modelo.setCiudad(rs.getString("idciudades"));
                modelo.setCiudadnombre(rs.getString("ciu_nombre"));
                list.add(modelo);
            }

            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(proveedormodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void modificar() {
        String sql = "Update proveedores set "
                + "prov_nombre='" + nombre + "',"
                + "prov_ruc='" + ruc + "',"
                + "prov_telefono='" + telefono + "',"
                + "prov_correo='" + correo + "',"
                + "idciudades='" + ciudad + "' where idproveedores='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(proveedormodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from proveedores where idproveedores='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(proveedormodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String obtenerUltimoNumeroFacturaPago() {
        String sql = "SELECT MAX(idproveedores) as ultimoNumero FROM proveedores";
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
