package service.impl;

import model.Customer;
import repository.RepositoryCustomer;
import repository.impl.RepositoryCustomerImpl;
import service.CustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    RepositoryCustomer repositoryCustumer = new RepositoryCustomerImpl();

    @Override
    public void inserCustomer(Customer customer) throws SQLException {
     repositoryCustumer.inserCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
      return repositoryCustumer.selectCustomer(id);

    }

    @Override
    public List<Customer> selectAllCustomer() {
        return repositoryCustumer.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return repositoryCustumer.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return repositoryCustumer.updateCustomer(customer);
    }
}
