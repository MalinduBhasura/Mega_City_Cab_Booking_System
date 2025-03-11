package com.cab_booking.service;



import com.cab_booking.dao.CustomerDAO;
import com.cab_booking.model.Customer;

public class CustomerService {
    private CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    public boolean addCustomer(Customer customer) {
        return customerDAO.addCustomer(customer);
    }

    public Customer validateCustomer(String username, String password) {
        return customerDAO.validateCustomer(username, password);
    }
}
