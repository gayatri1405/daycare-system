<%@ page import="java.sql.*" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");

  // Perform database connection and insertion here
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");
    Statement stmt = con.createStatement();
    String query = "INSERT INTO users (username, password, email) VALUES ('" + username + "', '" + password + "', '" + email + "','"+ phone +"')";
    stmt.executeUpdate(query);
    con.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
