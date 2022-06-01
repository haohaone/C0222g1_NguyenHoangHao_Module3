<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/30/2022
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        .head {
            height: 70px;
            color: white;
            font-size: 30px;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }
        .footer{
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
    </style>
</head>
<body>
<div class="bg-dark">
    <div class="row head p-0 m-0">
        Danh sách khách hàng
    </div>
</div>
<div class="container">
    <div class="row">
        <table class="table text-center table-hover">
            <tr>
                <th>No.</th>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Nhà sản xuất</th>
                <th>Nhà cung cấp</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <c:forEach items="${productList}" var="product">
                <c:if test="${product.statusDelete == 0}">
                    <tr>
                        <td>${product.index}</td>
                        <td>${product.productId}</td>
                        <td>${product.productName}</td>
                        <td>${product.productionName}</td>
                        <td>${product.distributorName}</td>
                        <td>
                            <a href="/product?action=edit&id=${product.index}">Edit</a>
                        </td>
                        <td>
                            <a href="#" onclick="productIndex(${product.index})" data-toggle="modal"
                               data-target="#delete">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td colspan="7" class="text-primary ">
                    <div class="row w-100">
                        <div class="col-md-6">
                            <a href="/product?action=add" class="font-weight-bold">Thêm khách hàng</a>
                        </div>
                        <div class="col-md-6">
                            <a href="#" data-toggle="modal" data-target="#SearchByName" class="font-weight-bold">
                                Tìm kiếm theo tên
                            </a>
                        </div>
                    </div>
                </td>
            </tr>

            <c:if test="${editSuccessful != null}">
                <tr>
                    <th colspan="7">
                        <div class="text-danger font-weight-bold">${editSuccessful}</div>
                    </th>
                </tr>
            </c:if>

            <c:if test="${addSuccessful != null}">
                <tr>
                    <th colspan="7">
                        <div class="text-success font-weight-bold">${addSuccessful}</div>
                    </th>
                </tr>
            </c:if>

            <c:if test="${deleteSuccessful != null}">
                <tr>
                    <th colspan="7">
                        <div class="text-warning font-weight-bold">${deleteSuccessful}</div>
                    </th>
                </tr>
            </c:if>
        </table>
    </div>
</div>

<div class="modal" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Bạn có muốn xóa khách hàng</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" onclick="productIndex2()">
                    <a id="deleteProduct" class="text-white">Xóa</a>
                </button>
                <button type="button" class="btn btn-dark " data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>

</div>
<div class="modal" id="SearchByName">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header w-100">
                <div class="w-100 center-box">
                    <form method="post" action="/product?action=search"
                          class="form-inline my-2 my-lg-0 w-100 center-box">
                        <div class="p-1 bg-light rounded rounded-pill shadow-sm w-100 center-box">
                            <div class="input-group center-box">
                                <input type="search" placeholder="Tên sản phẩm" aria-describedby="button-addon1"
                                       class="form-control border-0 w-75 bg-light"
                                       name="searchByName"
                                >
                                <div class="input-group-append">
                                    <button id="button-addon1" type="submit" class="btn btn-link text-primary">
                                        <i class="bi bi-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var id;
    function productIndex(index) {
        id = index;
    };

    function productIndex2() {
        let link = "/product?action=delete&id=" + id;
        window.location.href =link;
    };
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="../../js/bootstrap.min.js"></script>

</html>
