package customer.service.imp;

import customer.model.Product;
import customer.repository.ProductRepository;
import customer.repository.imp.ProductRepositoryImp;
import customer.service.ProductService;

import java.util.List;

public class ProductServiceImp implements ProductService {
    private ProductRepository productRepository = new ProductRepositoryImp();

    @Override
    public List<Product> productList() {
        return productRepository.productList();
    }

    @Override
    public Product findById(int index) {
        return productRepository.findById(index);
    }

    @Override
    public void save(Product product) {
        productRepository.save(product.getIndex(), product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }
}
