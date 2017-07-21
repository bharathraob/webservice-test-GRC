<%-- 
    Document   : index
    Created on : 20 Jul, 2017, 4:57:47 PM
    Author     : Anshul.Jethwani
--%>

<%@page import='java.sql.*'%>

<%
    Class.forName("com.mysql.jdbc.Driver");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>This is a test page</title>
    </head>
    <body>
        <%!
            // CLASS FOR QUERY 1
            public class Selection {

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                public Selection() {
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root", "root", "root");
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

        %>  
        <%
            Selection s = new Selection();
            ResultSet output = s.getQ();
        %>

        <!-- TABLES FOR QUERY 1 -->
        <br>
        <br>
        <h3>Query 1</h3> 
        <br>
        <i>SELECT Master_Data.ID, Master_Data.SName, Class.Class FROM Master_Data INNER JOIN Class ON Master_Data.ID = Class.Roll_No;</i>
        <br>
        <table border="1">
            <tbody>                  
                <tr>
                    <td>ID</td>
                    <td>Surname</td>
                    <td>Class</td>
                </tr>
                <%
                    while (output.next()) {
                %>
                <tr>                  
                    <td><%= output.getString("ID")%></td>
                    <td><%= output.getString("SNAME")%></td>
                    <td><%= output.getString("CLASS")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
<!-- ########################### END OF QUERY 1 ########################### -->
        <%!                   
            // CLASS FOR QUERY 2
            public class Selection2 {

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                public Selection2() {
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root", "root", "root");
                        ps = conn.prepareStatement("SELECT Master_Data.ID, Master_Data.SName, Master_Data.Phone, Class.Subject1 FROM Master_Data INNER JOIN Class ON Master_Data.ID = Class.Roll_No;");
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

        %>  
        <%
            Selection2 s2 = new Selection2();
            ResultSet output2 = s2.getQ();
        %>

        <!-- TABLES FOR QUERY 2 -->
        <h3>Query 2</h3> 
        <br>
        <i>SELECT Master_Data.ID, Master_Data.SName, Master_Data.Phone, Class.Subject1 FROM Master_Data INNER JOIN Class ON Master_Data.ID = Class.Roll_No;</i>
        <br>
        <table border="1">
            <tbody>                  
                <tr>
                    <td>ID</td>
                    <td>Surname</td>
                    <td>Phone</td>
                    <td>Subject 1</td>
                </tr>
                <%
                    while (output2.next()) {
                %>
                <tr>                  
                    <td><%= output2.getString("ID")%></td>
                    <td><%= output2.getString("SNAME")%></td>
                    <td><%= output2.getString("PHONE")%></td>
                    <td><%= output2.getString("SUBJECT1")%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
<!-- ########################### END OF QUERY 2 ########################### -->
    </body>
</html>
