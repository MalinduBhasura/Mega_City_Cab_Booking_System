package com.cab_booking.controller;



import com.cab_booking.util.UserFactory;
import com.cab_booking.model.Customer;
import com.cab_booking.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Server-side validation
        if (name == null || name.trim().isEmpty() || address == null || address.trim().isEmpty() ||
            email == null || email.trim().isEmpty() || phone == null || phone.trim().isEmpty() ||
            username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect("signup.jsp?error=empty");
            return;
        }

        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setUsername(username);
        customer.setPassword(password);

        if (customerService.addCustomer(customer)) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            response.sendRedirect("signup.jsp?error=1");
        }
    }
}
