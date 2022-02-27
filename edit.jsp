<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <%
              String host="jdbc:mysql://localhost:3306/School";
              Connection conn=null;
              Statement stat=null;
              PreparedStatement stmt=null;
              ResultSet res=null;
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn =DriverManager.getConnection(host,"root","0123");                           
%>
<form action="" method="post">
       <%
                stat= conn.createStatement();
                String u=request.getParameter("u");                                                      
                int num =Integer.parseInt(u);             
                String data="select * from Student where id=' " +num+" ' ";
                res=stat.executeQuery(data);
                while(res.next()){                                    
        %>
          <input type="hidden" name="id" value="<%=res.getString("id")%>"/>         
          <div>
              <label>Name</label>
              <input type="text" name="nm" value="<%=res.getString("name")%>"/>
          </div>         
          <div>
              <label>Email</label>
              <input type="" name="em" value="<%=res.getString("email")%>"/>
          </div>         
          <div>
              <label>Phone Number</label>
              <input type="PhoneNumber" name="pn" value="<%=res.getString("phone_no")%>"/>
          </div>         
          <div>
              <label>Address</label>
              <input type="city" name="cy" value="<%=res.getString("city")%>"/>
          </div>
              <%
                  }
          %>
          <button type="submit">Update</button>
          <a href="index.jsp">Back</a>
       %>
</form>
</html>
<%
    String a = request.getParameter("id");
    String b= request.getParameter("nm");
    String c= request.getParameter("em");
    String d= request.getParameter("pn");
    String e= request.getParameter("cy");
    if(a!=null && b!=null && c!=null && d!=null && e!=null)
    {
        String query="update Student set name=?, email=?, phone_no=?, city=? where id=' "+a+" '";
        stmt =conn.prepareStatement(query);
        stmt.setString(1,b);
        stmt.setString(2,c);
        stmt.setString(3,d);
        stmt.setString(4,e);
        stmt.executeUpdate();
        response.sendRedirect("index.jsp");         
    }          
%>
