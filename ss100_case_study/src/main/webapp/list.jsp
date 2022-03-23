<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="list-group-item d-flex justify-content-between align-items-start list-group list-group-horizontal">
    <h1>Customer Management</h1>

    <form action="/customers" method="post" class="input-group">
        <input type="hidden" name="action" value="search" class="form-control rounded">
        <input type="text" name="searchName" class="btn btn-outline-primary">
        <input type="submit" value="Seach by Name" class="btn btn-primary">
    </form>

    <h2>
        <a href="/customers?action=create">Add New Customer</a>
    </h2>

</div>

<table border="1" class="table table-warning table-bordered "  id="example">
    <caption><h2>List of Customers</h2></caption>
    <thead class="table-warning">


    <tr>
        <th>Customer ID</th>
        <th>Customer Name</th>
        <th>Customer Type Name</th>
        <th>Customer Birthday</th>
        <th>Customer Gender</th>
        <th>Customer ID Card</th>
        <th>Customer Phone</th>
        <th>Customer Email</th>
        <th>Customer Address</th>
        <th>Edit</th>
        <th>Remove</th>

    </tr>
    </thead>
    <c:forEach var="customer" items="${customerlist}">
        <tr>
            <td class="table-light"><c:out value="${customer.getId()}"/></td>
            <td class="table-danger"><c:out value="${customer.getName()}"/></td>
            <td class="table-light"><c:out value="${customer.getNameidTypeCustomer()}"/></td>
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


            <td>
                <a href="/customers?action=edit&id=${customer.id}">Edit</a>

            </td>

            <td>
                    <%--  <a class="btn btn-danger"  href="/customers?action=delete&id=${customer.id}">Delete</a>--%>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="getID(${customer.id})">
                    DELETE
                </button>
            </td>

        </tr>
    </c:forEach>
</table>
</div>
<a class="btn btn-primary" href="index.jsp" style="size: auto"> Back to home </a>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--    DELETE CUSTOMER--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="/customers?action=delete&id=${customer.id}" >
                <input type="hidden" name="idDelete" id="modalDelete">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ARE YOU SURE</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ban xoa
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">YES!!!</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<script>
    function getID(id) {
        document.getElementById("modalDelete").value = id;
    }
</script>
<script>
    $.extend( true, $.fn.dataTable.defaults, {
        "searching": false,
        "ordering": false
    } );
    $(document).ready(function() {
        $('#example').DataTable({
            "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
        });
    } );
</script>
</html>