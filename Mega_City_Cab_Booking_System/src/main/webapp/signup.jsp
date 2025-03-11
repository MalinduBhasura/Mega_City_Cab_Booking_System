<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var address = document.getElementById("address").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (name.trim() === "" || address.trim() === "" || email.trim() === "" || phone.trim() === "" || username.trim() === "" || password.trim() === "") {
                alert("All fields are required!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign Up</h3>
                    </div>
                    <div class="card-body">
                        <%
                            String error = request.getParameter("error");
                            if (error != null) {
                                if (error.equals("empty")) {
                                    out.println("<div class='alert alert-danger'>All fields are required!</div>");
                                } else if (error.equals("1")) {
                                    out.println("<div class='alert alert-danger'>Signup failed. Please try again!</div>");
                                }
                            }
                        %>
                        <form action="signup" method="post" onsubmit="return validateForm()">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Sign Up</button>
                        </form>
                        <div class="mt-3 text-center">
                            <p>Already have an account? <a href="login.jsp">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>