package service;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    public void inserCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(int id);

    public List<Customer> selectAllCustomer();

    public boolean deleteCustomer(int id) throws SQLException;

    public boolean updateCustomer(Customer customer) throws SQLException;
}
