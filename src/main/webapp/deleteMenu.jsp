<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");

    // Get the id parameter from the request
    int id = Integer.parseInt(request.getParameter("id"));

    // Delete the menu item from the database
    PreparedStatement ps = con.prepareStatement("DELETE FROM menu WHERE id = ?");
    ps.setInt(1, id);
    int rowsDeleted = ps.executeUpdate();

    if (rowsDeleted > 0) {
        response.setStatus(HttpServletResponse.SC_OK); // Set HTTP status code to 200
    } else {
        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set HTTP status code to 404 if the menu item was not found
    }

    con.close();
} catch (ClassNotFoundException e) {
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set HTTP status code to 500 if there's a class not found exception
} catch (SQLException s) {
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set HTTP status code to 500 if there's a SQL exception
}
%>
