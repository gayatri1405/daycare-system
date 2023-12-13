<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%
  // Retrieve form data
  String childName = request.getParameter("name");
  String childAge = request.getParameter("age");
  String parentName = request.getParameter("parent");
  String email = request.getParameter("email");
  String phoneNumber = request.getParameter("phone");
  String program = request.getParameter("program");
  String altphone = request.getParameter("altphone");
  String parentoccupation = request.getParameter("parentoccupation");
  String disability = request.getParameter("disability");
  String habit = request.getParameter("habit");
  String eatinghabit = request.getParameter("eatinghabit");
  String instruction = request.getParameter("instruction");
  String pediatric_name = request.getParameter("pediatric_name");
  String pediatric_no = request.getParameter("pediatric_no");
  String add = request.getParameter("add");


  // Establish database connection
  Connection connection = null;
  PreparedStatement statement = null;
  try {
    // Modify the connection URL, username, and password according to your database setup
    String url = "jdbc:mysql://localhost:3306/project";
    String username = "root";
    String password = "root";
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url, username, password);

    // Insert form data into the database
 String query = "INSERT INTO enrollments (child_name, child_age, parent_name, email, phone, program,altphone,parentoccupation,disability,habit,eatinghabit,instruction,pediatric_name,pediatric_no) VALUES (?,?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?)";
    statement = connection.prepareStatement(query);
    statement.setString(1, childName);
    statement.setString(2, childAge);
    statement.setString(3, parentName);
    statement.setString(4, email);
    statement.setString(5, phoneNumber);
    statement.setString(6, program);
    statement.setString(7, altphone);
    statement.setString(8, parentoccupation);
    statement.setString(9, disability);
    statement.setString(10, habit);
    statement.setString(11, eatinghabit);
    statement.setString(12, instruction);
    statement.setString(13, pediatric_name);
    statement.setString(14, pediatric_no);
   // statement.setString(15, add);
    statement.executeUpdate();

    // Close the statement and connection
    statement.close();
    connection.close();
  } catch (Exception e) {
	  out.print(e.getMessage());
    e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Enrollment Form - ABC Daycare</title>
  <style>
    /* Add your CSS styles here */
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

nav ul li a:visited {
  color: #666;
}

nav ul li a:hover,
nav ul li a:focus {
  color: #ff6f00;
}

p{
		 
          font-size: 10px;
          margin-left: 190px;
	}
	.pp{
		margin-left: 1000px;
		margin-top: 100px;


	}
	.b{
		background-color: rgb(0 0 0);
		margin-right: 20px;
		 padding-left: 30px;
		 padding-right: 30px;
		 padding-top: 10px;
		 padding-bottom: 10px;
		 


	}
	.nav{
		width: 120%;

		height: 80px;
		 display: flex;
		 background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	#n{
		       background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	.con{
		margin-left: 100px;
	}
	.ri{
     margin-left: 80px;
     margin-top: 30px;
     font-size: 20px;
     color: white;
	}
	.ff{
		display: flex;
		margin-left: 200px;
		margin-top: 100px;
	}
	.img{
             width: 350px;
             height: 350px;
	}
	.mi{
		margin-left: 40px;
		font-size: 25px;
	padding-top: 0.009px;
	 border-radius: 10px; 
	padding-bottom: 0.009px;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);

		text-align: center;
		color: white;
	}
	.di{
		margin-left: 20px;
		font-size: 25px;
		color: white;
		font-family:cursive;
	}
	.a{
		color: aliceblue;
	}
	.p{
	font-size:40px;
	}
	.footer{
		font-size:20px;
	}
  </style>
</head>
<body>
  <div>
  
	 </div>
  
  <div class="form-container">
    
    <p class="p">Thank you for enrolling your child!</p>
    <!-- You can add a success message here -->
  </div>
  
  <footer>
    <p class="footer">&copy; 2023 ABC Daycare. All rights reserved.</p>
  </footer>
</body>
</html>
