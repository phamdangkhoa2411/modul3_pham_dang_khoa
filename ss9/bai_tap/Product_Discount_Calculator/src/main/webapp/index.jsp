<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/9/2022
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/Product_Discount_Calculator" method="post">
    <label> ProductDescription : </label>
    <input type="text" name="ProductDescription"><br>

    <label> list_price : </label>
    <input type="text" name="list_price" placeholder="list_price" value="0"><br>

    <label> Discount_Amount : </label>
    <input type="text" name="Discount_Amount" placeholder="Discount_Amount" value="0"><br>



    <input type="submit" id="submit" value="Calculator">

  </form>
  </body>
</html>
