<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.time.LocalDateTime, java.time.LocalDate, java.time.LocalTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Retrieve the submitted parameters
    String babyId = request.getParameter("babyId");
    String outTime = request.getParameter("outTime");

    // Check if outTime is submitted for today's date and time
    LocalDateTime currentDateTime = LocalDateTime.now();
    LocalDate currentDate = currentDateTime.toLocalDate();
    LocalTime currentTime = currentDateTime.toLocalTime();
    LocalDateTime submittedOutTime = LocalDateTime.parse(outTime); // Assuming outTime is in ISO format (e.g., "2023-08-03T12:34:56")

    if (!submittedOutTime.toLocalDate().isEqual(currentDate)) {
        // Print error message when outTime is not for today's date
        out.println("<p>Out Time must be submitted for today's date and time only.</p>");
    } else {
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/project";
        String user = "root";
        String password = "root";

        // SQL query to update the out_time in the database for a specific in_time
        String updateSql = "UPDATE baby_times SET out_time = ? WHERE baby_id = ? AND in_time = ?";

        try {
            // Establish the database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            // Use JSTL to fetch the in_time from the database based on baby_id
            String inTime = null;
            String selectSql = "SELECT in_time FROM baby_times WHERE baby_id = ?";
            PreparedStatement selectStmt = conn.prepareStatement(selectSql);
            selectStmt.setString(1, babyId);
            ResultSet resultSet = selectStmt.executeQuery();

            if (resultSet.next()) {
                inTime = resultSet.getString("in_time");
            }

            resultSet.close();
            selectStmt.close();

            if (inTime != null) {
                // Prepare the SQL statement to update out_time
                PreparedStatement stmt = conn.prepareStatement(updateSql);

                // Set the parameters for the SQL statement
                stmt.setString(1, outTime);
                stmt.setString(2, babyId);
                stmt.setString(3, inTime);

                // Execute the update query
                int rowsUpdated = stmt.executeUpdate();

                stmt.close();

                if (rowsUpdated > 0) {
                    // Print success message
                    out.println("<p>Out Time updated successfully!</p>");
                } else {
                    // Print message when no rows were updated (invalid in_time or baby_id)
                    out.println("<p>No rows updated. Invalid Baby ID or In Time.</p>");
                }
            } else {
                // Print message when in_time is not found for the provided baby_id
                out.println("<p>No in_time found for the provided Baby ID.</p>");
            }

            // Close the database connection
            conn.close();
        } catch (Exception e) {
            // Print error message
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>
