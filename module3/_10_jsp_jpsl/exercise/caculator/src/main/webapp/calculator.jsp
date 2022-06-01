<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 5/27/2022
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Calculator</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        button{
            width: 100%;
            border: 0;
            border-radius: 50px;
            color: #50d770;
        }

        input{
            color: #50d770;
        }

        body{
            display: flex;
            height: 100%;
            background: #50d770 linear-gradient(#50d770, black);
            text-align: center;
            align-items: center;
        }
        .main{
            height: 100%;

        }
        .content{
            height: 100%;

            text-align: center;
            align-items: center;
        }
        .calculator{
            font-size: 18px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container main ">
        <form action="calculator" method="get" class="content border-0">
            <div class="row h-100 content">
                <div class="col-md-3 h-50">&nbsp;</div>
                <div class="col-md-6 h-50">
                    <div class="card">
                        <div class="col-md-12 card-header bg-dark border-0 ">
                            <input class="input-group border-0 bg-dark h-50 calculator" name="result" id="result" placeholder="0"
                            value="${result}">
                        </div>
                        <div class="card-body border-0 bg-secondary">
                            <div>
                                <div class="row col-md-12 p-0 m-0 pb-3">
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="deleteValue()">DEL</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="addMark('(')">(</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="addMark(')')">)</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn mark bg-dark calculator" onclick="addMark('%')">%</button>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <div class="row col-md-12 p-0 m-0 pb-3">
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="addNum(7)">7</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="addNum(8)">8</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn num bg-dark calculator" onclick="addNum(9)">9</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn mark bg-dark calculator" onclick="addMark('+')">+</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row col-md-12 p-0 m-0 pb-3">
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(4)">4</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(5)">5</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(6)">6</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn mark bg-dark calculator" onclick="addMark('-')">-</button>
                                </div>
                            </div>

                            <div class="row col-md-12 p-0 m-0 pb-3">
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(1)">1</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(2)">2</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(3)">3</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn mark bg-dark calculator" onclick="addMark('*')">*</button>
                                </div>
                            </div>

                            <div class="row col-md-12 p-0 m-0 pb-3">
                                <div class="col-md-6">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addNum(0)">0</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn mark bg-dark calculator">=</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn num bg-dark calculator" onclick="addMark('/')">/</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 h-50">&nbsp;</div>
            </div>
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    function addNum(number) {
        let str = document.getElementById("result").value;
        document.getElementById("result").value = str + number;
    }

    function addMark(mark) {
        let str = document.getElementById("result").value;
        document.getElementById("result").value = str + " " + mark + " ";
    }
    function deleteValue() {
        document.getElementById("result").value = "";
    }
</script>
</html>
