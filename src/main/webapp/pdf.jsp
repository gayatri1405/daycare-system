<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String enid = request.getParameter("enid");
String driverName = "com.mysql.cj.jdbc.Driver"; // Updated driver name for MySQL 8
String connectionUrl = "jdbc:mysql://localhost:3306/project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // Update connection URL

String userId = "root";
String password = "root";

String child_name = null;
String child_age = null;
String parent_name = null;
String email = null;
String phone = null;
String program = null;

try {
    Class.forName(driverName);
    Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
    String sql = "SELECT * FROM enrollments WHERE enid = ?";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, enid);
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        enid = resultSet.getString("enid");
        child_name = resultSet.getString("child_name");
        child_age = resultSet.getString("child_age");
        parent_name = resultSet.getString("parent_name");
        email = resultSet.getString("email");
        phone = resultSet.getString("phone");
        program = resultSet.getString("program");
    }

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}

// Generate ID Card PDF
String filePath = "C:\\Users\\DELL\\eclipse-workspace\\babycare\\src\\main\\webapp\\tmp\\" + child_name + ".pdf";
Document document = new Document(PageSize.A4);
PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath));

// ... (rest of the PDF generation code remains unchanged)

    try {
        document.open();

        // Add content to the PDF
        Paragraph title = new Paragraph("ABC Daycare - ID Card", new Font(Font.FontFamily.TIMES_ROMAN, 24, Font.BOLD));
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        // Add information
        Paragraph info = new Paragraph("Child's Enrollment Id: " + enid +
        		"\nChild's Name: " + child_name +
                "\nChild's Age: " + child_age +
                "\nParent's Name: " + parent_name +
                "\nEmail: " + email +
                "\nPhone Number: " + phone +
                "\nProgram of Interest: " + program);
        info.setAlignment(Element.ALIGN_LEFT);
        document.add(info);

        document.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>ID Card Generated</title>
</head>
<body>
    <header>
        <div>
            <jsp:include page="nav.jsp" />
        </div>
    </header>
    <h1>ID card downloaded successfully....</h1>
</body>
</html>
