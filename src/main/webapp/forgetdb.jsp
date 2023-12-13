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

	 
	  
	 



<%
    String username = request.getParameter("username");
    try {
    	ResultSet resultSet = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username = ?");
        ps.setString(1, username);
       
        resultSet = ps.executeQuery();
        while(resultSet.next()){
        %>
        <h2 class=h>HELLO YOUR PASSWORD IS:</h2>
        
        <h1 class=head><%=resultSet.getString("pass") %></h1>
        
        <% 
        }
        ps.close();
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>





