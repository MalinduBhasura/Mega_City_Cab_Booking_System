package com.cab_booking.controller;



import com.cab_booking.util.UserFactory;
import com.cab_booking.model.SuperAdmin;
import com.cab_booking.model.Admin;
import com.cab_booking.model.Customer;
import com.cab_booking.service.SuperAdminService;
import com.cab_booking.service.AdminService;
import com.cab_booking.service.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SuperAdminService superAdminService;
    private AdminService adminService;
    private CustomerService customerService;

    @Override
    public void init() {
        superAdminService = new SuperAdminService();
        adminService = new AdminService();
        customerService = new CustomerService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if super admin
        SuperAdmin superAdmin = superAdminService.validateSuperAdmin(username, password);
        if (superAdmin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("superAdmin", superAdmin);
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        // Check if admin
        Admin admin = adminService.getAllAdmins().stream()
            .filter(a -> a.getUsername().equals(username) && a.getPassword().equals(password))
            .findFirst()
            .orElse(null);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        // Check if customer
        Customer customer = customerService.validateCustomer(username, password);
        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("customerDashboard.jsp");
            return;
        }

        // If invalid credentials
        response.sendRedirect("login.jsp?error=1");
    }
}
