<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Account</title>
     <link rel="stylesheet" type="text/css" href="css/passwordUpdateStyle.css">
     <!-- JavaScript functions for showing success and error popups -->
    <script>
        function showSuccessPopup(message) {
            alert(message);
            window.location.href = "login.jsp";
        }

        function showErrorPopup(message) {
            alert(message);
            window.location.href = "index.jsp";
        }
    </script>
</head>
<body>

    <div class="main">
     <!-- Form for account deletion -->
        <form action="DeleteAccount.jsp" method="post">
            <h2>Delete Account</h2>
			<!-- Input field for entering current password -->
            <label for="password">Current Password:</label>
            <input type="password" name="password" required>
			<!-- Submit button to initiate account deletion -->
            <input type="submit" value="Delete Account">
        </form>
    </div>

</body>
</html>
