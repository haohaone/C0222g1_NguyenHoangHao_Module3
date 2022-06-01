package customer.repository;

import customer.model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> productList();

    Product findById(int id);

    void save(Product product);

    void update(Product product);

    void delete(int id);
}
