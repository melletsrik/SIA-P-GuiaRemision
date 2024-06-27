package guiaremision;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class conexionsql {
    private Connection conn = null;
    private final String url = "jdbc:postgresql://localhost/db_guiaRemision";
    private final String usuario = "postgres";
    private final String clave = "root";
    
    public void conectar() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, usuario, clave);
            JOptionPane.showMessageDialog(null, "Conexión exitosa", "Conexión", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Conexión fallida: " + e.getMessage(), "Conexión", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void cerrar() {
        try {
            if (conn != null) {
                conn.close();
                JOptionPane.showMessageDialog(null, "Desconexión exitosa", "Conexión", JOptionPane.INFORMATION_MESSAGE);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Desconexión fallida: " + e.getMessage(), "Conexión", JOptionPane.ERROR_MESSAGE); 
        }
    }

    public ArrayList<String> obtenerTiposDocumentos() {
        ArrayList<String> tiposDocumentos = new ArrayList<>();
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT descripcion FROM mae_tipo_documento")) {
            while (rs.next()) {
                tiposDocumentos.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener tipos de documentos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return tiposDocumentos;
    }

    public ArrayList<String> obtenerDepartamentos() {
        ArrayList<String> departamentos = new ArrayList<>();
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT nombre FROM mae_departamento")) {
            while (rs.next()) {
                departamentos.add(rs.getString("nombre"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener departamentos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return departamentos;
    }

    public ArrayList<String> obtenerProvincias(String departamento) {
        ArrayList<String> provincias = new ArrayList<>();
        String query = "SELECT nombre FROM mae_provincia WHERE id_departamento = (SELECT id_departamento FROM mae_departamento WHERE nombre = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, departamento);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    provincias.add(rs.getString("nombre"));
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener provincias: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return provincias;
    }

    public ArrayList<String>  obtenerDistritos(String provincia) {
        ArrayList<String> distritos = new ArrayList<>();
        String query = "SELECT nombre FROM mae_distrito WHERE id_provincia = (SELECT id_provincia FROM mae_provincia WHERE nombre = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, provincia);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    distritos.add(rs.getString("nombre"));
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener distritos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return distritos;
    }
    
    public ArrayList<String> obtenerUnidadesProducto() {
        ArrayList<String> unidades = new ArrayList<>();
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT descripcion FROM mae_unidades")) {
            while (rs.next()) {
                unidades.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener unidades de productos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return unidades;
    }

    public String[] obtenerProductoPorCodigo(String codigoProducto) {
        String[] producto = new String[2];
        String query = "SELECT p.nombre, u.descripcion FROM mae_producto p JOIN mae_unidades u ON p.id_unidad = u.id_unidad WHERE p.id_producto = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, codigoProducto);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    producto[0] = rs.getString("nombre");
                    producto[1] = rs.getString("descripcion");
                } else {
                    JOptionPane.showMessageDialog(null, "Producto no encontrado", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener el producto: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return producto;
    }
    
    public boolean validarUsuario(String idUsuario, String contrasenia) {
        String sql = "SELECT COUNT(*) FROM mae_usuario WHERE id_usuario = ? AND contrasenia = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idUsuario);
            stmt.setString(2, contrasenia);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
