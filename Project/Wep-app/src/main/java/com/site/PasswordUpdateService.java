package com.site;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;


public class PasswordUpdateService {
	 // Method to update user password
	public static String updatePassword(String currentPassword, String newPassword, String confirmPassword,jakarta.servlet.http.HttpSession session) {
	    String connurl = "jdbc:mysql://localhost:3306/registration";
	    Connection con = null;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection(connurl, "root", "123456789");

	        int id = 0;
	        int consecutiveFailures = 0;

	        // Get the current username from the session attribute
	        String currentUsername = (String) session.getAttribute("name");

	        // Check if the current password is valid using a prepared statement
	        String selectQuery = "SELECT id, con_fail_upd_pass FROM users WHERE password=? AND username=?";
	        try (PreparedStatement selectStatement = con.prepareStatement(selectQuery)) {
	            selectStatement.setString(1, currentPassword);
	            selectStatement.setString(2, currentUsername);
	            ResultSet rs = selectStatement.executeQuery();

	            if (rs.next()) {
	                id = rs.getInt("id");
	                consecutiveFailures = rs.getInt("con_fail_upd_pass");

	                // Check if the new password and confirmation match
	                if (newPassword.equals(confirmPassword)) {
	                    // Update the password using a prepared statement
	                    String updateQuery = "UPDATE users SET password=?, con_fail_upd_pass=0 ,consecutive_failures = 0 WHERE id=?";
	                    try (PreparedStatement updateStatement = con.prepareStatement(updateQuery)) {
	                        updateStatement.setString(1, newPassword);
	                        updateStatement.setInt(2, id);

	                        int rowsAffected = updateStatement.executeUpdate();

	                        if (rowsAffected > 0) {
	                            // Password changed successfully
	                            return "success";
	                        } else {
	                            // Failed to update password
	                            return handleConsecutiveFailures(id, consecutiveFailures + 1, con, "Failed to update");
	                        }
	                    }
	                } else {
	                    // New Password and Confirm Password do not match
	                    return handleConsecutiveFailures(id, consecutiveFailures + 1, con, "passwordMismatch");
	                }
	            } else {
	                // Invalid Current Password
	                return handleConsecutiveFailures(id, consecutiveFailures + 1, con, "invalidPassword");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    } finally {
	        try {
	            if (con != null) {
	                con.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}

	// Method to handle consecutive failures and update account status
    private static String handleConsecutiveFailures(int id, int consecutiveFailures, Connection con, String additionalStatus) {
        try {
            // Check if there are three consecutive failures
            if (consecutiveFailures >= 3) {
                Statement deactivateStatement = con.createStatement();
                int deactivateResult = deactivateStatement.executeUpdate("UPDATE users SET status='deactivated', con_fail_upd_pass =0 WHERE id='" + id + "'");
                deactivateStatement.close();

                if (deactivateResult > 0) {
                    // Account deactivated due to three consecutive password update failures
                    return "accountDeactivated";
                } else {
                    // Failed to deactivate account
                    return "deactivationError";
                }
            } else {
                // Update the consecutive failures count
                Statement updateConsecutiveFailuresStatement = con.createStatement();
                updateConsecutiveFailuresStatement.executeUpdate("UPDATE users SET con_fail_upd_pass=" + consecutiveFailures + " WHERE id='" + id + "'");
                updateConsecutiveFailuresStatement.close();

                // Failed to update password, but not yet 3 consecutive failures
                return additionalStatus;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}

