package com.cab_booking.controller;



import com.cab_booking.util.UserFactory;
import com.cab_booking.model.Admin;
import com.cab_booking.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminService adminService;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            deleteAdmin(request, response);
        }
    }

    @Override
    public void init() {
        adminService = new AdminService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addAdmin(request, response);
        } else if ("update".equals(action)) {
            updateAdmin(request, response);
        } else if ("delete".equals(action)) {
            deleteAdmin(request, response);
        }
    }

    private void addAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Admin admin = new Admin();
        admin.setUsername(request.getParameter("username"));
        admin.setPassword(request.getParameter("password"));

        if (adminService.addAdmin(admin)) {
            response.sendRedirect("adminManagement.jsp?success=1");
        } else {
            response.sendRedirect("adminManagement.jsp?error=1");
        }
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Admin admin = new Admin();
        admin.setAdminId(Integer.parseInt(request.getParameter("adminId")));
        admin.setUsername(request.getParameter("username"));
        admin.setPassword(request.getParameter("password"));

        if (adminService.updateAdmin(admin)) {
        	
            response.sendRedirect("adminManagement.jsp?success=1");
        } else {
            response.sendRedirect("adminManagement.jsp?error=1");
        }
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int adminId = Integer.parseInt(request.getParameter("adminId"));

        if (adminService.deleteAdmin(adminId)) {
            response.sendRedirect("adminManagement.jsp?success=1");
        } else {
            response.sendRedirect("adminManagement.jsp?error=1");
        }
    }
}
