<%@ page import="java.sql.*" %>
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
<div>
	<jsp:include page="nav.jsp" />
</div>	
<%
    String cid = request.getParameter("cid");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
        PreparedStatement ps = con.prepareStatement("DELETE FROM caretaker WHERE cid = ?");
        ps.setString(1, cid);
        int rowsDeleted = ps.executeUpdate();
        if(rowsDeleted > 0) {
            out.println("Record deleted successfully");
        } else {
            out.println("Record not found or already deleted");
        }
        response.sendRedirect("caretakerlist.jsp");
        ps.close();
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>





