<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Connectionmodel"%>
<%

String id=request.getParameter("userid");
%>
<body>
  

<%
try{
	Connectionmodel conc =new Connectionmodel();
    Connection con= conc.getconnection();
Statement  statement=con.createStatement();
String sql ="select * from users where id='"+id+"'";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String firstname=resultSet.getString("first_name");
    String lname=resultSet.getString("last_name");
    String cityname=resultSet.getString("city_name");
    String email=resultSet.getString("email");
%>
<form method="post" action="index.html">
<table border="0">
 					<tr>
                       <td>First name</td>
                       <td><input type="text" name="fistname" id="firstname" value="<%=firstname%>" /></td>
                   </tr>
                   <tr>
                       <td>Last name</td>
                       <td><input type="text" name="lname" id="lname" value="<%=lname%>" /></td>
                   </tr>
                   <tr>
                       <td>city name</td>
                       <td><input type="text" name="cityname" id="cityname" value="<%=cityname%>" /></td>
                   </tr>
                    <tr>
                       <td>email</td>
                       <td><input type="text" name="email" id="email" value="<%=email%>" /></td>
                   </tr>
                   <tr>
                       <td><input type="hidden" name="id" id="id" value="<%=id%>" /></td>
                       <td><input type="submit" name="submit" value="update" id="updateData" /></td>
                   </tr>
                   
                   
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</form>
<script>
$("#updateData").click(function() {
	var firstname=$('#firstname').val();  
	 if(firstname == ""){
		 alert("enter name");
	 }
	 else{
$.ajax({
url: "saveupdatedDetails.jsp",
type: "post",
data: {
	fname:$('#firstname').val(),
	lname:$('#lname').val(),
	city_name:$('#cityname').val(),
	emailid:$('#email').val(),
	id:$('#id').val(),
success : function(data){
alert("success");
}
}
});
}
});

   </script>
    
</body>
</html>