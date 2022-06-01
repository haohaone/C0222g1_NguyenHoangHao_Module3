package customer.controller;

import customer.model.Product;
import customer.service.imp.ProductServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletCustomer", urlPatterns = "/product")
public class ServletProduct extends HttpServlet {
    private ProductServiceImp productServiceImp = new ProductServiceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                save(request,response);
                break;
            case "edit":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showProductList(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                showFormCreate(request,response);
                break;
            case "edit":
                showEditCreate(request,response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                break;
            default:
                showProductList(request, response);
        }
    }

    public void showProductList(HttpServletRequest request, HttpServletResponse response){
        List<Product> productList = productServiceImp.productList();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("view/product/product_management.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int productIndex = productServiceImp.productList().size() + 1;
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productionName = request.getParameter("productionName");
        String distributorName = request.getParameter("distributorName");

        Product product = new Product(productIndex, productId, productName, productionName, distributorName, 0);
        productServiceImp.save(product);

        request.setAttribute("addSuccessful", "Thêm thành công !!!");
        List<Product> productList = productServiceImp.productList();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher =  request.getRequestDispatcher("view/product/product_management.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCreate(HttpServletRequest request, HttpServletResponse response) {
        int productIndex = Integer.parseInt(request.getParameter("id"));
        Product product = productServiceImp.findById(productIndex);

        request.setAttribute("productIndex", product.getIndex());
        request.setAttribute("productId", product.getProductId());
        request.setAttribute("productName", product.getProductName());
        request.setAttribute("productionName", product.getProductionName());
        request.setAttribute("distributorName", product.getDistributorName());

        RequestDispatcher dispatcher=  request.getRequestDispatcher("view/product/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response){
        int productIndex = Integer.parseInt(request.getParameter("id"));
        Product product = productServiceImp.findById(productIndex);

        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productionName = request.getParameter("productionName");
        String distributorName = request.getParameter("distributorName");

        product.setProductId(productId);
        product.setProductName(productName);
        product.setProductionName(productionName);
        product.setDistributorName(distributorName);
        productServiceImp.save(product);

        request.setAttribute("editSuccessful", "Sửa thành công !!!");
        List<Product> productList = productServiceImp.productList();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher=  request.getRequestDispatcher("view/product/product_management.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response){
        int productIndex = Integer.parseInt(request.getParameter("id"));
        productServiceImp.delete(productIndex);
        List<Product> productList = productServiceImp.productList();

        request.setAttribute("deleteSuccessful", "Xóa thành công !!!");
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher=  request.getRequestDispatcher("view/product/product_management.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response){
        String searchByName = request.getParameter("searchByName");
        System.out.println(searchByName);
        List<Product> productListSearchByName = new ArrayList<>();
        List<Product> productList = productServiceImp.productList();
        for (Product product : productList) {
            String productName = product.getProductName().toLowerCase();
            if (productName.contains(searchByName)){
                productListSearchByName.add(product);
            }
        }
        System.out.println(productListSearchByName.toString());

        request.setAttribute("productList", productListSearchByName);
        RequestDispatcher dispatcher=  request.getRequestDispatcher("view/product/product_management.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
