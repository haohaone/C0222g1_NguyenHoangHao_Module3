<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/27/2022
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Customer</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        .head{

            height: 70px;
            color: white;
            font-size: 30px;
            justify-content: center;
            align-items: center;
            font-weight: bold;
        }
        img{
            height: 50px;
            width: 50px;
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
        <table class="table text-center">
            <tr>
                <th>No.</th>
                <th>Họ và tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh đại diện</th>
            </tr>

            <c:forEach items="${list_customer}" var="customer" varStatus="customerStatus">
            <tr>
                <td>${customerStatus.count}</td>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td>
                    <img src="${customer.avatar}">
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
</html>
