package customer.service;

import customer.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> productList();

    Product findById(int id);

    void save(Product product);

    void delete(int id);
}
