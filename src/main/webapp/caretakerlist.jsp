<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/project";

String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<style>
.nav{
		width: 100%;

		height: 20%;
		 display: flex;
		 background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	#n{
		       background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	.ri{
     margin-left: 100px;
     margin-top: 30px;
     font-size: 20px;
     color: white;
	}
	.di{
		margin-left: 20px;
		font-size: 25px;
		color: white;
		font-family:cursive;
		margin-top:25px; 
	}
	.a{
		color: aliceblue;
	}
</style>
<div>
	 	<jsp:include page="nav.jsp" />
	 </div>
	 
	  
	 
	
<h1 align="center"><font><strong>Caretaker List</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#71b7e6">
<td><b>Carataker Id</b></td>
<td><b>Name</b></td>
<td><b>DOB</b></td>
<td><b>Gender</b></td>
<td><b>Contact No</b></td>


<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM caretaker";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="white">
<td><%=resultSet.getString("cid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("contact") %></td>
<td><a href="deletecaretaker.jsp?cid=<%=resultSet.getString("cid") %>"><button type="button"  class="delete">Delete</button></a></td>

</tr> 
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>