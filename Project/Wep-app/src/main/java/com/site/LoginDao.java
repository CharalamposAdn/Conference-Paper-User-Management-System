package com.site;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginDao {
	// Method to validate user credentials against the database
    public boolean validate(User user) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/registration", "root", "123456789");
             PreparedStatement preparedStatement = connection
                 .prepareStatement("select * from users where username = ? and password = ? ")) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }

    
    
    
 // Method to validate admin credentials against the database
    public boolean validateAdmin(User user) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/registration", "root", "123456789");
             PreparedStatement preparedStatement = connection
                 .prepareStatement("select * from admin where admin_username = ? and admin_password = ? ")) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    
    
    
    
    
    
 // Method to get consecutive failures count for a user
    public int getConsecutiveFailures(User user) {
        int consecutiveFailures = 0;

        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT consecutive_failures FROM users WHERE username = ?")) {

            preparedStatement.setString(1, user.getName());

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                consecutiveFailures = rs.getInt("consecutive_failures");
            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return consecutiveFailures;
    }
    // Method to update consecutive failures for a user
    public void updateConsecutiveFailures(User user, int consecutiveFailures) {
        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET consecutive_failures = ? WHERE username = ?")) {

            preparedStatement.setInt(1, consecutiveFailures);
            preparedStatement.setString(2, user.getName());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    // Method to deactivate a user account
    public void deactivateAccount(User user) {
        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET status = 'deactivated', consecutive_failures = 0 WHERE username = ?")) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }
 // Method to create a database connection
    private Connection createConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "123456789");
    }
    
    
    
    // Method to get the account status of a user
    public String getAccountStatus(String username) {
        String status = "active"; // default status

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "123456789");
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT status FROM users WHERE username = ?")) {

            preparedStatement.setString(1, username);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    // Method to reset consecutive failures for a user
    public void resetConsecutiveFailures(String username) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "123456789");
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET consecutive_failures = 0 WHERE username = ?")) {

            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
 // Method to retrieve a list of all users
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users")) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getString("status"));
                user.setContact(rs.getString("contact"));

                userList.add(user);
            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return userList;
    }
 // Method to activate a user account
    public void activateAccount(String username) {
        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET status = 'active' WHERE username = ?")) {

            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }
 // Method to deactivate a user account by an admin
    public void deactivateAccountAdmin(String username) {
        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET status = 'deactivated' WHERE username = ?")) {

            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    
    // Method to print SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
