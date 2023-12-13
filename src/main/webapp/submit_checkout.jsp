<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.time.LocalDate, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%
    // Retrieve the submitted parameters
    String babyId = request.getParameter("babyId");
    String outTime = request.getParameter("outTime");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "root";

    // SQL query to update the out_time in the database for a specific baby_id and today's in_time
    String updateSql = "UPDATE baby_times SET out_time = ? WHERE baby_id = ? AND in_time >= ? AND in_time < ?";

    try {
        // Establish the database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Get the current date for comparison
        LocalDate today = LocalDate.now();

        // Prepare the SQL statement to update out_time
        PreparedStatement stmt = conn.prepareStatement(updateSql);

        // Set the parameters for the SQL statement
        stmt.setString(1, outTime);
        stmt.setString(2, babyId);
        stmt.setString(3, today.atStartOfDay().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        stmt.setString(4, today.plusDays(1).atStartOfDay().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

        // Execute the update query
        int rowsUpdated = stmt.executeUpdate();

        stmt.close();

        if (rowsUpdated > 0) {
            // Print success message
            out.println("<p>Out Time updated successfully!</p>");
        } else {
            // Print message when no rows were updated (invalid baby_id or in_time)
            out.println("<p>No rows updated. Invalid Baby ID or In Time.</p>");
        }

        // Close the database connection
        conn.close();
    } catch (Exception e) {
        // Print error message
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
