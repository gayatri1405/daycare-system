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
	 	<!--<div>
			<P class="di">BABYCARE</P>
	 		<!-- <img class="con" src="https://assets.countrydelight.in/assets/images/logo.png"> -->
	 	</div>
	 	<!-- <div class="ri">
	 		 <a class="a" href="index.jsp">Login </a>
	 	</div> 
	 	<div class="ri">
	 	<a class="a" href="babylist.jsp"> BabyList </a>
	 		 
	 	</div>-->
	 	<!--<div class="ri">
	 		 Stock
	 	
	 	<div class="ri">
	 		  <a class="a" href="product.html">BabyProductInfo</a>
	 	</div>
	 	<div class="ri">
	 		 <a href="caretakerlist.jsp" class="a">CaretakerList </a>
	 	</div>
	 	<div class="ri">
	 		 <a href="addcaretaker.html" class="a">AddCaretaker</a>
	 	</div>
	 		 	<div class="ri">
	 		 <a href="Home.jsp" class="a">Home </a>
	 	</div>
	 </div>

	 </div> -->
	 <div>
	 	<jsp:include page="nav.jsp" />
	 </div>

<%
	// Get the form data from the request
	String cid = request.getParameter("cid");
	String name = request.getParameter("name");
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	String contact = request.getParameter("contact");
	
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
		String sql = "INSERT INTO caretaker (cid,name, dob, gender,contact) VALUES (?,?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cid);
		pstmt.setString(2, name);
		pstmt.setString(3, dob);
		pstmt.setString(4, gender);
		pstmt.setString(5, contact);
		pstmt.executeUpdate();
		
		// Display a message indicating the baby was added successfully
		out.println("<h1>Caretaker Records Added Successfully!</h1>");
		out.println("<p>Id: " + cid + "</p>");
		out.println("<p>Name: " + name + "</p>");
		out.println("<p>Date of Birth: " + dob + "</p>");
		out.println("<p>Gender: " + gender + "</p>");
		out.println("<p>Contact No: " + contact + "</p>");
		response.sendRedirect("caretakerlist.jsp");
		
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
