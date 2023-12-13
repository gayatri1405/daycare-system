<%@ page import="java.sql.*" %>
<%
  // Database connection details
  String url = "jdbc:mysql://localhost:3306/project";
  String username = "root";
  String password = "root";

  // Initialize variables
  int totalStudents = 0;

  try {
    // Create a database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, username, password);

    // Execute SQL query to get the count of enrolled students
    Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM enrollments");
    if (rs.next()) {
      totalStudents = rs.getInt("total");
    }

    // Close the database connection
    rs.close();
    stmt.close();
    con.close();
  } catch (Exception e) {
    e.printStackTrace();
  }

  // Print the total number of students enrolled
  out.print(totalStudents);
%>
