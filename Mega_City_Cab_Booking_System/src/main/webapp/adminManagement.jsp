<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.SuperAdmin" %>
<%@ page import="com.cab_booking.service.AdminService" %>
<%@ page import="com.cab_booking.model.Admin" %>
<%@ page import="java.util.List" %>
<%
    SuperAdmin superAdmin = (SuperAdmin) session.getAttribute("superAdmin");
    if (superAdmin == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .card {
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Management</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h1>Admin Management</h1>
                        <a href="addAdmin.jsp" class="btn btn-primary mb-3">Add Admin</a>
                        <table class="table table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>Admin ID</th>
                                    <th>Username</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    AdminService adminService = new AdminService();
                                    List<Admin> admins = adminService.getAllAdmins();
                                    for (Admin admin : admins) {
                                %>
                                <tr>
                                    <td><%= admin.getAdminId() %></td>
                                    <td><%= admin.getUsername() %></td>
                                    <td>
                                        <a href="editAdmin.jsp?adminId=<%= admin.getAdminId() %>" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="admin?action=delete&adminId=<%= admin.getAdminId() %>" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>