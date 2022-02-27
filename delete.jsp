<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %> 
<% 
        String id = request.getParameter("d");
        int no=Integer.parseInt(id);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/School","root","0123");
        Statement stat = conn .createStatement();             
        stat.executeUpdate("DELETE FROM Student WHERE id =' "+no+" ' ");  
        response.sendRedirect("index.jsp");   
 %>
 
