package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    void insertProduct(Product product) throws SQLException;

    List<Product> getAllProduct();
}
