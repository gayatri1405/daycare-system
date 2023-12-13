<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String username= request.getParameter("username");
session.putValue("username", username);
String pass= request.getParameter("pass");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from admin where username='" + username +
 "' and pass ='" + pass + "'");

 rs.next();
 if (rs.getString("pass").equals(pass) && rs.getString("username").equals(username)) {
 
  response.sendRedirect("Home.jsp");

 } else {
  out.println("Invalid password or username.");
 }
} catch (ClassNotFoundException e) {
    out.print(e.getMessage() + "" + e);
}
catch(SQLException s)
{
	out.println("Invalid password or username.");
    out.println(s.getMessage());
}
%>