<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check-In Submission Result</title>
</head>
<body>
<div>
<jsp:include page="nav.jsp" />

</div>
    <h2>Check-In Submission Result</h2>
    <%-- Retrieve the submitted parameters --%>
    <% String babyid = request.getParameter("babyId"); %>
    <% String InTime = request.getParameter("inTime"); %>

    <%-- Store the data in the database --%>
    <%@ include file="store_data.jsp" %>
</body>
</html>
