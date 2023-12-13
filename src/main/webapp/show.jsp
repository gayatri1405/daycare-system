<%@ page import="java.sql.*" %>
<!--  <style>
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
		text-decoration: none
	}
	.head{
color:red;
}

h.{

}
</style>-->
<div>
	<jsp:include page="nav.jsp" />
	 	
	 </div>
	 
	  
	 
	
<h1 align="center"><font><strong>Details of Baby</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#71b7e6">
<td><b>Name</b></td>
<td><b>Age</b></td>
<td><b>Parent Name</b></td>
<td><b>Contact</b></td>
<td><b>Email</b></td>
<td><b>Program</b></td>
<td><b>Caretaker Id</b></td>


<%
   
	String cid = request.getParameter("cid");
	
    try {
    	ResultSet resultSet = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT b.child_name, b.child_age,b.parent_name,b.email,b.phone,b.program,c.cid FROM enrollments b, caretaker c, babycaretaker bc where bc.enid = b.enid and bc.cid=c.cid and bc.cid=?");
        ps.setString(1, cid);
       
        resultSet = ps.executeQuery();
        while(resultSet.next()){
        %>
      
       
       <tr bgcolor="white">

<td><%=resultSet.getString("child_name") %></td>
<td><%=resultSet.getString("child_age") %></td>
<td><%=resultSet.getString("parent_name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("program") %></td>
<td><%=resultSet.getString("cid") %></td>

</tr> 
         <% 
         }
        ps.close();
        con.close();
    
    }catch(Exception e) {
    	out.println("ENROLLEMENT ID OR CARETAKER ID IS NOT EXIST");
        out.println("Error: " + e.getMessage());
    }
%>
</table>





