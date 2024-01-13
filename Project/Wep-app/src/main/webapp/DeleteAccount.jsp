<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Account</title>
    <!-- JavaScript functions for showing success and error popups -->
    <script>
        function showSuccessPopup(message) {
            alert(message);
            window.location.href = "login.jsp";
        }

        function showErrorPopup(message) {
            alert(message);
            window.location.href = "Delete.jsp";
        }
    </script>
</head>
<body>

<%
	//Get the current password and username from the request and session
    String currentPassword = request.getParameter("password");
    String username = (String)session.getAttribute("name"); 
 	//Database connection information
    String connurl = "jdbc:mysql://localhost:3306/registration";
    Connection con = null;
 	// Establish a database connection
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(connurl, "root", "123456789");

        // Use a PreparedStatement to avoid SQL injection
        String query = "SELECT * FROM users WHERE username=? AND password=?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, currentPassword);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");

                // Use a prepared statement for the delete operation
                String deleteQuery = "DELETE FROM users WHERE id=?";
                try (PreparedStatement deleteStatement = con.prepareStatement(deleteQuery)) {
                    deleteStatement.setInt(1, id);

                    int rowsAffected = deleteStatement.executeUpdate();
                 	// Check if the deletion was successful
                    if (rowsAffected > 0) {
                        out.println("<script>showSuccessPopup('Account deleted successfully');</script>");
                    } else {
                        out.println("<script>showErrorPopup('Failed to delete account');</script>");
                    }
                }
            } else {
                out.println("<script>showErrorPopup('Invalid username or password');</script>");
            }
        }
    } catch (Exception e) {
    	// Show an error popup and print the stack trace for debugging purposes
        out.println("<script>showErrorPopup('An error occurred. Please try again later.');</script>");
        e.printStackTrace(); // Log the exception for debugging purposes
    } finally {
    	// Close the database connection in the finally block
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
