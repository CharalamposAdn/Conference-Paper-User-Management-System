<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Information</title>
</head>
<body>

    <form action="updateUser" method="post">
        <label for="newUsername">New Username:</label>
        <input type="text" id="newUsername" name="newUsername" required>

        <label for="newName">New Name:</label>
        <input type="text" id="newName" name="newName" required>

        <label for="newEmail">New Email:</label>
        <input type="email" id="newEmail" name="newEmail" required>

        <button type="submit">Update Information</button>
    </form>

</body>
</html>
