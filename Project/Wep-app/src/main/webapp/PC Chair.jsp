<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>PCU Management System</title>
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
                <li><a href="About.jsp">About</a></li>

                <!-- View Menu -->
                <li><a href="#"><i class="fa fa-caret-down"></i>View <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">View Papers</a></li>
                            <li><a href="#">View Conferences</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Search Menu -->
                <li><a href="#"><i class="fa fa-caret-down"></i>Search <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Search Papers</a></li>
                            <li><a href="#">Search Conferences</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Conference Management Menu -->
                <li><a href="#"><i class="fa fa-caret-down"></i>Conference Management <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Create Conference</a></li>
                            <li><a href="#">Update Conference</a></li>
                            <li><a href="#">Add PC Chairs</a></li>
                            <li><a href="#">Add PC Members</a></li>
                            <li><a href="#">Search Conferences</a></li>
                            <li><a href="#">View Conference</a></li>
                            <li><a href="#">Delete Conference</a></li>
                            <li><a href="#">Submission Start</a></li>
                            <li><a href="#">Reviewer Assignment Start</a></li>
                            <li><a href="#">Review Start</a></li>
                            <li><a href="#">Decision Making</a></li>
                            <li><a href="#">Final Submission Start</a></li>
                            <li><a href="#">Conference End</a></li>
                        </ul>
                    </div>
                </li>

                <!-- Exit Menu -->
                <li><a href="login.jsp">Exit</a></li>
            </ul>
        </div>

        <div class="title">
            <h1>PCU Management System</h1>
        </div>

        <div class="button">
            <a href="#" class="btn">PAPER</a>
            <a href="#" class="btn">CONFERENCE</a>
            <a href="#" class="btn">USER</a>
        </div>
    </header>
</body>
</html>
tml>