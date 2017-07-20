/**
 * 
 */
package querypackage;
import java.sql.*;
/**
 * @author Bharath.Rao
 *
 */
public class operation2 {
	public static void main(String args[]) {try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","root");
        Statement stmt=con.createStatement();
                     ResultSet rs=stmt.executeQuery("SELECT Master_Data.ID, Master_Data.SName, Master_Data.Phone, Class.Subject1\r\n" + 
                     		"FROM Master_Data INNER JOIN Class ON Master_Data.[ID] = Class.[Roll No];\r\n" + 
                     		"");
        while(rs.next())
               System.out.println(rs.getInt("Master_Data.ID")+" "+rs.getString("Master_Data.SName")+" "+rs.getString("Master_Data.Phone")+" "+rs.getString("Class.Subject1"));
        con.close();
 }catch(Exception e) { System.out.println(e);}
        
 }

}
