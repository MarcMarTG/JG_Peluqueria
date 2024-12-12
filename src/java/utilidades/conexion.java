package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class conexion {

    static Connection conn = null;
    static Statement st = null;
    static String bd = "jgpeluqueria";
    static String usuario = "root";
    static String clave = "";
    static String url = "jdbc:mysql://localhost:3306/" + bd;

    public static Connection Enlace(Connection conn) throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usuario, clave);
            System.out.print("conexion exitosa");
        } catch (Exception e) {
            System.out.print("Error, Clase no Encontrada");
        }
        return conn;
    }

    public static Statement sta(Statement st) throws SQLException {
        conn = Enlace(conn);
        st = conn.createStatement();
        return st;
    }
}
