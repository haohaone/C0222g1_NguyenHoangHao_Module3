package customer.repository.imp;

import customer.model.Product;
import customer.repository.ProductRepository;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImp implements ProductRepository {
    private static Map<Integer, Product> productList = new LinkedHashMap<>();
    static {
        productList.put(1,new Product(1, "IP-11", "Iphone 11", "Apple", "Thế giới di dộng", 0));
        productList.put(2,new Product(2, "IP-XS", "Iphone XS", "Apple", "Điện máy xanh", 0));
        productList.put(3, new Product(3, "IP-13", "Iphone 13", "Apple", "Schannel", 0));
        productList.put(4, new Product(4, "SS-A7", "Samsung-A7", "Samsung", "Thế giới di dộng", 0));
        productList.put(5, new Product(5, "SS-B3", "Samsung-B3", "Samsung", "Điện máy xanh",0));
        productList.put(6, new Product(6, "HW-K11", "Huawei-K11", "Huawei", "Thế giới di dộng", 0));
    }

    @Override
    public List<Product> productList() {
        List<Product> products = new LinkedList<>(productList.values());
        return products;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void save(int index, Product product) {
        productList.put(index, product);
    }

    @Override
    public void update(int index, Product product) {
        productList.put(index, product);
    }

    @Override
    public void delete(int id) {
        System.out.println(id);
        Product product = productList.get(id);
        product.setStatusDelete(1);
    }
}
