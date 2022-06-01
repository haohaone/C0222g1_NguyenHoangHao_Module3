package customer.repository.imp;

import customer.model.Product;
import customer.repository.BaseRepository;
import customer.repository.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImp implements ProductRepository {
    private final String SELECT_ALL ="SELECT * FROM product";
    private final String INSERT_STUDENT ="insert into student(`name`,birthday, gender,`point`, class_id,email,`account`) " +
            "values (?,?,?,?,?,?,?);";

    @Override
    public List<Product> productList() {
        List<Product> products = new LinkedList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int productIndex = resultSet.getInt("product_index");
                String productId = resultSet.getString("product_code");
                String productName = resultSet.getString("product_name");
                String productionName = resultSet.getString("production_name");
                String distributorName = resultSet.getString("distributor_name");
                int statusDelete = resultSet.getInt("status_delete");
                products.add( new Product(productIndex,
                                            productId,
                                            productName,
                                            productionName,
                                            distributorName,
                                            statusDelete));
                }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return products;
    }

    @Override
    public Product findById(int id) {
        String selectById = SELECT_ALL + " WHERE product_index = " + id;
        Connection connection = BaseRepository.getConnectDB();
        Product product = null;
        try {
            PreparedStatement ps = connection.prepareStatement(selectById);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            int productIndex = resultSet.getInt("product_index");
            String productId = resultSet.getString("product_code");
            String productName = resultSet.getString("product_name");
            String productionName = resultSet.getString("production_name");
            String distributorName = resultSet.getString("distributor_name");
            int statusDelete = resultSet.getInt("status_delete");
             product = new Product(productIndex,
                                    productId,
                                    productName,
                                    productionName,
                                    distributorName,
                                    statusDelete);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void update(Product product) {
        String saveByID = "UPDATE product" +
                            " SET product_code = ?, product_name = ?, production_name = ?," +
                            " distributor_name = ?, status_delete = ? WHERE  product_index = ?";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(saveByID);
            ps.setString(1, product.getProductId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductionName());
            ps.setString(4, product.getDistributorName());
            ps.setInt(5, product.getStatusDelete());
            ps.setInt(6, product.getIndex());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void save(Product product) {
        String updateByID = "INSERT INTO product" +
                "(product_code, pưroduct_name, production_name, distributor_name, status_delete)" +
                " VALUE (?, ?, ?, ?, ?)";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(updateByID);
            ps.setString(1, product.getProductId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductionName());
            ps.setString(4, product.getDistributorName());
            ps.setInt(5, product.getStatusDelete());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Product product = findById(id);
        String deleteByID = "UPDArTE product" +
                " SET status_delete = 1 WHERE  product_index = ?";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(deleteByID);
            ps.setInt(1, product.getIndex());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
