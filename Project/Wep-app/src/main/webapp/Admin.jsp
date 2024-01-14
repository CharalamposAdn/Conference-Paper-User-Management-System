<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title> PCU Management System  </title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  

</head>
<body>
    <header>
        <div class="main">
            <div class="logo">
                <img src="logo.png">
            </div>
				 <!-- Navigation menu -->
            <ul>
            	<!-- Home link with home icon -->
                <li class="active"><a href="#"><i class="fa fa-home"></i>Home</a></li>
                <!-- About link -->
                <li><a href="About.jsp">About</a></li>
               <!-- View dropdown with Papers and Conferences sub-menu -->
		 		 <li><a href="#"><i class="fa fa-caret-down"></i> View <i class="fa fa-caret-down"></i></a>
		                    <div class="sub-menu">
		                        <ul>	 
		                            <li><a href="#">View Papers</a></li>
		                            <li><a href="#">View Conferences</a></li>
		                        </ul>
		                    </div>
		                </li>
				<!-- Search dropdown with Search Papers and Search Conferences sub-menu -->
  				<li><a href="#"><i class="fa fa-caret-down"></i> Search <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Search Papers</a></li>
                            <li><a href="#">Search Conferences</a></li>
                        </ul>
                    </div>
                </li>
                 <!-- View Users link -->
				 <li><a href="ViewUsers.jsp">View Users</a></li>	
				 <!-- Logout link -->
            	 <li><a href="login.jsp">Logout</a></li>
		
	
		
		
		
		
		

</div>
		
					

        <div class="title">
            <h1>PCU Management System</h1>
        </div>
		<!-- Button section with links for PAPER, CONFERENCE, and USER -->
        <div class="button">
           <a href="#" class="btn">PAPER</a>
            <a href="#" class="btn">CONFERENCE</a>
            <a href="#" class="btn">USER</a>
        </div>
    </header>
</body>
</html>