<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Account</title>
     <link rel="stylesheet" type="text/css" href="css/passwordUpdateStyle.css">
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
        <form action="DeleteAccount.jsp" method="post">
            <h2>Delete Account</h2>

            <label for="password">Current Password:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Delete Account">
        </form>
    </div>

</body>
</html>
