<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Information Update</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link href="css/passwordUpdateStyle.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div class="main">

        <!-- Information Update form section -->
        <section class="info-update">
            <div class="container">
                <div class="info-update-content">

                    <div class="info-update-form">
                    	 <!-- Form title -->
                        <h2 class="form-title">Information Update</h2>
						 <!-- Update information form -->
                        <form method="post" action="InformationUpdateProcessor.jsp" class="update-form" id="update-form">

							 <!-- Input field for current ID -->
							<div class="form-group">
                                <label for="id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="currentId" id="currentId" placeholder="Your current id" />
                            </div>
                            <!-- Input field for new ID -->
                            <div class="form-group">
                                <label for="id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id" placeholder="Your id" />
                            </div>
                             <!-- Input field for name -->
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name" />
                            </div>
                            <!-- Input field for email -->
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" />
                            </div>
                             <!-- Input field for contact number -->
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="contact" id="contact" placeholder="Contact no" />
                            </div>
							<!-- Form submit button -->
                            <div class="form-group form-button">
                                <input type="submit" name="update" id="update" class="form-submit" value="Update Information" />
                            </div>

                        </form>
                    </div>
                 
                </div>
            </div>
        </section>

    </div>
    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

</body>

</html>
