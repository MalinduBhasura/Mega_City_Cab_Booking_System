package com.cab_booking.dao;



import com.cab_booking.model.SuperAdmin;
import com.cab_booking.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SuperAdminDAO {
    private Connection connection;

    public SuperAdminDAO() {
        this.connection = DBConnection.getInstance().getConnection();
    }

    public SuperAdmin validateSuperAdmin(String username, String password) {
        String sql = "SELECT * FROM super_admin WHERE username = ? AND password = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                SuperAdmin superAdmin = new SuperAdmin();
                superAdmin.setSuperAdminId(resultSet.getInt("super_admin_id"));
                superAdmin.setUsername(resultSet.getString("username"));
                superAdmin.setPassword(resultSet.getString("password"));
                return superAdmin;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
