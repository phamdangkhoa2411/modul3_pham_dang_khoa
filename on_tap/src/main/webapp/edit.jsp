<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/16/2022
  Time: 3:54 PM
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
    <h1>Customer Management</h1>
    <h2>
        <a href="Customer?action=Customer">List All Customer</a>

    </h2>
</center>


<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Customer
                </h2>
            </caption>
            <c:if test="${customers!= null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
            </c:if>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${customers.getName()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer phone:</th>
                <td>
                    <input type="text" name="phone" size="45"
                           value="<c:out value='${customers.getPhone()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer Email:</th>
                <td>
                    <input type="text" name="email" size="15"
                           value="<c:out value='${customers.getEmail()}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
