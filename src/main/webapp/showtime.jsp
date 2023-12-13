<%@ page import="java.sql.*" %>
<style>
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
	.head{
color:red;
}

h.{

}
</style>
<div>
	
	 <jsp:include page="nav.jsp" />
	 
	  
	 
	 </div>
<h1 align="center"><font><strong>Details of Baby</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#71b7e6">
<td><b>Enrollment ID</b></td>

<td><b>INTIME</b></td>
<td><b>OUTTIME</b></td>



<%
   
	String enid = request.getParameter("enid");
	
    try {
    	ResultSet resultSet = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM baby_times");
        
       
        resultSet = ps.executeQuery();
        while(resultSet.next()){
        %>
      
       
       <tr bgcolor="white">


<!--  <td><%=resultSet.getString("id") %></td>-->
<td><%=resultSet.getString("baby_id") %></td>
<td><%=resultSet.getString("in_time") %></td>
<td><%=resultSet.getString("out_time") %></td>


</tr> 
         <% 
         }
        ps.close();
        con.close();
    
    }catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</table>





