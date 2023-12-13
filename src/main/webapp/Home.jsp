<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<style type="text/css">
	
	/* *{
		background-image: url("image.png");
		 
	}  */
	

	
	.p{
		 
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
		margin-left: 250px;
		margin-top: 100px;
		align:"center";
	}
	.img{
             width: 400px;
             height: 400px;
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
	}
	.a{
		color: aliceblue;
	}
</style>
<body >
<div>
<jsp:include page="nav.jsp" />

</div>
	 
	  
	 	 	<div class="ff">
	 	 		<div>
					<img class="img" src="https://th.bing.com/th/id/OIP.pZs3ARXzwt2w61_S037nXAHaIw?w=160&h=189&c=7&r=0&o=5&pid=1.7">
                       <div class="mi">
                      	 <a style="text-decoration: none" class="a" href="enrollment.html"><h3>Add_baby</h3></a>
                      </div>
	 	         </div>
	 	         <div>
					<img class="img" src=" https://th.bing.com/th/id/OIP.wW1RgSZZYjD9zSFP8XTDswHaJ4?w=125&h=180&c=7&r=0&o=5&pid=1.7">

	 	         	<div class="mi">
                      	<a style="text-decoration: none" class="a" href="babylist.jsp"><h3> Delete_Baby_Record</h3></a>
                      </div>
	 	         </div>
	 	         <!--   <div>
	 	         	<img class="img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXWCWcPjmhENxujs8-l4Kj-xGozKOeKDttkg&usqp=CAU">
	 	         	<div class="mi">
                      	<a style="text-decoration: none" class="a" href="report.jsp"><h3>Report Time</h3></a>
                      </div>
	 	         </div>-->
	 	 	</div>
 
</body>
</html>