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
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
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
                </div>
            </div>
        </div>
    </div>
</body>
</html>