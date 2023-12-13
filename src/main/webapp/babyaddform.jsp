<!DOCTYPE html>
<html>
<head>
  <title>Enrollment Form - ABC Daycare</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: #f7f7f7;
      padding: 20px;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }
    
    nav ul li {
      display: inline;
      margin-right: 20px;
    }
    
    nav ul li a {
      text-decoration: none;
      color: #333;
    }
    
    .form-container {
      max-width: 500px;
      margin: 50px auto;
      padding: 20px;
      
    }
    
    .form-container h2 {
      margin-bottom: 20px;
    }
    
    .form-container label {
      display: block;
      margin-bottom: 10px;
    }
    
    .form-container input[type="text"],
    .form-container select {
      width: 90%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    
    .form-container button {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
    }
    
    .form-container button:hover {
      background-color: #555;
    }

    .a{
      border: 1px solid orange;
      border-radius: 5px;
    }
  </style>
</head>
<body>
 
  <div>	<jsp:include page="nav.jsp" /></div>
  
  <div class="form-container">
    <fieldset class="a">
    <legend><h2>Enrollment Form</h2></legend>
    <form action="enrollmentdb.jsp" method="POST">
      <label for="name">Child's Name:</label>
      <input type="text" id="name" name="name" required>
      
      <label for="age">Child's Age:</label>
      <input type="text" id="age" name="age" required>
      
      <label for="parent">Parent's Name:</label>
      <input type="text" id="parent" name="parent" required>
      
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" required>
      
      <label for="phone">Phone Number:</label>
      <input type="text" id="phone" name="phone" required pattern="^\d{10}$" required title="Please enter a valid 10-digit Contact number">
      
      <label for="program">Program of Interest:</label>
      <select id="program" name="program">
        <option value="infant">Infant Care</option>
        <option value="toddler">Toddler Program</option>
        <option value="preschool">Preschool</option>
      </select>
      <br>
      <br><button type="submit">Submit</button>
    </form>
  </div>
  </fieldset>
  
  <footer>
    <p>&copy; 2023 ABC Daycare. All rights reserved.</p>
  </footer>
</body>
</html>
