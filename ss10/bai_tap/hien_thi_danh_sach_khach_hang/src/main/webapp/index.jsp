<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/10/2022
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        table {
           width: 700px;
            margin: auto;
        }
    </style>
</head>
<body>

<h2 style="text-align: center">Danh Sách Khách Hàng </h2>
<div>


    <table border="1">
        <tr>
            <th>Tên</th>
            <th> ngày sinh</th>
            <th> địa chỉ</th>
            <th> ảnh</th>
        </tr>

        <c:forEach items="${list}" var="i">

            <tr>
                <td>${i.name}</td>
                <td>${i.dayOfBirth}</td>
                <td>${i.address}</td>
                <td><img src="${i.photo}" width="50px" height="50px"></td>
            </tr>

        </c:forEach>


    </table>
</div>
</body>
</html>
