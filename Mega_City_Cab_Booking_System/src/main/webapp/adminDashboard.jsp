<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.SuperAdmin" %>
<%@ page import="com.cab_booking.model.Admin" %>
<%
    SuperAdmin superAdmin = (SuperAdmin) session.getAttribute("superAdmin");
    Admin admin = (Admin) session.getAttribute("admin");

    if (superAdmin == null && admin == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Welcome, 
            <% if (superAdmin != null) { %>
                <%= superAdmin.getUsername() %>
            <% } else if (admin != null) { %>
                <%= admin.getUsername() %>
            <% } %>
        </h1>
        <p>This is the admin dashboard.</p>
        <% if (superAdmin != null) { %>
            <a href="adminManagement.jsp" class="btn btn-primary">Manage Admins</a>
        <% } %>
    </div>
</body>
</html>