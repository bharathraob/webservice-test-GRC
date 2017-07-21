package webApplicationPack;

import java.sql.*;

public class WebApp {
	 Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;

     public WebApp() {
         try {
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SampleDB", "root", "root");
             ps = conn.prepareStatement("SELECT Master_Data.ID, Master_Data.SName, Class.Class FROM Master_Data INNER JOIN Class ON Master_Data.ID = Class.Roll_No");
         } catch (Exception e) {
             e.printStackTrace();
         }
     }

     public ResultSet getQ() {
         try {
             rs = ps.executeQuery();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return rs;
     }
   

    
}
