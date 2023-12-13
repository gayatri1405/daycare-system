<%@ page import="java.sql.*" %>
<div id="n" class="nav">
<style>
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
	 	<div>	<jsp:include page="nav.jsp" /></div>
	
	 

<%
	// Get the form data from the request
	String name = request.getParameter("name");
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	String aadhar = request.getParameter("aadhar");
	String instructions = request.getParameter("instructions");
	
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
		String sql = "INSERT INTO babies (name, dob, gender,aadhar,instructions) VALUES (?,?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dob);
		pstmt.setString(3, gender);
		pstmt.setString(4, aadhar);
		pstmt.setString(5, instructions);
		pstmt.executeUpdate();
		
		// Display a message indicating the baby was added successfully
		out.println("<h1>Caretaker Records Added Successfully!</h1>");
		
		out.println("<p>Name: " + name + "</p>");
		out.println("<p>Date of Birth: " + dob + "</p>");
		out.println("<p>Gender: " + gender + "</p>");
		out.println("<p>Aadhar No: " + aadhar + "</p>");
		out.println("<p>Instructions: " + instructions + "</p>");
		response.sendRedirect("babylist.jsp");
		
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
