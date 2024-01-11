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
            window.location.href = "login.jsp";
        }
    </script>
</head>
<body>

    <jsp:useBean id="login" class="com.site.User" />
    <jsp:setProperty property="*" name="login" />

    <%
        LoginDao loginDao = new LoginDao();
        String accountStatus = loginDao.getAccountStatus(login.getName());
		System.out.println("Account Status: " + accountStatus);
        if ("active".equals(accountStatus)) {
            boolean status = loginDao.validate(login);

            if (status) {
                // Reset consecutive failures on successful login
                loginDao.updateConsecutiveFailures(login, 2);

                // Set session attribute and then forward to index.jsp
                session.setAttribute("name", login.getName());
                response.sendRedirect("index.jsp");
            } else {
                // Update consecutive failures in the database
                int consecutiveFailures = loginDao.getConsecutiveFailures(login);
                consecutiveFailures++;

                if (consecutiveFailures >= 3) {
                    // Deactivate the account if three consecutive failures
                    loginDao.deactivateAccount(login);
                    out.println("<script>showErrorPopup('Your account has been deactivated due to three consecutive failed attempts.');</script>");
                } else {
                    // Update consecutive failures and show error message
                    loginDao.updateConsecutiveFailures(login, consecutiveFailures);
                    out.println("<script>showErrorPopup('Invalid credentials. Please try again.');</script>");
                }
            }
        } else if ("deactivated".equals(accountStatus)) {
            out.println("<script>showErrorPopup('Your account has been deactivated. Please contact support for assistance.');</script>");
        } else {
            // Handle other account statuses as needed
            out.println("<script>showErrorPopup('Unexpected account status. Please contact support for assistance.');</script>");
        }
    %>

</body>
</html>
