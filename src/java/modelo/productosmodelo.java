package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class productosmodelo {

    private String codigo, nombre, costo, precio, stock, minimo, proveedor, iva, mensaje;
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

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getMinimo() {
        return minimo;
    }

    public void setMinimo(String minimo) {
        this.minimo = minimo;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    public List listar() {
        ArrayList<productosmodelo> list = new ArrayList<>();
        String sql = "select * from productos";

        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                productosmodelo modelo = new productosmodelo();

                modelo.setCodigo(rs.getString("idproductos"));
                modelo.setNombre(rs.getString("pro_nombre"));
                modelo.setCosto(rs.getString("pro_costo"));
                modelo.setPrecio(rs.getString("pro_precio"));
                modelo.setStock(rs.getString("pro_stock"));
                modelo.setMinimo(rs.getString("pro_minimo"));
                modelo.setIva(rs.getString("pro_iva"));
                modelo.setProveedor(rs.getString("idproveedores"));
                list.add(modelo);
            }

            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void guardar() {
        String sql = "insert into productos(idproductos, pro_nombre, pro_costo, pro_precio, pro_stock, pro_minimo, pro_iva, idproveedores) "
                + "value ('" + codigo + "', '" + nombre + "', '" + costo + "', '" + precio + "', '" + stock + "', '" + minimo + "', '" + iva + "', '" + proveedor + "')";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "PRODUCTOS GUARDADO CON EXITO";
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List listarporid(String id) {
        ArrayList<productosmodelo> list = new ArrayList<>();
        String sql = "select * from productos where idproductos = '" + id + "'";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                productosmodelo modelo = new productosmodelo();
                modelo.setCodigo(rs.getString("idproductos"));
                modelo.setNombre(rs.getString("pro_nombre"));
                modelo.setCosto(rs.getString("pro_costo"));
                modelo.setPrecio(rs.getString("pro_precio"));
                modelo.setStock(rs.getString("pro_stock"));
                modelo.setMinimo(rs.getString("pro_minimo"));
                modelo.setIva(rs.getString("pro_iva"));
                modelo.setProveedor(rs.getString("idproveedores"));
                list.add(modelo);
            }

            st.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void modificar() {
        String sql = "Update productos set "
                + "pro_nombre='" + nombre + "',"
                + "pro_costo='" + costo + "',"
                + "pro_precio='" + precio + "',"
                + "pro_stock='" + stock + "',"
                + "pro_minimo='" + minimo + "',"
                + "pro_iva='" + iva + "',"
                + "idproveedores='" + proveedor + "' where idproductos='" + codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from productos where idproductos='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
