package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements IProductService {
IProductRepository productRepository= new ProductRepositoryImpl();


    @Override
    public void insertProduct(Product product) throws SQLException {
        productRepository.insertProduct(product);
    }

    @Override
    public List<Product> getAllProduct() {
        return productRepository.getAllProduct();
    }
}
