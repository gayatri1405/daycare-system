<%@ page contentType="text/plain" %>
<%@ page import="java.sql.*, java.io.*, java.util.Base64" %>

<%
    String imageData = request.getParameter("imageData");

    // Validate imageData
    if (imageData != null && !imageData.isEmpty()) {
        // Decode the base64 image data
        byte[] imageBytes = Base64.getDecoder().decode(imageData);

        // Save the image to the database (Replace with your database-specific code)
        try {
            // Your database code here...
            Connection conn = null;
            PreparedStatement pstmt = null;

            // Replace the following with your database connection setup
            String url = "jdbc:mysql://localhost:3306/project";
            String user = "root";
            String password = "root";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String query = "INSERT INTO images (image_data) VALUES (?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setBytes(1, imageBytes);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500); // Set an appropriate error status code
        }
    } else {
        // Handle the case when imageData is null or empty
        response.setStatus(400); // Bad Request status code
        response.getWriter().println("Image data is missing or empty.");
    }
%>
