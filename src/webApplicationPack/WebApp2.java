package webApplicationPack;

import java.sql.*;

public class WebApp2 {
	 Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;

     
     public void Selection2() {
         try {
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root", "root", "root");
             ps = conn.prepareStatement("SELECT Master_Data.ID, Master_Data.SName, Master_Data.Phone, Class.Subject1 FROM Master_Data INNER JOIN Class ON Master_Data.ID = Class.Roll_No;");
         } catch (Exception e) {
             e.printStackTrace();
         }
     }

     public ResultSet getQ1() {
         try {
             rs = ps.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return rs;

}
     WebApp2 s = new WebApp2();
     ResultSet output = s.getQ1();     
}


