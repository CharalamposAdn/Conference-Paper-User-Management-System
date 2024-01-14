package com.site;


import java.sql.Connection;
import java.sql.DriverManager;

public class Dao
{
	 // Method to create a database connection
	public static  Connection createConnection()
	{
		Connection con = null;
		
		try {
			 // Load the MySQL JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			 // Establish a connection to the MySQL database
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","123456789");
			
		}
		catch(Exception e)
		{	// Print any exceptions that occur during connection creation
			System.out.print(e);
		}
		// Return the established connection (or null if an exception occurred)
		return con;
		
	}
}