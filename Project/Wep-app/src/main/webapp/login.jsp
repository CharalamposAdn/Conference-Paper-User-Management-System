<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Log in</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link href="css/Login.css" rel="stylesheet" type="text/css">
</head>
<body>

    <div class="main">

        <!-- Sign in Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                  
                 
                    <div class="signin-form">
                        <h2 class="form-title">Log in</h2>
                        <form method="" action="loginsuccess.jsp" class="register-form" id="login-form">
                           <!-- Username Input -->
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name" />
                            </div>
                            <!-- Password Input -->
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Password" />
                            </div>
                            <!-- Remember Me Checkbox -->
                            <div class="form-group checkbox-group">
							    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
							    <label for="remember-me" class="label-agree-term">
							        <span><span></span></span>Remember me
							    </label>
							</div>
							 <!-- Submit Button -->
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                            </div>
                             <!-- Registration Link -->
                            <div class="form-button">
                                <a href="Register.jsp" class="signup-image-link">Create an account</a>
                            </div>
                        </form>
                        </div>
                        <!-- Social Login Section -->
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <!-- Social Media Icons -->
                            <ul class="socials">
                               <li><a href="https://www.facebook.com/?locale=el_GR"><img src="icons8-facebook-50.png" alt="Facebook"></a></li>
      						  <li><a href="https://twitter.com/i/flow/login"><img src="icons8-twitter-50.png" alt="Twitter"></a></li>
       						 <li><a href="https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F&ec=GAlAwAE&hl=el&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S470013343%3A1704908828909405&theme=glif"><img src="icons8-google-50.png" alt="Google"></a></li>
                            </ul>
                  </div>
                </div>
            </div>
        </section>
 			</div>
			

        <!-- I'm a Visitor and Admin Buttons  -->
        <div class="form-button" style="position: fixed; top: 20px; right: 20px; z-index: 1000;">
            <button onclick="visitAsGuest()" class="form-submit">I'm a Visitor</button>
            <button onclick="loginAsAdmin()" class="form-submit admin-button">Admin</button>
        </div>

   

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

	<!-- JavaScript functions for button actions -->
    <script>
    
    
    function visitAsGuest() {
        window.location.href = "Visitor.jsp";
    }

    function loginAsAdmin() {
        window.location.href = "AdminLogin.jsp";
    }
    
   
    
    </script>

</body>
</html>

