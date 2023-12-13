<!DOCTYPE html>
<html>
<head>
    <title >Baby Check-In Form</title>
    <style>
        /* Embedded CSS */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h2 {
            color: #005ea5;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"], input[type="submit"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
            margin-bottom: 10px;
        }

        /* Adjust the appearance of the submit button */
        input[type="submit"] {
            background-color: #005ea5;
            color: white;
            cursor: pointer;
        }

        /* Style for the form container */
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div>
<jsp:include page="nav.jsp" />

</div>
    <h2 align="center">Baby Check-In Form</h2>
    <form id="checkInForm" method="post" action="submit_checkin.jsp">
        <!-- Input field for baby ID -->
        <label for="babyId">Baby ID:</label>
        <input type="text" id="babyId" name="babyId" required>
        <br>

        <!-- Hidden input field for in-time -->
        <input type="hidden" id="inTime" name="inTime" value="<%= java.time.LocalDateTime.now() %>">

        <!-- Display in-time (readonly) -->
        <label for="inTime">In Time:</label>
        <input type="text" id="inTimeDisplay" value="<%= java.time.LocalDateTime.now() %>" readonly>
        <br>

        <!-- Submit button -->
        <input type="submit" value="Check-In">
    </form>
</body>
</html>
