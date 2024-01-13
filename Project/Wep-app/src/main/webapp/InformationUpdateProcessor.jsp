<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update User ID</title>
    <!-- JavaScript functions for showing success and error popups -->
    <script>
        function showSuccessPopup(message) {
            alert(message);
            window.location.href = "login.jsp";
        }

        function showErrorPopup(message) {
            alert(message);
            window.location.href = "InformationUpdate.jsp";
        }
    </script>
</head>
<body>

<%
    try {
        // The current ID of the user
        String currentIdString = request.getParameter("currentId");
        int currentId = (currentIdString != null && !currentIdString.isEmpty()) ? Integer.parseInt(currentIdString) : 0;

        // The ID you want to update to
        String newIdString = request.getParameter("id");
        int newId = (newIdString != null && !newIdString.isEmpty()) ? Integer.parseInt(newIdString) : 0;

        // The new values
        String newName = request.getParameter("name");
        String newEmail = request.getParameter("email");
        String newContact = request.getParameter("contact");

        // Debug statements
        System.out.println("Debug: currentId=" + currentId + ", newId=" + newId + ", newName=" + newName + ", newEmail=" + newEmail + ", newContact=" + newContact);

        // Check if parameters are present and valid
        if (currentId <= 0 || newId <= 0 || newName == null || newEmail == null || newContact == null) {
            throw new IllegalArgumentException("Invalid parameters");
        }

        Connection con = null;
        PreparedStatement updateStatement = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connurl = "jdbc:mysql://localhost:3306/registration";
            con = DriverManager.getConnection(connurl, "root", "123456789");

            // Update user information based on the new ID
            String updateQuery = "UPDATE users SET id=?, username=?, email=?, contact=? , consecutive_failures = 0 WHERE id=?";
            updateStatement = con.prepareStatement(updateQuery);
            updateStatement.setInt(1, newId);
            updateStatement.setString(2, newName);
            updateStatement.setString(3, newEmail);
            updateStatement.setString(4, newContact);
            updateStatement.setInt(5, currentId);

            int i = updateStatement.executeUpdate();

            if (i > 0) {
                out.println("<script>showSuccessPopup('ID updated successfully');</script>");
            } else {
                out.println("<script>showErrorPopup('Failed to update ID');</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Debug statement
            e.printStackTrace();

            out.println("<script>showErrorPopup('Error: " + e.getMessage() + "');</script>");
        } finally {
            try {
                if (updateStatement != null) {
                    updateStatement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } catch (NumberFormatException e) {
        // Handle NumberFormatException separately
        out.println("<script>showErrorPopup('Error: Invalid number format');</script>");
    } catch (IllegalArgumentException e) {
        // Handle invalid or missing parameters
        out.println("<script>showErrorPopup('Error: Invalid or missing parameters');</script>");
    }
%>

</body>
</html>

