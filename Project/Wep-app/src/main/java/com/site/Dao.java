package com.site;


import java.sql.Connection;
import java.sql.DriverManager;

public class Dao
{
	
	public static  Connection createConnection()
	{
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","123456789");
			
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		
		return con;
		
	}
}