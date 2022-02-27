<%@page import="java.sql. *"%>
<%@page import="java.sql. DriverManager"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet "%>
<%@page import="java.sql.Connection" %>      
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <div>
        <h3>Crud Operation On Student Table</h3> <br>
    </div>
    <div>
        <a href="addnew.jsp">Add New Student</a>
    </div>
    <table class="table" border="1" cellpadding="11">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone No</th>
                <th>City</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                String host ="jdbc:mysql://localhost:3306/School";                                          
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection(host,"root","0123");
                Statement stat =conn.createStatement();
                String data = "SELECT * FROM student ORDER BY id DESC";            
                ResultSet res =  stat.executeQuery(data);            
                while(res.next()) {
                 %>
                 <tr>                                                         
                      <td><%=res.getString("id") %></td>
                      <td><%=res.getString("name") %></td>
                       <td><%=res.getString("email") %></td>
                       <td><%=res.getString("phone_no") %></td>
                        <td><%=res.getString("city") %></td>
                        <td>
                            <a href="edit.jsp?u=<%=res.getString("id") %>" >Edit</a>
                            <a href="delete.jsp?d=<%=res.getString("id") %>" >Delete</a>
                        </td>                        
                  </tr>
                   <%
                   }
                   %>           
        </tbody>      
    </table>   
</html>

