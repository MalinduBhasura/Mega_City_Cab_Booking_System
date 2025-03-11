package com.cab_booking.util;

import com.cab_booking.model.SuperAdmin;
import com.cab_booking.model.Admin;
import com.cab_booking.model.Customer;

public class UserFactory {
    public static Object createUser(String userType, String username, String password) {
        switch (userType.toLowerCase()) {
            case "superadmin":
                SuperAdmin superAdmin = new SuperAdmin();
                superAdmin.setUsername(username);
                superAdmin.setPassword(password);
                return superAdmin;
            case "admin":
                Admin admin = new Admin();
                admin.setUsername(username);
                admin.setPassword(password);
                return admin;
            case "customer":
                Customer customer = new Customer();
                customer.setUsername(username);
                customer.setPassword(password);
                return customer;
            default:
                throw new IllegalArgumentException("Invalid user type: " + userType);
        }
    }
}
