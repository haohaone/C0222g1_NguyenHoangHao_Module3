<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/28/2022
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Furama Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/login.css" rel="stylesheet" type="text/css">
</head>

<body class="h-100 w-100 back-group">
<div class="container-fluid w-100 h-100 p-0 m-0">
    <div class="row w-100 h-100 p-0 m-0">
        <div class="col-md-4 p-0 m-0 "></div>
        <div class="col-md-4 p-0 m-0 login">
            <div class="h-50 w-100 bg-white p-0 m-0 ">
                <div class=" login h-25">
                        <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png"
                             class="logo">
                        <div class="text-primary title">Furama Login</div>
                </div>
                <form class="h-75">
                    <div class="p-3">
                        <div class="form-group ">
                            <input type="email"
                                   class="form-control border-primary text-dark"
                                   name="email"
                                   aria-describedby="emailHelp"
                                   placeholder="Account name / email">
                        </div>
                        <div class="form-group">
                            <input type="password"
                                   class="form-control border-primary text-dark"
                                   name="password"
                                   placeholder="Password">
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox"
                                   class="form-check-input bg-primary "
                                   name="remember">
                            <span><label class="text-dark">Remember Account</label></span>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
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
<script src="../js/bootstrap.min.js"></script>

</html>
