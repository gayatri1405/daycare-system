<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String enid = request.getParameter("enid");
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
<!--<style>
.nav{
		width: 100%;

		height: 80px;
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
</style>-->
<div>
	 <jsp:include page="nav.jsp" />
	 </div>
<h1 align="center"><font><strong>Baby List</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#71b7e6">
<td><b>Enrollment ID</b></td>
<td><b>Name</b></td>
<td><b>Age</b></td>
<td><b>ParentName</b></td>
<td><b>Email</b></td>
<td><b>Contact</b></td>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM enrollments";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="white">
<td><%=resultSet.getString("enid") %></td>
<td><%=resultSet.getString("child_name") %></td>
<td><%=resultSet.getString("child_age") %></td>
<td><%=resultSet.getString("parent_name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><a href="delete.jsp?enid=<%=resultSet.getString("enid") %>"><button type="button"  class="delete">Delete</button></a></td>
<td><a href="pdf.jsp?enid=<%=resultSet.getString("enid") %>"><button type="button"  class="pdf">Download ID</button></a></td>

</tr> 
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>