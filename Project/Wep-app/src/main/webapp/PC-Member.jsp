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

            <ul>
                <li class="active"><a href="index.jsp"><i class="fa fa-home"></i>Home</a></li>
                 <!-- Navigation link for About -->
                <li><a href="About.jsp">About</a></li>
               <!-- Dropdown menu for View -->
		 		 <li><a href="#"><i class="fa fa-caret-down"></i> View <i class="fa fa-caret-down"></i></a>
		                    <div class="sub-menu">
		                        <ul>	 
		                            <li><a href="#">View Papers</a></li>
		                            <li><a href="#">View Conferences</a></li>
		                        </ul>
		                    </div>
		                </li>
				 <!-- Dropdown menu for Search -->
  				<li><a href="#"><i class="fa fa-caret-down"></i> Search <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Search Papers</a></li>
                            <li><a href="#">Search Conferences</a></li>
                        </ul>
                    </div>
                </li>
                	 <!-- Navigation link for Paper Review -->
					 <li><a href="#">Paper Review</a></li>
				<!-- Navigation link for exiting or logging out -->
            	 <li><a href="login.jsp">Exit</a></li>
	
		</ul>
</div>
		
					
 		<!-- Title section -->
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