<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 5/20/2022
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thu vien jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sinh viên</h1>
<a href="/student?action=add">Them moi</a>
<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Point</th>
        <th>Rank</th>
        <th>Account</th>
        <th>Class Name</th>
        <th>Email</th>

    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.id}</td>
            <td>${student.name}</td>

            <c:if test="${student.gender}">
               <td>Nam</td>
            </c:if>
            <c:if test="${!student.gender}">
                <td>Nữ</td>
            </c:if>

            <td>${student.birthday}</td>
            <td>${student.point}</td>
            <c:choose>
                <c:when test="${student.point>=8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.point>=7}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.point>=5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yếu</td>
                </c:otherwise>
            </c:choose>
            <td>${student.account}</td>
            <c:forEach items="${classList}" var="cls">
                <c:if test="${student.classId==cls.id}">
                    <td>${cls.name}</td>
                </c:if>
            </c:forEach>

            <td><c:out value="${student.email}"></c:out></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
