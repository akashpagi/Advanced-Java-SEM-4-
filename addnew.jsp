<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
<form action="" method="post">
<div>
    <label>Name</Label>
    <input type="text" name="nm" palceholder="Enter Your Name"/> 
</div>
<div>
    <label>Email</Label>
    <input type="email" name="em" palceholder="Email Address"/> 
</div>
<div>
    <label>Phone</Label>
    <input type="tel" name="pn" palceholder="Phone Number"/> 
</div>
<div>
    <label>Address</Label>
    <input type="text" name="cy" palceholder="Your City"/> 
</div>
<button type="submit">Submit</button>
<a href="index.jsp">Back</a>
</form> 
 </body>
</html>
<%
    String a = request.getParameter("nm");
    String b = request.getParameter("em");
    String c = request.getParameter("pn");
    String d = request.getParameter("cy");
    String  host ="jdbc:mysql://localhost:3306/School";
    Connection conn = null;
    PreparedStatement stat= null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null)    
    {
     conn =DriverManager.getConnection(host,"root","0123");
     String data= "INSERT INTO Student(name,email,phone_no,city) VALUES(?,?,?,?)";
     stat = conn.prepareStatement(data);   
     stat.setString(1,a);
     stat.setString(2,b);
     stat.setString(3,c);
     stat.setString(4,d);
     stat.executeUpdate();
     response.sendRedirect("index.jsp");
    }
%>
