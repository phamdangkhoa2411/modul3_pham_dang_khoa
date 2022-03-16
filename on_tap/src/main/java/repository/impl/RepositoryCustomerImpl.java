package repository.impl;

import model.Customer;
import repository.RepositoryCustomer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Condition;

public class RepositoryCustomerImpl implements RepositoryCustomer {
    private String jdbcURL = "jdbc:mysql://localhost:3306/on_tap?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123123";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO CUSTOMER (`name`,phone,email) VALUES (?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select id,`name`,phone,email from CUSTOMER where id =?";
    private static final String SELECT_ALL_CUSTOMER = "select * from CUSTOMER";
    private static final String DELETE_CUSTOMER_SQL = "delete from CUSTOMER where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update CUSTOMER set `name` = ?,phone= ?, email =? where id = ?;";
   public RepositoryCustomerImpl(){}
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public void inserCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_CUSTOMER_SQL);
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){

        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                customer = new Customer(id, name, phone, email);
            }

        } catch (SQLException e) {
        }
            return customer;
        }

    @Override
    public List<Customer> selectAllCustomer() {
       List<Customer> customers = new ArrayList<>();
       try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);) {
           System.out.println(preparedStatement);
           ResultSet rs = preparedStatement.executeQuery();
           while (rs.next()){
               int id = rs.getInt("id");
               String name = rs.getString("name");
               String phone = rs.getString("phone");
               String email = rs.getString("email");
               customers.add(new Customer(id,name,phone,email));

           }

       }catch (SQLException e){

       }
        return customers;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
       boolean rowDelete;
       try (Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);){
           statement.setInt(1,id);
           rowDelete=statement.executeUpdate() > 0;

       }
        return rowDelete;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
       boolean rowUpdate;
       try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);){
           preparedStatement.setString(1,customer.getName());
           preparedStatement.setString(2,customer.getPhone());
           preparedStatement.setString(3,customer.getEmail());
           preparedStatement.setInt(4,customer.getId());
            rowUpdate=preparedStatement.executeUpdate()>0;

       }
        return rowUpdate;
    }
}
