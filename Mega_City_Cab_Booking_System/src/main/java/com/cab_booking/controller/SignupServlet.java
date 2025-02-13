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
        Customer customer = (Customer) UserFactory.createUser("customer", 
            request.getParameter("username"), 
            request.getParameter("password"));
        customer.setName(request.getParameter("name"));
        customer.setAddress(request.getParameter("address"));
        customer.setEmail(request.getParameter("email"));
        customer.setPhone(request.getParameter("phone"));

        if (customerService.addCustomer(customer)) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            response.sendRedirect("signup.jsp?error=1");
        }
    }
}
