<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.service.AdminService" %>
<%@ page import="com.cab_booking.model.Admin" %>
<%
    int adminId = Integer.parseInt(request.getParameter("adminId"));
    AdminService adminService = new AdminService();
    Admin admin = adminService.getAllAdmins().stream()
        .filter(a -> a.getAdminId() == adminId)
        .findFirst()
        .orElse(null);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Edit Admin</h1>
        <form action="admin" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="adminId" value="<%= admin.getAdminId() %>">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="<%= admin.getUsername() %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= admin.getPassword() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Admin</button>
        </form>
    </div>
</body>
</html>