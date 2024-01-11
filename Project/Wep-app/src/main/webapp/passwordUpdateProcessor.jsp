<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.site.PasswordUpdateService"%> <!-- Import the PasswordUpdateService class -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Password Update</title>
    <script> 
        function showSuccessPopup(message) {
            alert(message);
            window.location.href = "login.jsp";
        }

        function showErrorPopup(message) {
            alert(message);
            window.location.href = "passwordUpdate.jsp"; // Update the redirection URL here
        }
    </script>
</head>
<body>

<%
    String currentPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    HttpSession userSession = request.getSession(); // Use a different variable name

    // Call the updatePassword method and get the status
    String status = PasswordUpdateService.updatePassword(currentPassword, newPassword, confirmPassword, userSession);

    // Handle different statuses
    if ("success".equals(status)) {
        out.println("<script>showSuccessPopup('Password changed successfully');</script>");
    } else if ("accountDeactivated".equals(status)) {
        out.println("<script>showErrorPopup('Account deactivated due to consecutive password update failures'); window.location.href = 'login.jsp';</script>");
    } else if ("deactivationError".equals(status)) {
        out.println("<script>showErrorPopup('Failed to deactivate account');</script>");
    } else if ("passwordMismatch".equals(status)) {
        out.println("<script>showErrorPopup('New Password and Confirm Password do not match');</script>");
    } else if ("invalidPassword".equals(status)) {
        out.println("<script>showErrorPopup('Invalid Current Password');</script>");
    } else {
        out.println("<script>showErrorPopup('Failed to update password');</script>");
    }
%>

</body>
</html>
