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
                    return null;
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
    
    public ArrayList<String> obtenerSedes() {
        ArrayList<String> sedes = new ArrayList<>();
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT discripcion FROM trs_sede_proveedor")) {
            while (rs.next()) {
                sedes.add(rs.getString("discripcion"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener sedes: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return sedes;
    }
    
    public boolean authetication_ProveedorCheck(String docProveedor, String docCliente, String tipoDocProveedor, String tipoDocCliente) {
        String sqlProveedor = "SELECT COUNT(*) FROM mae_proveedor WHERE id_proveedor = ? AND id_tipo_documento = (SELECT id_tipo_documento FROM mae_tipo_documento WHERE descripcion = ?)";
        String sqlCliente = "SELECT COUNT(*) FROM mae_cliente WHERE id_cliente = ? AND id_tipo_documento = (SELECT id_tipo_documento FROM mae_tipo_documento WHERE descripcion = ?)";
        
        try (PreparedStatement stmtProveedor = conn.prepareStatement(sqlProveedor);
             PreparedStatement stmtCliente = conn.prepareStatement(sqlCliente)) {
             
            stmtProveedor.setString(1, docProveedor);
            stmtProveedor.setString(2, tipoDocProveedor);
            ResultSet rsProveedor = stmtProveedor.executeQuery();
            
            stmtCliente.setString(1, docCliente);
            stmtCliente.setString(2, tipoDocCliente);
            ResultSet rsCliente = stmtCliente.executeQuery();
            
            if (rsProveedor.next() && rsProveedor.getInt(1) > 0 && rsCliente.next() && rsCliente.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al verificar proveedor/cliente: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
    public boolean verificarDatos(String... datos) {
        for (String dato : datos) {
            if (dato == null || dato.trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }
    
    public boolean authetication_ModalidadCheck(String licTransportista, String tipodoc, String numDoc, String placa) {
        String sqlTransportista = "SELECT COUNT(*) FROM mae_transportista WHERE num_licencia = ? AND id_tipo_documento = (SELECT id_tipo_documento FROM mae_tipo_documento WHERE descripcion = ?) AND id_transportista = ?";
        String sqlVehiculo = "SELECT COUNT(*) FROM mae_vehiculo WHERE id_vehiculo = ?";

        try (PreparedStatement stmtTransportista = conn.prepareStatement(sqlTransportista);
             PreparedStatement stmtVehiculo = conn.prepareStatement(sqlVehiculo)) {

            stmtTransportista.setString(1, licTransportista);
            stmtTransportista.setString(2, tipodoc);
            stmtTransportista.setString(3, numDoc);
            ResultSet rsTransportista = stmtTransportista.executeQuery();

            stmtVehiculo.setString(1, placa);
            ResultSet rsVehiculo = stmtVehiculo.executeQuery();

            if (rsTransportista.next() && rsTransportista.getInt(1) > 0 && rsVehiculo.next() && rsVehiculo.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al verificar Transportista/Vehiculo: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }
     public String getNombreConductor(String id_transportista) {
        conexionsql conexion = new conexionsql();
        conexion.conectar();

        String nombreConductor = null;
        String query = "SELECT nombre FROM mae_transportista WHERE id_transportista = ?";
        try (PreparedStatement stmt = conexion.conn.prepareStatement(query)) {
            stmt.setString(1, id_transportista);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                nombreConductor = rs.getString("nombre");
            } else {
                JOptionPane.showMessageDialog(null, "No se encontró el conductor con ID: " + id_transportista, "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener el nombre del conductor: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            conexion.cerrar();
        }

        return nombreConductor;
    }
    public String getNombreProveedor(String id_proveedor) {
        conexionsql conexion = new conexionsql();
        conexion.conectar();

        String nombreProveedor = null;
        String query = "SELECT nombre FROM mae_proveedor WHERE id_proveedor = ?";
        try (PreparedStatement stmt = conexion.conn.prepareStatement(query)) {
            stmt.setString(1, id_proveedor);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                nombreProveedor = rs.getString("nombre");
            } else {
                JOptionPane.showMessageDialog(null, "No se encontró el proveedor con ID: " + id_proveedor, "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener el nombre del proveedor: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            conexion.cerrar();
        }

        return nombreProveedor;
    }
    
    public String getNombreCliente(String id_cliente) {
        conexionsql conexion = new conexionsql();
        conexion.conectar();

        String nombreCliente = null;
        String query = "SELECT nombre FROM mae_cliente WHERE id_cliente = ?";
        try (PreparedStatement stmt = conexion.conn.prepareStatement(query)) {
            stmt.setString(1, id_cliente);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                nombreCliente = rs.getString("nombre");
            } else {
                JOptionPane.showMessageDialog(null, "No se encontró el cliente con ID: " + id_cliente, "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener el nombre del cliente: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            conexion.cerrar();
        }

        return nombreCliente;
    }
}
