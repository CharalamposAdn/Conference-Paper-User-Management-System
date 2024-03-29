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
                <li class="active"><a href="#"><i class="fa fa-home"></i>Home</a></li>
                <li><a href="About.jsp">About</a></li>
                <!-- View submenu -->
		 		 <li><a href="#"><i class="fa fa-caret-down"></i> View <i class="fa fa-caret-down"></i></a>
		                    <div class="sub-menu">
		                        <ul>	 
		                            <li><a href="#">View Papers</a></li>
		                            <li><a href="#">View Conferences</a></li>
		                        </ul>
		                    </div>
		                </li>
				<!-- Search submenu -->
  				<li><a href="#"><i class="fa fa-caret-down"></i> Search <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Search Papers</a></li>
                            <li><a href="#">Search Conferences</a></li>
                        </ul>
                    </div>
                </li>

				<!-- Exit option for logging out -->
            	 <li><a href="login.jsp">Exit</a></li>
	
	 </ul>	
		
</div>
		
					
		<!-- Title and button section -->
        <div class="title">
            <h1>PCU Management System</h1>
        </div>
		 <!-- Buttons for Paper, Conference, and User -->
        <div class="button">
            <a href="#" class="btn">PAPER</a>
            <a href="#" class="btn">CONFERENCE</a>
            <a href="#" class="btn">USER</a>
        </div>
    </header>
</body>
</html>