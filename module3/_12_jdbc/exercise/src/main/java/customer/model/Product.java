package customer.model;

public class Product {
    private int index, statusDelete;
    private String productId, productName, productionName, distributorName;

    public Product(int index, String productId, String productName, String productionName, String distributorName, int statusDelete) {
        this.index = index;
        this.productId = productId;
        this.productName = productName;
        this.productionName = productionName;
        this.distributorName = distributorName;
        this.statusDelete = statusDelete;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductionName() {
        return productionName;
    }

    public void setProductionName(String productionName) {
        this.productionName = productionName;
    }

    public String getDistributorName() {
        return distributorName;
    }

    public void setDistributorName(String distributorName) {
        this.distributorName = distributorName;
    }

    public int getStatusDelete() {
        return statusDelete;
    }

    public void setStatusDelete(int statusDelete) {
        this.statusDelete = statusDelete;
    }
}
