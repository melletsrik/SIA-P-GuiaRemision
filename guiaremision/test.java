
package guiaremision;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class test {
    Connection conn = null;
    String url ="jdbc:postgresql::/192.168.1.100/db_guiaRemision";
    String usuario="postgres";
    String clave ="root";
    
    public void conectar(){
        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url,usuario,clave);
            JOptionPane.showMessageDialog(null,"conexion");
        } catch(Exception e){
            
        }
    }
}
