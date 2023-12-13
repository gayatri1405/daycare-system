<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    // Retrieve the submitted parameters
    String babyId = request.getParameter("babyId");
    String inTime = request.getParameter("inTime");
    String outTime = request.getParameter("outTime");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "root";

    // SQL query to insert the data into the database
    String sql = "INSERT INTO baby_times (baby_id, in_time, out_time) VALUES (?, ?, ?)";

    try {
        // Establish the database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Prepare the SQL statement
        PreparedStatement stmt = conn.prepareStatement(sql);

        // Set the parameters for the SQL statement
        stmt.setString(1, babyId);
        stmt.setString(2, inTime);
        stmt.setString(3, outTime);

        // Execute the SQL statement
        stmt.executeUpdate();

        // Close the resources
        stmt.close();
        conn.close();

        // Print success message
        out.println("<p>Submission successful!</p>");

    } catch (Exception e) {
        // Print error message
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
