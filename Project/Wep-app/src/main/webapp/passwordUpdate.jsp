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
    <!-- Form for updating the password, action points to passwordUpdateProcessor.jsp using the POST method -->
        <form action="passwordUpdateProcessor.jsp" method="post">
            <h2>Password Update</h2>
			 <!-- Input for the old password -->
            <label for="oldPassword">Old Password:</label>
            <input type="password" name="oldPassword" required>
			<!-- Input for the new password -->
            <label for="newPassword">New Password:</label>
            <input type="password" name="newPassword" required>
			 <!-- Input to confirm the new password -->
            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" name="confirmPassword" required>
			 <!-- Submit button to trigger the password update -->
            <input type="submit" value="Update Password">
        </form>
    </div>

</body>
</html>
