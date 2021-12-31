<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>
        Dietly
        <%--        <p style="font-family:cursive">DIETLY</p>--%>
    </title>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<div id="sidebar" class="side">
    <ul>
        <li><a style="font-family: monospace;font-size: x-large">Dietly</a></li>
        <div class="leftdata">
            <li><a href="/calculate" >Calculate BMI</a></li>
            <li><a href="/premiumplans">Plans</a></li>
            <li><a href="/calculatediet">Calculate diet nutrition</a></li>
            <li><a href="/instructorsdetails">Instructor Details</a></li>
            <li><a href="/createdietplan">Create diet plan</a></li>
            <li><a href="/myprofile">Profile</a></li>
            <li><a href="/foodList">View Food List</a></li>
            <li><a href="/logout-customer"><i class="fas fa-sign-out-alt" ></i></a></li>
        </div>
    </ul>
</div>
<br>
<c:choose>
    <c:when test="${mode=='VIEW_FOODFORM'}">
        <div class="container text-center" id="tasksDiv">
            <h3>All FOOD TYPES</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>FOOD NAME</th>
                        <th>CARBOHYDRATES</th>
                        <th>PROTIENS</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="foodtype" items="${foodtypes }">
                        <tr>
                            <td>${foodtype.fname}</td>
                            <td>${foodtype.fcarbo}</td>
                            <td>${foodtype.fprotein}</td>
                            <td><a href="/addList/${foodtype.fname}">Add To List<i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </c:when>
    <c:when test="${mode=='SHOW_FORM'}">
        <div align="center">
        <form action="/addToList" method="post">
            <input type="hidden" name="uname" value="${uname}"><br>
            <input type="text" name="fname" value="${fname}"><br>
            <input type="text" name="quantity" placeholder="Enter Quantity" value="${quantity}">
            <input type="submit" value="Add to List">
        </form>
        </div>
    </c:when>
</c:choose>


</body>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }
    th{
        color: white;
        background-color: #ee9d7b;
    }
    tr:nth-child(even) {background-color: #f2f2f2;}
    .leftdata{
        float: right;
    }
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #f3955b;
    }

    li {
        float: left;
        display: flex;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        text-transform: capitalize;
    }

    li a:hover {
        color: black;
    }
    *{
        margin: 0px;
        padding: 0px;
    }
    .side{
        width: 100%;
    }
</style>
</html>