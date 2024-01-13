<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.site.PasswordUpdateService"%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Password Update</title>
    <script> 
    // JavaScript function to display a success message and redirect to the login page
        function showSuccessPopup(message) {
            alert(message);
            window.location.href = "login.jsp";
        }
     // JavaScript function to display an error message and redirect to the password update page
        function showErrorPopup(message) {
        function showErrorPopup(message) {
            alert(message);
            window.location.href = "passwordUpdate.jsp"; // Update the redirection URL here
        }
    </script>
</head>
<body>

<%
// Retrieve parameters from the request
    String currentPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

 // Get the user session
    HttpSession userSession = request.getSession();

    // Call the updatePassword method and get the status
    String status = PasswordUpdateService.updatePassword(currentPassword, newPassword, confirmPassword, userSession);

    // Handle different statuses
    if ("success".equals(status)) {
    	 // If password update is successful, show a success message and redirect to login page
    	out.println("<script>showSuccessPopup('Password changed successfully');</script>");
    } // If the account is deactivated, show an error message and redirect to login page
    else if ("accountDeactivated".equals(status)) {
    	out.println("<script>showErrorPopup('Account deactivated due to consecutive password update failures'); window.location.href = 'login.jsp';</script>");
    }  // If the account is deactivated, show an error message and redirect to login page
    else if ("deactivationError".equals(status)) {
		out.println("<script>showErrorPopup('Failed to deactivate account');</script>");
    }// If new password and confirm password do not match, show an error message
    else if ("passwordMismatch".equals(status)) {
        out.println("<script>showErrorPopup('New Password and Confirm Password do not match');</script>");
    } // If the current password is invalid, show an error message
    else if ("invalidPassword".equals(status)) {
        out.println("<script>showErrorPopup('Invalid Current Password');</script>");
    }//If password update fails for any other reason, show a generic error message
    else {
        out.println("<script>showErrorPopup('Failed to update password');</script>");
    }
%>

</body>
</html>
