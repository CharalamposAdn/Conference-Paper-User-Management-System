<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.site.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <script>
    <!-- JavaScript function to show error popup and redirect on error -->
        function showErrorPopup(message) {
            alert(message);
            window.location.href = "AdminLogin.jsp";
        }
    </script>
</head>
<body>
	  <!-- Creating and initializing a User bean -->
    <jsp:useBean id="login" class="com.site.User" />
    <jsp:setProperty property="*" name="login" />

    <%
		 // Creating an instance of LoginDao
        LoginDao loginDao = new LoginDao();

        // Validate admin 
        if (loginDao.validateAdmin(login)) {
            // Set session attribute and then forward to "Admin.jsp"
            session.setAttribute("name", login.getName());
            response.sendRedirect("Admin.jsp"); // Change to the admin dashboard page
        } else {
            // Show error message for invalid admin credentials
            out.println("<script>showErrorPopup('Invalid admin credentials. Please try again.');</script>");
        }
    %>

</body>
</html>
