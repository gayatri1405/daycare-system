 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
</head>
<body>
    <form method="post" action="upload.jsp" enctype="multipart/form-data">
        <input type="file" name="image" accept="image/*" />
        <input type="submit" value="Upload" />
    </form>
</body>
</html>
 