<%@ page import="java.sql.*" %>
<html>
<div id="n" class="nav">
<head>
<style type="text/css">
	
	/* *{
		background-image: url("image.png");
		 
	}  */
	.p{
		 
          font-size: 10px;
          margin-left: 190px;
	}
	.pp{
		margin-left: 1000px;
		margin-top: 100px;


	}
	.b{
		background-color: rgb(0 0 0);
		margin-right: 20px;
		 padding-left: 30px;
		 padding-right: 30px;
		 padding-top: 10px;
		 padding-bottom: 10px;
		 


	}
	
	
	.con{
		margin-left: 100px;
	}
	.ri{
     margin-left: 90px;
     margin-top: 30px;
     font-size: 20px;
     color: white;
	}
	.ff{
		display: flex;
		margin-left: 300px;
		margin-top: 100px;
	}
	.img{
             width: 350px;
             height: 350px;
	}
	.mi{
		margin-left: 40px;
		font-size: 25px;
	padding-top: 0.009px;
	 border-radius: 10px; 
	padding-bottom: 0.009px;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);

		text-align: center;
		color: white;
	}
	.di{
		margin-left: 20px;
		font-size: 25px;
		color: white;
		font-family:cursive;
	}
	.a{
		color: aliceblue;
	}
</style></head></div>
<body >
<div>
<jsp:include page="nav.jsp" />
</div>
</body>

</html>
<%
	// Get the form data from the request
	String cid = request.getParameter("cid");
	String enid = request.getParameter("enid");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		// Load the MySQL JDBC driver
		Class.forName("com.mysql.jdbc.Driver");
		
		// Set up the database connection
		String dbUrl = "jdbc:mysql://localhost:3306/project";
		String dbUser = "root";
		String dbPass = "root";
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		// Insert the new baby information into the database
		String sql = "INSERT INTO babycaretaker (cid,enid) VALUES ( ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cid);
		pstmt.setString(2, enid);
		pstmt.executeUpdate();
		
		// Display a message indicating the baby was added successfully
		out.println("<h1>Caretaker Assign To Baby Successfully!</h1>");
		
		out.println("<p>Caretaker Id : " + cid + "</p>");
		out.println("<p>Enrollment Id: " + enid + "</p>");
	
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.println("Error: MySQL JDBC driver not found");
	} catch (SQLException e) {
		e.printStackTrace();
		out.println("Error: Failed to update database");
		out.print(e.getMessage());
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("Error: Failed to close statement");
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("Error: Failed to close database connection");
			}
		}
	}
%>
