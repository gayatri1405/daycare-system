<!DOCTYPE html>
<html>
<head>
	<title>Add Caretaker Form</title>
	<style>
		*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
 
  font-family: "Poppins", sans-serif;
}
		form {
			margin: 50px auto;
			width: 400px;
			padding: 20px;
			background-color: white ;
			border-radius: 10px;
			box-shadow: 10px 10px 15px rgba(0,0,0,0.05);
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
		}
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
		input[type=text], select,date,textarea {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			border: 2px solid #ccc;
			border-radius: 4px;
	 
			resize: none;
		}
		input[type=submit] {
			background-color:purple ;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		input[type=submit]:hover {
		  background: linear-gradient(135deg, #71b7e6, #9b59b6);
		}
		.error {
			color: red;
			font-size: 12px;
			margin-top: 5px;
		}
		.header{
			margin-left:70px;
		}
		.nav{
		width: 100%;

		height: 80px;
		 display: flex;
		 background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	#n{
		       background: linear-gradient(135deg, #71b7e6, #9b59b6);

	}
	.ri{
     margin-left: 90px;
     margin-top: 30px;
     font-size: 20px;
     color: white;
	}
	.di{
		margin-left: 20px;
		font-size: 20px;
		color: white;
		font-family:cursive;
		margin-top:25px; 
	}
	.a{
		color: aliceblue;
	}
		.ri{
     margin-left: 100px;
     margin-top: 30px;
     font-size: 20px;
     color: white;
	}
	.di{
		margin-left: 20px;
		font-size: 25px;
		color: white;
		font-family:cursive;
		margin-top:25px; 
	}
	.a{
		color: aliceblue;
	} 
	</style>
</head>
<body>
<div>
<jsp:include page="nav.jsp" />
</div>
	 
	  
	 
	 <div>
	 <form method="post" action="addcaretakerdb.jsp">
		<h1 class="header" >Add Caretaker</h1>
		<label for="cid">id:</label>
		<input type="text" id="cid" name="cid" required>
		
		<label for="name">Caretaker Name:</label>
		<input type="text" id="name" name="name" placeholder="Enter caretaker name" required>

		<label for="dob">Date of Birth:</label>
		<input type="date" id="dob" name="dob" required>

		<label for="gender">Gender:</label>
		<select id="gender" name="gender">
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select>
		<label for="aadhar">Contact Number:</label>
		<input type="text" id="contact" name="contact" required  pattern="^\d{10}$" required title="Please enter a valid 10-digit Contact number">
		
		<input type="submit" value="Add CareTaker">
	</form>
	 </div>
</body>
</html>
