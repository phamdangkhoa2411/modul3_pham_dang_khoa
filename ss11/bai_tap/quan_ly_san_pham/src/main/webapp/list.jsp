<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/14/2022
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>

<form>
    <input type="text" name="search" placeholder="Search By Name">
    <input type="text" name="action" hidden value="search">
    <button>Search</button>
</form>
<table border="1" id="example" class="table table-striped table-bordered" style="width:70%">
    <thead>
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getIdProduct()}">${product.getNameProduct()}</a></td>
            <td>${product.getPriceProduct()}</td>
            <td>${product.getDescriptionProduct()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getIdProduct()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getIdProduct()}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>
</body>
</html>