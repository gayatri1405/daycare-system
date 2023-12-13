<!DOCTYPE html>
<html>
<head>
    <title>Baby In-Time and Out-Time Form</title>
</head>
<body>
    <h2>Baby In-Time and Out-Time Form</h2>
    <form action="record_time.jsp" method="post">
        <label for="babyName">Baby's Id:</label>
        <input type="text" id="babyID" name="babyID" required>
        <button type="submit" name="action" value="inTime">Record In-Time</button>
        <button type="submit" name="action" value="outTime">Record Out-Time</button>
    </form>
</body>
</html>
