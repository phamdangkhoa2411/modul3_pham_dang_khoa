package service.impl;

import model.Product;
import service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Samsung", "23.000.000", "Samsung Galaxy Note 22 Ultra 12GB-256GB", "Korea"));
        products.put(2, new Product(2, "Apple", "40.000.000", "Iphone 13 Pro Max 6GB-1TB", "America(USA)"));
        products.put(3, new Product(3, "Xiaomi", "8.000.000", "Xiaomi 11T 5G 8GB-256GB ", "China"));
        products.put(4, new Product(4, "Huawei", "9.000.000", "Huawei P30 Pro 8GB-256GB", "China"));
        products.put(5, new Product(5, "Vsmart", "2.000.000", "Vsmart Aris Pro 8GB-128GB", "Vietnamese"));
        products.put(6, new Product(6, "Samsung", "23.000.000", "Samsung Galaxy Note 22 Ultra 12GB-256GB", "Korea"));
        products.put(7, new Product(7, "Apple", "40.000.000", "Iphone 13 Pro Max 6GB-1TB", "America(USA)"));
        products.put(8, new Product(8, "Xiaomi", "8.000.000", "Xiaomi 11T 5G 8GB-256GB ", "China"));
        products.put(9, new Product(9, "Huawei", "9.000.000", "Huawei P30 Pro 8GB-256GB", "China"));
        products.put(10, new Product(10, "Vsmart", "2.000.000", "Vsmart Aris Pro 8GB-128GB", "Vietnamese"));
        products.put(11, new Product(11, "Samsung", "23.000.000", "Samsung Galaxy Note 22 Ultra 12GB-256GB", "Korea"));
        products.put(12, new Product(12, "Apple", "40.000.000", "Iphone 13 Pro Max 6GB-1TB", "America(USA)"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getIdProduct(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> products = this.findAll();
        List<Product> productResult = new ArrayList<>();
        String productName;
        name = name.toLowerCase();
        for (Product product : products) {
            productName = product.getNameProduct().toLowerCase();
            if (productName.contains(name)) {
                productResult.add(product);
            }
        }
        return productResult;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

}
