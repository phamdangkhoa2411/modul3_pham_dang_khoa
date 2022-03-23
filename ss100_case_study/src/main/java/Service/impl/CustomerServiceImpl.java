package Service.impl;

import Service.ICustomerService;
import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAllCustomer();
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        iCustomerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomerById(Integer id) {
        return iCustomerRepository.selectCustomerById(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return iCustomerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteUser(Integer id) {
        return iCustomerRepository.deleteUser(id);
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        return iCustomerRepository.searchCustomer(name);
    }
}
