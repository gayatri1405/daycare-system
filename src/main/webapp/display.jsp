<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String savePath = "C:/Users/DELL/eclipse-workspace/babycare/src/main/webapp/images"; // Change this path as per your server setup
String fileName = null;

if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
    Part filePart = request.getPart("imageFile");
    fileName = getFileName(filePart);
    File file = new File(savePath, fileName);

    try (InputStream inputStream = filePart.getInputStream();
         FileOutputStream outputStream = new FileOutputStream(file)) {
        int read;
        byte[] buffer = new byte[1024];
        while ((read = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, read);
        }
    }
}

// Save the file path in the database (assuming you have a connection to the database)
String imagePath = "images/" + fileName; // The path relative to your web application root

// Perform database insert operation here using JDBC or any ORM framework
// For simplicity, let's assume we have a table "images" with columns "id" and "image_path"
Connection connection = null;
PreparedStatement preparedStatement = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/project";
    String userId = "root";
    String password = "root";

    connection = DriverManager.getConnection(url, userId, password);
    String sql = "INSERT INTO images (image_path) VALUES (?)";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, imagePath);
    preparedStatement.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

response.sendRedirect("upload.html"); // Redirect to the upload form page after successful upload
%>

<%!
private String getFileName(Part part) {
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
    }
    return "default.jpg"; // Return a default name if filename not found in the request
}
%>
