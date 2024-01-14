package com.site;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class UserDao {
	// Method to save user record in the database
    public int saveRecord(User user) {
    	 // Initialize variable to track the result of the database operation
        int z = 0;
        try {
        	// Create a database connection using the Dao class
            Connection con = Dao.createConnection();
            // Prepare a SQL statement for inserting a new user record into the 'users' table
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (id, username, email, password, contact, status) VALUES (?, ?, ?, ?, ?, 'active')");

            // Set the provided ID from the registration form
            ps.setInt(1, user.getId());// Set the provided ID from the registration form
            ps.setString(2, user.getName());// Set the provided username from the registration form
            ps.setString(3, user.getEmail());// Set the provided email from the registration form
            ps.setString(4, user.getPassword());// Set the provided password from the registration form
            ps.setString(5, user.getContact());// Set the provided contact information from the registration form

            z = ps.executeUpdate(); // Execute the SQL statement and get the result
            con.close();// Close the database connection
        } catch (Exception e) {
        	// Print any exceptions that occur during the database operation
            e.printStackTrace();
        }
        return z; // Return the result of the database operation (number of rows affected)
    }
}
