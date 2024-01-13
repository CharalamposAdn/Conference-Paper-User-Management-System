<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	// Redirect to login page if the user is not authenticated (session attribute "name" is null)
    if(session.getAttribute("name") == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>PCU Management System</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
      <!-- Internal styles for additional styling --> 
    <style>
        .welcomeMessage {
            color: white;
        }

        .userName {
            color: white;
            margin-top: 5px; /* Add margin for spacing */
        }
    </style>
</head>
<body>
    <header>
        <div class="main">
            <div class="logo">
                <img src="logo.png">
            </div>
			<!-- Navigation menu -->
            <ul>
             
				  <!-- Home link -->
                <li class="active"><a href="#"><i class="fa fa-home"></i>Home</a></li>
                <!-- About link -->
                <li><a href="About.jsp">About</a></li>
                

               
                   
                <!-- Continue As dropdown with Author, PC Chair, and PC Member sub-menu -->
                 <li><a href="#"><i class="fa fa-caret-down"></i> Continue As <i class="fa fa-caret-down"></i></a>
                <div class="sub-menu">
                    <ul>
                      <li><a href="Author.jsp">AUTHOR</a></li>
                        <li><a href="PC Chair.jsp">PC CHAIR</a></li>
                        <li><a href="PC-Member.jsp">PC MEMBER</a></li>
                    </ul>
                </div>
            	<li>
                <!-- User-specific dropdown with Update Information, Password Update, and Delete User Account sub-menu -->
                <li><a href="#"><i class="fa fa-caret-down"></i> <%= session.getAttribute("name") %> <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="InformationUpdate.jsp">Update Information</a></li>
                            <li><a href="passwordUpdate.jsp">Password Update</a></li>
                            <li><a href="Delete.jsp">Delete User Account</a></li>
                        </ul>
                    </div>
                     	<!-- Logout link -->
                      <li><a href="logout.jsp">Logout</a></li>
                    
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


