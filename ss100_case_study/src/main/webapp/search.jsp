<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/22/2022
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href=" https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<body>
<h2>Search By Name</h2>
<p>
    <a href="/customers">Back to List</a>
</p>
<table align="center" border="1">
    <caption >Search Result:</caption>
    <tr class="table table-warning">
        <th>Customer ID</th>
        <th>Customer Name</th>
        <th>Customer Type Name</th>
        <th>Customer Birthday</th>
        <th>Customer Gender</th>
        <th>Customer ID Card</th>
        <th>Customer Phone</th>
        <th>Customer Email</th>
        <th>Customer Address</th>

    </tr>
    <c:forEach items="${searchName}" var="customer">
        <tr>
            <td class="table-light"><c:out value="${customer.getId()}"/></td>
            <td class="table-danger"><c:out value="${customer.getName()}"/></td>

            <c:if test="${customer.getIdTypeCustomer()==1}">
                <td class="table-light">Diamond</td>
            </c:if>

            <c:if test="${customer.getIdTypeCustomer()==2}">
                <td class="table-light">Platinium</td>
            </c:if>

            <c:if test="${customer.getIdTypeCustomer()==3}">
                <td class="table-light">Gold</td>
            </c:if>

            <c:if test="${customer.getIdTypeCustomer()==4}">
                <td class="table-light">Silver</td>
            </c:if>

            <c:if test="${customer.getIdTypeCustomer()==5}">
                <td class="table-light">Member</td>
            </c:if>


            <td class="table-danger"><c:out value="${customer.getBirthday()}"/></td>
            <c:if test="${customer.getGender()== 0}">
                <td class="table-light">nữ</td>
            </c:if>

            <c:if test="${customer.getGender()== 1}">
                <td class="table-light">nam</td>
            </c:if>

            <td class="table-danger"><c:out value="${customer.getIdCard()}"/></td>
            <td class="table-light"><c:out value="${customer.getPhone()}"/></td>
            <td class="table-danger"><c:out value="${customer.getEmail()}"/></td>
            <td class="table-light"><c:out value="${customer.getAddress()}"/></td>

        </tr>
    </c:forEach>
</table>
</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</html>
