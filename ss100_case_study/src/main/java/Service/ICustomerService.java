package Service;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    public List<Customer> selectAllCustomer();

    public void insertCustomer(Customer customer) throws SQLException;

    Customer selectCustomerById(Integer id);

    boolean updateCustomer(Customer customer);


    boolean deleteUser(Integer id);

    List<Customer> searchCustomer(String name);

}
