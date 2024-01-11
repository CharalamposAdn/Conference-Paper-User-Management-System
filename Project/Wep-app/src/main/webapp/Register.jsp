
<%@ page import="com.site.UserValidator"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link href="css/Registration.css" rel="stylesheet" type="text/css">

    <!-- Add this script for custom tooltip -->
    <script>
    function showPasswordPatternTooltip() {
        var tooltip = document.getElementById("passwordPatternTooltip");
        tooltip.style.visibility = "visible";
        setTimeout(function(){
            tooltip.style.visibility = "hidden";
        }, 1000);
    }

    function showUsernamePatternTooltip() {
        var tooltip = document.getElementById("usernamePatternTooltip");
        tooltip.style.visibility = "visible";
        setTimeout(function(){
            tooltip.style.visibility = "hidden";
        }, 1000);
    }

        
        </script>
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">

                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>

                        <form method="" action="Registration1.jsp" class="register-form" id="register-form">

                            <div class="form-group">
                                <label for="id"><i class= "zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id" placeholder="Your id" />
                            </div>

                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name" onfocus= "showUsernamePatternTooltip()"  />
                                <div class="tooltiptext" id="usernamePatternTooltip" style="font-size: 12px;" >
      							  Username must start with a letter and have at least 5 characters, which can be alphanumeric or '_'.
 							   </div>
                            </div>

                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" />
                            </div>

                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Password" onfocus= "showPasswordPatternTooltip()" />
                                <div class="tooltiptext" id="passwordPatternTooltip"  style="font-size: 12px;">
                                    Password must be at least 8 characters, including uppercase, lowercase, digit, and special character.
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
                            </div>

                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="contact" id="contact" placeholder="Contact no" />
                            <div class="form-group checkbox-group">
							    <div class="checkbox-container">
							        <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
							        <label for="remember-me" class="label-agree-term">
							            <span><span></span></span>I agree all statements in <a href="Terms & Conditions.jsp" class="term-service">Terms of service</a>
							        </label>
							    </div>
							</div>

							</div>
                           

                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                            </div>

                            <div class="form-button a">
                                <a href="login.jsp" class="signup-image-link">I am already a member</a>
                            </div>

                        </form>
                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="image/signin_image.png" alt="sing up image">
                        </figure>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

</body>
<!-- This template was made by Colorlib (https://colorlib.com) -->
</html>
