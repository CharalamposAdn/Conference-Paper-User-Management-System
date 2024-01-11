<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Update</title>
    <link rel="stylesheet" type="text/css" href="css/passwordUpdateStyle.css">
</head>
<body>

    <div class="main">
        <form action="passwordUpdateProcessor.jsp" method="post">
            <h2>Password Update</h2>

            <label for="oldPassword">Old Password:</label>
            <input type="password" name="oldPassword" required>

            <label for="newPassword">New Password:</label>
            <input type="password" name="newPassword" required>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" name="confirmPassword" required>

            <input type="submit" value="Update Password">
        </form>
    </div>

</body>
</html>
