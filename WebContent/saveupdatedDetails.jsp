<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="model.Connectionmodel"%>
<html>
<body>
<%
try{
	Connectionmodel conc =new Connectionmodel();
    Connection con= conc.getconnection();
    Statement statement=con.createStatement();
String uid=request.getParameter("id");  
String fname=request.getParameter("fname");
String lastname=request.getParameter("lname");
String mail=request.getParameter("emailid");
String city=request.getParameter("city_name");
String qry2="update users  set first_name='"+fname+"',last_name='"+lastname+"',email='"+mail+"',city_name='"+city+"' where id='"+uid+"'";
statement.executeUpdate(qry2);
  %>
 
  
  <%  }catch(Exception e)
    {
        e.printStackTrace();
        out.println(e);
    }
    
    

%>
</body>
</html>