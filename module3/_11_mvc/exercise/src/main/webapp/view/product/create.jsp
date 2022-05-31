<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/30/2022
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Creat Product</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/create.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body class="h-100 w-100 bg-dark">
<div class="container-fluid w-100 h-100 p-0 m-0">
    <div class="row w-100 h-100 p-0 m-0">
        <div class="col-md-4 p-0 m-0 "></div>
        <div class="col-md-4 p-0 m-0 login">
            <div class="h-75 w-100 bg-white p-0 m-0 ">
                <div class="row text-center login" style="height: 20%">
                    <div class="row col-md-12 title login">Thêm mới khách hàng</div>
                </div>
                <form action="/product?action=add" method="post" style="height: 80%">
                    <div class="p-3">
                        <div class="form-group ">
                            <label class="text-dark font-weight-bold">Mã sản phẩm</label>
                            <input type="text"
                                   class="form-control border-dark text-dark"
                                   name="productId">
                        </div>
                        <div class="form-group">
                            <label class="text-dark  font-weight-bold">Tên sản phẩm</label>
                            <input type="text"
                                   class="form-control border-dark text-dark"
                                   name="productName">
                        </div>
                        <div class="form-group">
                            <label class="text-dark  font-weight-bold">Nhà sản xuất</label>
                            <input type="text"
                                   class="form-control border-dark text-dark"
                                   name="productionName">
                        </div>
                        <div class="form-group">
                            <label class="text-dark  font-weight-bold">Nhà phân phối</label>
                            <input type="text"
                                   class="form-control border-dark text-dark"
                                   name="distributorName">
                        </div>
                        <button type="submit" class="btn btn-dark w-100 font-weight-bold">Tạo mới</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4  p-0 m-0"></div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="../../js/bootstrap.min.js"></script>
</html>
