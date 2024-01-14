<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.site.UserDao, com.site.UserValidator"%>

<jsp:useBean class="com.site.User" id="user" scope="session"></jsp:useBean>

<body>
    <script>
 // JavaScript function to display a popup message
        function showPopupMessage(message) {
            alert(message);
        }
     // JavaScript function to redirect to a specified page
        function redirectToPage(page) {
            window.location.href = page;
        }
    </script>

    <%
    // Creating an instance of UserDao to interact with the database
        UserDao userDao = new UserDao();
	 // Flag to check if the data is valid
        boolean isValidData = true;

        // Validate username
        String username = user.getName();
        if (username != null && !UserValidator.isValidUsername(username)) {
        	// Display a warning message if the username is not valid
            out.print("<script>showPopupMessage('Warning: Username must start with a letter and have at least 5 characters, which can be alphanumeric or _');</script>");
            isValidData = false;
        }

        // Validate password
        String password = user.getPassword();
        if (password != null && !UserValidator.isValidPassword(password)) {
        	 // Display a warning message if the password is not valid
            out.print("<script>showPopupMessage('Warning: Password must be at least 8 characters, including uppercase, lowercase, digit, and special character');</script>");
            isValidData = false;
        }

        // If data is valid, save to the database
        if (isValidData) {
            int result = userDao.saveRecord(user);

            if (result > 0) {
                // Concatenate user properties for the pop-up message
                String popupMessage = "User Information:\n"
                        + "Id: " + user.getId() + "\n"
                        + "Name: " + user.getName() + "\n"
                        + "Email: " + user.getEmail() + "\n"
                        + "Password: " + user.getPassword() + "\n"
                        + "Contact: " + user.getContact();

                out.print("<script>showPopupMessage('" + popupMessage + "');</script>");
                // Redirect to login.jsp
                out.print("<script>redirectToPage('login.jsp');</script>");
            } else {
                out.print("<script>showPopupMessage('Data Not Saved successfully in DB');</script>");
                // Redirect to Register.jsp
                out.print("<script>redirectToPage('Register.jsp');</script>");
            }
        } else {
            // If validation fails, redirect to Register.jsp
            out.print("<script>redirectToPage('Register.jsp');</script>");
        }
    %>
</body>
