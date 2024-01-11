<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.site.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <script>
        function showErrorPopup(message) {
            alert(message);
            window.location.href = "AdminLogin.jsp";
        }
    </script>
</head>
<body>

    <jsp:useBean id="login" class="com.site.User" />
    <jsp:setProperty property="*" name="login" />

    <%
        LoginDao loginDao = new LoginDao();

        // Validate admin without using status
        if (loginDao.validateAdmin(login)) {
            // Set session attribute and then forward to adminDashboard.jsp
            session.setAttribute("name", login.getName());
            response.sendRedirect("Admin.jsp"); // Change to the admin dashboard page
        } else {
            // Show error message for invalid admin credentials
            out.println("<script>showErrorPopup('Invalid admin credentials. Please try again.');</script>");
        }
    %>

</body>
</html>
