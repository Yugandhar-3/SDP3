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
            <li><a href="/viewplans">View All Plans</a></li>
            <li><a href="/instructorsdetails">Instructor Details</a></li>
            <li><a href="/createdietplan">Create diet plan</a></li>
            <li><a href="/myprofile">Profile</a></li>
            <li><a href="/logout-customer"><i class="fas fa-sign-out-alt" ></i></a></li>
        </div>
    </ul>
</div>
<br>

<c:choose>
    <c:when test="${mode=='ALL_WISHES'}">
        <div class="container text-center" id="tasksDiv">
            <h2>FOOD ITEMS Added</h2>
            <br>
            <hr>
            <h3>Total Carbohydrate value of your added food: ${carb}</h3>
            <h3>Total Protein value of your added food: ${prot}</h3>
            <div class="table-responsive">
                <table class="table table-striped table-bordered" border="1">
                    <thead>
                    <tr>
                        <th>FOOD NAME</th>
                        <th>FOOD QUANTITY</th>
                        <th>TOTAL CARBOHYDRATES QUANTITY</th>
                        <th>TOTAL PROTEINS QUANTITY</th>
<%--                        <th>VITAMINS QUANTITY</th>--%>
                            <%--                        <th>Delete</th>--%>
                            <%--                        <th>Edit</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="wish" items="${wishlist }">
                        <tr>
                            <td>${wish.fname}</td>
                            <td>${wish.quantity}</td>
                            <td>${wish.totCarb}<c:set var="totCarb"/></td>
                            <td>${wish.totProt}</td>
<%--                            <td>${foodtype.fprotein}</td>--%>
<%--                            <td>${foodtype.fvitamins}</td>--%>
<%--                            <td><a href="/delete-user?id=${foodtype.fname }"><i class="fa fa-trash-o" style="font-size:24px"></i></a></td>--%>
<%--                            <td><a href="/edit-user?id=${foodtype.fname }"><i class="fa fa-pencil" style="font-size:24px"></i></a></td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
</c:choose>
</body>
<style>
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