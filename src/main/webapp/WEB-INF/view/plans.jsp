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
            <li><a href="/logout-customer"><i class="fas fa-sign-out-alt" ></i></a></li>
        </div>
    </ul>
</div>
<br>
<div class="content">

<%--    <c:choose>--%>
<%--        <c:when test="${mode=='ADD_PLANS'}">--%>
<%--            <div class="container" align="center">--%>
<%--                <br>--%>
<%--                <h3>ADDING NEW DIET PLANNER</h3>--%>
<%--                <form method="POST" action="/save-plans">--%>
<%--                        &lt;%&ndash;                <input type="hidden" name="id" value=${dietplanner.id}><br>&ndash;%&gt;--%>
<%--                    <br><input type="text" name="pname" placeholder="PLAN NAME" value="${plans.pname}" required><br>--%>
<%--                    <br><input type="text" name="pamount" placeholder="AMOUNT" value="${plans.pamount}" required><br>--%>
<%--                    <br><input type="text" name="description" placeholder=DESCRIPTION" value="${plans.description}" required><br>--%>
<%--                    <br><input type="submit" value="ADD"><br>--%>
<%--                </form>--%>
<%--                <br>--%>
<%--                <!--<p><a href="/adminhome" style="text-decoration: none;color: #2645d9"></a> </p> -->--%>
<%--            </div>--%>
<%--        </c:when>--%>
<%--    </c:choose>--%>


    <c:choose>
        <c:when test="${mode=='ALL_PLANS' }">
            <div class="container text-center" id="tasksDiv">
                <h3>ALL PLANS</h3>
                <hr>
                <div class="tabledata" style="margin-left: 70px;margin-right: 70px;margin-top: 20px;">
                    <table class="table table-striped table-bordered">
                         <tr>
                            <th>Plan Name</th>
                            <th>Plan Amount</th>
                            <th>Plan Description</th>
                            <th></th>
                        </tr>
                        <c:forEach var="plans" items="${planss }">
                            <tr>
                                <td>${plans.pname}</td>
                                <td>${plans.pamount}</td>
                                <td>${plans.description}</td>
                                <td><a href="#">BuyNow</a></td>
                            </tr>
                        </c:forEach>
                        </table>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>
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