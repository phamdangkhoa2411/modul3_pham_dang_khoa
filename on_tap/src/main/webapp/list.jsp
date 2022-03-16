<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/16/2022
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Customer Manager</h1>
    <h2>
        <a href="Customer?action=create">Add new Customer</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Customer</h2></caption>
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>Phone</td>
            <td>Email</td>
        </tr>
<%--        items = name cua list ben servlet --%>
       <c:forEach var="customer" items="${customers}">
           <tr>
               <td>${customer.id}</td>
               <td>${customer.name}</td>
               <td>${customer.phone}</td>
               <td>${customer.email}</td>
               <td>
                   <a href="Customer?action=edit&id=${customer.id}">Edit</a>
                   <a href="Customer?action=delete&id=${customer.id}">Delete</a>
               </td>

           </tr>
       </c:forEach>
    </table>
</div>
</body>
</html>
