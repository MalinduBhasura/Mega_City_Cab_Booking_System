package com.cab_booking.service;



import com.cab_booking.dao.AdminDAO;
import com.cab_booking.model.Admin;
import java.util.List;

public class AdminService {
    private AdminDAO adminDAO;

    public AdminService() {
        this.adminDAO = new AdminDAO();
    }

    // Add a new admin
    public boolean addAdmin(Admin admin) {
        return adminDAO.addAdmin(admin);
    }

    // Get all admins
    public List<Admin> getAllAdmins() {
        return adminDAO.getAllAdmins();
    }

    
    

    // Delete an admin
    public boolean deleteAdmin(int adminId) {
        return adminDAO.deleteAdmin(adminId);
    }

	public boolean updateAdmin(Admin admin) {
		return adminDAO.updateAdmin(admin);
	}
}
