<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/28/2022
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Furama Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/furama.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>

<body class=" back-group">
<nav class="navbar bg-white m-0 p-0" id="head">
    <div class="row col-md-12 h-100 m-0 p-0">
        <div class="col-md-2 m-0 p-0 center-box">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png"
                 class="logo">
        </div>
        <div class="row col-md-7 h-100 p-0 p-0">
            <div class="col-md-2 h-100 w-100 p-1 m-0 center-box">
                <button class="btn h-100 w-100 p-0 m-0 center-box button-menu" type="button">
                    <a class=" h-100  w-100 p-0 m-0 button-menu center-box home" href="#">Home</a>
                </button>
            </div>

            <div class="col-md-2 h-100 w-100 p-1 m-0">
                <div class="dropdown h-100 w-100 p-0 m-0">
                    <button class="btn h-100 w-100 p-0 m-0 center-box button-menu" type="button" id="cumstomer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Cumstomer
                        <i class="bi bi-caret-down pl-2"></i>
                    </button>
                    <div class="dropdown-menu p-0 m-0" aria-labelledby="service">
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Add new cumstomer</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Display cumstomer</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Edit cumstomer</a>
                    </div>
                </div>
            </div>

            <div class="col-md-2 h-100 w-100 p-1 m-0">
                <div class="dropdown h-100 w-100 p-0 m-0">
                    <button class="btn h-100 w-100 p- m-0 center-box button-menu" type="button" id="service" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Service
                        <i class="bi bi-caret-down pl-2"></i>
                    </button>
                    <div class="dropdown-menu p-0 m-0" aria-labelledby="service">
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Add new service</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Display service</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Edit service</a>
                    </div>
                </div>
            </div>

            <div class="col-md-2 h-100 w-100 p-1 m-0">
                <div class="dropdown h-100 w-100 p-0 m-0">
                    <button class="btn h-100 w-100 p-0 m-0 center-box button-menu" type="button" id="contract" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Contract
                        <i class="bi bi-caret-down pl-2"></i>
                    </button>
                    <div class="dropdown-menu p-0 m-0" aria-labelledby="service">
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Add new contract</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Display contract</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Edit contract</a>
                    </div>
                </div>
            </div>

            <div class="col-md-2 h-100 w-100 p-1 m-0">
                <div class="dropdown h-100 w-100 p-0 m-0">
                    <button class="btn h-100 w-100 p-0 m-0 center-box button-menu" type="button" id="employee" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Employee
                        <i class="bi bi-caret-down pl-2"></i>
                    </button>
                    <div class="dropdown-menu p-0 m-0" aria-labelledby="service">
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Add new employee</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Display employee</a>
                        <a class="dropdown-item h-100 w-100 p-3 m-0 dropdown-item-custom" href="#">Edit employee</a>
                    </div>
                </div>
            </div>


            <div class="col-md-2">
                &nbsp;
            </div>
        </div>
        <div class="col-md-3 center-box">
            <form class="form-inline my-2 my-lg-0 center-box">
                <div class="p-1 bg-light rounded rounded-pill shadow-sm center-box">
                    <div class="input-group center-box">
                        <input type="search" placeholder="Search" aria-describedby="button-addon1"
                               class="form-control border-0 bg-light">
                        <div class="input-group-append">
                            <button id="button-addon1" type="submit" class="btn btn-link text-primary">
                                <i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</nav>
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

