<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/20/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title> </title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/Products?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Product</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quanlity</th>
            <th>Color</th>
            <th>Category Name</th>
        </tr>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.quanlity}"/></td>
                <td><c:out value="${product.color}"/></td>
                <td><c:out value="${product.nameCategory}"/></td>

                <td>
                    <a href="/Products?action=edit&id=${product.id}">Edit</a>
                    <a href="/Products?action=delete&id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
