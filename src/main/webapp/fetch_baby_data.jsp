<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.JSONObject" %>

<%
    // Retrieve the Baby ID from the request parameter
    String babyId = request.getParameter("babyId");
    String babyName = "";

    // Database connection information
    String dbUrl = "jdbc:mysql://localhost:3306/your_database_name"; // Update with your actual database URL
    String dbUsername = "your_database_username";
    String dbPassword = "your_database_password";

    // Database query to fetch the baby name based on the provided Baby ID
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the database connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // Prepare the SQL statement
        String sql = "SELECT baby_name FROM baby_table WHERE baby_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, babyId);

        // Execute the query
        ResultSet rs = pstmt.executeQuery();

        // Check if a result was found and retrieve the baby name
        if (rs.next()) {
            babyName = rs.getString("baby_name");
        }

        // Close the resources
        rs.close();
        pstmt.close();
        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // Handle any exceptions as needed
    }

    // Set the response content type to JSON
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    // Create a JSON object with the baby name
    JSONObject jsonResponse = new JSONObject();
    jsonResponse.put("babyName", babyName);

    // Write the JSON response
    response.getWriter().write(jsonResponse.toString());
%>
