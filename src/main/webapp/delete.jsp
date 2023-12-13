<%@ page import="java.sql.*" %>
<%
    String enid = request.getParameter("enid");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
        PreparedStatement ps = con.prepareStatement("DELETE FROM enrollments WHERE enid = ?");
        ps.setString(1, enid);
        int rowsDeleted = ps.executeUpdate();
        if(rowsDeleted > 0) {
            out.println("Record deleted successfully");
        } else {
            out.println("Record not found or already deleted");
        }
        response.sendRedirect("babylist.jsp");
        ps.close();
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>





