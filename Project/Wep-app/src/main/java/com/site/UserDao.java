package com.site;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class UserDao {

    public int saveRecord(User user) {
        int z = 0;
        try {
            Connection con = Dao.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (id, username, email, password, contact, status) VALUES (?, ?, ?, ?, ?, 'active')");

            // Set the provided ID from the registration form
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getContact());

            z = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return z;
    }
}
