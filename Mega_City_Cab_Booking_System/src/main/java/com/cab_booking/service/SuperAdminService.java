package com.cab_booking.service;



import com.cab_booking.dao.SuperAdminDAO;
import com.cab_booking.model.SuperAdmin;

public class SuperAdminService {
    private SuperAdminDAO superAdminDAO;

    public SuperAdminService() {
        this.superAdminDAO = new SuperAdminDAO();
    }

    public SuperAdmin validateSuperAdmin(String username, String password) {
        return superAdminDAO.validateSuperAdmin(username, password);
    }
}
