<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Page</title>
    <script>
        window.onload = function() {
            setTimeout(function() {
                window.location.href = "home.html";
            }, 2000); // Redirect after 2 seconds (adjust as needed)
        };
    </script>
</head>
<body>
    <% 
        String username = (String) session.getAttribute("username");
        if (username != null) {
            // Clear the session attribute
            session.removeAttribute("username");
        }
    %>
    <h1>Logged out successfully!</h1>
    <p>Thank you for using our website. You have been logged out.</p>
   
</body>
</html>
