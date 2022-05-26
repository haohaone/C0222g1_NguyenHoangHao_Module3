<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/26/2022
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Product Discount Calculator</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="container">
    <form action="/product" method="post">
        <div class="form-group">
            <label>Mô tả của sản phẩm</label>
            <input class="form-control" type="text" name="product_description" value="${description}">
        </div>
        <div class="form-group">
            <label>Giá niêm yết của sản phẩm</label>
            <input class="form-control" type="text" name="list_price" value="${listPrice}">
        </div>
        <div class="form-group">
            <label>Tỷ lệ chiết khấu sản phẩm</label>
            <input class="form-control" type="text" name="discount_percent" value="${discountPercent}">
        </div>
        <button class="btn btn-primary" data-toggel = "modal" data-target = "myModal" type="submit">Tính chiết khấu</button>
    </form>

    <label>Lượng chiết khấu</label>
    <div class="border border-primary pt-2 pb-2" style="border-radius: 5px">&nbsp;${discountAmount}</div>
    <label>Giá sau khi đã được chiết khấu</label>
    <div class="border border-warning pt-2 pb-2" style="border-radius: 5px">&nbsp;${discountPrice}</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
</html>
