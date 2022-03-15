<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/14/2022
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
  <c:if test='${message != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>

<p>
  <a href="/product">Back to product list</a>
</p>
<form method="post">
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Name:</td>
        <td><input type="text" name="name" id="name" value="${requestScope["product"].getNameProduct()}"></td>
      </tr>
      <tr>
        <td>Price:</td>
        <td><input type="text" name="price" id="price" value="${requestScope["product"].getPriceProduct()}">
        </td>
      </tr>
      <tr>
        <td>Description:</td>
        <td><input type="text" name="description" id="description"
                   value="${requestScope["product"].getDescriptionProduct()}"></td>
      </tr>
      <tr>
        <td>Producer</td>
        <td><input type="text" name="producer" id="producer" value="${requestScope["product"].getProducer()}">
        </td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>