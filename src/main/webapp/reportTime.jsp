<%@ page import="java.sql.*" %>

<%
	// Get the form data from the request
	int enid = Integer.parseInt(request.getParameter("enid"));
    String rdate = request.getParameter("rdate");
	String intime = request.getParameter("intime");
	String outtime = request.getParameter("outtime");
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
		String sql = "INSERT INTO baby_time (enid,rdate,intime,outtime) VALUES (?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, enid);
		pstmt.setString(2, rdate);
		pstmt.setString(3, intime);
		pstmt.setString(4, outtime);
		pstmt.executeUpdate();
		
		// Display a message indicating the baby was added successfully
		out.println("<h1>Baby Reporting Added Successfully!</h1>");
		out.println("<p>AADHAR NO: " + enid + "</p>");
		out.println("<p>Date: " + rdate + "</p>");
		out.println("<p>InTime: " + intime + "</p>");
		out.println("<p>OutTime: " + outtime + "</p>");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.println("Error: MySQL JDBC driver not found");
	} catch (SQLException e) {
		e.printStackTrace();
		out.println("Error: " + e.getMessage());
		out.println("Error: Failed to update database");
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
				
				out.println("Error: " + e.getMessage());
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("Error: Failed to close database connection");
				out.println("Error: " + e.getMessage());
			}
		}
	}
%>
