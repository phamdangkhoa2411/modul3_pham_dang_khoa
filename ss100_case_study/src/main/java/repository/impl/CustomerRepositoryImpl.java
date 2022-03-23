package repository.impl;

import model.Customer;
import repository.ICustomerRepository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select customer.customer_id, customer_type.customer_type_name,customer.customer_name,customer.customer_birthday,customer.customer_gender,customer.customer_id_card,customer.customer_phone,customer.customer_email,customer.customer_address\n" +
            "            from customer join customer_type on customer.customer_type_id = customer_type.customer_type_id\n" +
            "            order by customer.customer_id ;";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO `case_study_module_3_db_servlet`.`customer` ( `customer_name`,`customer_birthday`, `customer_gender`, `customer_id_card`, `customer_phone`, `customer_email`, `customer_address`,`customer_type_id` ) VALUES (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =(?)";
    private static final String UPDATE_CUSTOMER_BY_ID = "update customer set customer_name = ?,customer_birthday= ?, \n" +
            "             customer_gender =?, customer_id_card =?, customer_phone =?, customer_email =?, customer_address =?, \n" +
            "             customer_type_id=?   where customer_id = ? ";
    BaseConnection baseConnection = new BaseConnection();
    private static final String DELETE_CUSTOMER_BY_ID = "delete from customer where customer_id = ?;";
    private static final String SEARCH_BY_NAME = "select * from customer where customer_name like concat('%',?,'%');";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = baseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            Integer id;
            String name;
            String birthday;
            Integer gender;
            String idCard;
            String phone;
            String email;
            String address;
            String nameidTypeCustomer;
            Customer customer;
            while (rs.next()) {
                id = rs.getInt(1);
                nameidTypeCustomer = rs.getString(2);
                name = rs.getString(3);
                birthday = rs.getString(4);
                gender = rs.getInt(5);
                idCard = rs.getString(6);
                phone = rs.getString(7);
                email = rs.getString(8);
                address = rs.getString(9);

                customer = new Customer(id, name, nameidTypeCustomer, birthday, gender, idCard, phone, email, address);
                customers.add(customer);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        Connection connection = null;
        try {
            connection = baseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getIdTypeCustomer());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
    }

    @Override
    public Customer selectCustomerById(Integer id) {
        Customer customer = null;
        Connection connection = null;

        try {
            connection = baseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer idTypeCustomer = resultSet.getInt(2);
                String Name = resultSet.getString(3);
                String birthday = resultSet.getString(4);
                Integer Gender = resultSet.getInt(5);
                String IdCard = resultSet.getString(6);
                String Phone = resultSet.getString(7);
                String Email = resultSet.getString(8);
                String Address = resultSet.getString(9);

                customer = new Customer(id, Name, birthday, Gender, IdCard, Phone, Email, Address, idTypeCustomer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean rowUpdate = false;
        Connection connection = null;
        try {
            connection = baseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getIdTypeCustomer());
            preparedStatement.setInt(9, customer.getId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return rowUpdate;
    }

    @Override
    public boolean deleteUser(Integer id) {
        boolean rowDeleted = false;
        try (Connection connection = baseConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = baseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);) {

            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setId(resultSet.getInt("customer_id"));
                customer.setIdTypeCustomer(resultSet.getInt("customer_type_id"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setBirthday(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getInt("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhone(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customers.add(customer);

            }
        } catch (SQLException e) {

        }
        return customers;
    }

}