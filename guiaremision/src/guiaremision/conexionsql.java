package guiaremision;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class conexionsql {
    Connection conn = null;
    String url ="jdbc:postgresql://localhost/db_guiaRemision";
    String usuario="postgres";
    String clave ="root";
    
    public void conectar(){
        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url,usuario,clave);
            JOptionPane.showMessageDialog(null,"conexion exitosa","conexion",JOptionPane.INFORMATION_MESSAGE);
        } catch(Exception e){
            JOptionPane.showMessageDialog(null,"conexion fallida" +e,"conexion",JOptionPane.ERROR_MESSAGE); 
        }
    }
    
    public void cerrar(){
        try{
            conn.close();
            JOptionPane.showMessageDialog(null,"desconexion exitosa","conexion",JOptionPane.INFORMATION_MESSAGE);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"desconexion fallida" +e,"conexion",JOptionPane.ERROR_MESSAGE); 
        }
    }
    
}
