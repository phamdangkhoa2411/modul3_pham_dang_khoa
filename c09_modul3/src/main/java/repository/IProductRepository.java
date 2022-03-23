package repository;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {
    void insertProduct(Product product) throws SQLException;

    List<Product> getAllProduct();

}
