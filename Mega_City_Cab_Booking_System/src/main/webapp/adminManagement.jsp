<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.service.AdminService" %>
<%@ page import="com.cab_booking.model.Admin" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Admin Management</h1>
        <a href="addAdmin.jsp" class="btn btn-primary">Add Admin</a>
        <table class="table">
            <thead>
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
                        <a href="editAdmin.jsp?adminId=<%= admin.getAdminId() %>" class="btn btn-warning">Edit</a>
                        <a href="admin?action=delete&adminId=<%= admin.getAdminId() %>" class="btn btn-danger">Delete</a>
                        <a href="editAdmin.jsp" class="btn btn-primary">Manage Admins</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="login.jsp" class="btn btn-primary">Manage Admins</a>
    </div>
</body>
</html>