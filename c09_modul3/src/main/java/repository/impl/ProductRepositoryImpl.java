package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {

    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_PRODUCT = "select product.id,product.name,product.price,product.quantity,product.color , category.category_name \n" +
            "from product join category on product.category_id = category.category_id;\n";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO PRODUCT (name,price,quanlity,color,category_id) VALUES ( ?, ? , ? , ? , ?);";

    public ProductRepositoryImpl() {
    }


    @Override
    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCT_SQL);
        try (Connection connection = baseRepository.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(1, product.getPrice());
            preparedStatement.setInt(1, product.getQuanlity());
            preparedStatement.setString(1, product.getColor());
            preparedStatement.setInt(1, product.getIdCategory());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);) {
            ResultSet rs = preparedStatement.executeQuery();
            int id;
            String name;
            double price;
            int quanlity;
            String color;
            String category_name;
            while (rs.next()) {
                id = rs.getInt(1);
                name = rs.getString(2);
                price = rs.getDouble(3);
                quanlity = rs.getInt(4);
                color = rs.getString(5);
                category_name = rs.getString(6);
                Product product = new Product(id, name, price, quanlity, color, category_name);
                productList.add(product);

            }
        } catch (SQLException e) {

        }
        return productList;
    }
}
