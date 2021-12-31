<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dietly</title>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<div id="sidebar" class="side">
    <ul>
        <li><a style="font-family: monospace;font-size: x-large">Dietly</a></li>
        <div class="leftdata">
            <li><a href="/addnewdietplanner">DietPlanner</a></li>
            <li><a href="/addnewfitnessplanner">FitnessPlanner</a></li>
            <li><a href="/addnewplan">Plans</a></li>
            <li><a href="/addfood">Fooddetails</a></li>
            <li><a href="/viewallfitnessplanners">Fitnessplanners</a></li>
            <li><a href="/viewalldietplanners">DietPlanners</a></li>
            <li><a href="/viewallfood">Fooddetailvalues</a></li>
            <li><a href="/viewplans">View All Plans</a></li>
            <li><a href="/logout"><i class="fas fa-sign-out-alt" ></i></a></li>
        </div>
    </ul>
</div>
<br>
<div class="content">

    <h1>Welcome <%=session.getAttribute("username2")%> </h1>
</div>



<div class="content">

    <c:choose>
    <c:when test="${mode=='ADD_PLANS'}">
    <div class="container" align="center">
        <br>
        <h3>ADDING NEW DIET PLANNER</h3>
        <form method="POST" action="/save-plans">
                <%--                <input type="hidden" name="id" value=${dietplanner.id}><br>--%>
            <br><input type="text" name="pname" placeholder="PLAN NAME" value="${plans.pname}" required><br>
            <br><input type="text" name="pamount" placeholder="AMOUNT" value="${plans.pamount}" required><br>
            <br><input type="text" name="description" placeholder=DESCRIPTION" value="${plans.description}" required><br>
            <br><input type="submit" value="ADD"><br>
        </form>
        <br>
        <!--<p><a href="/adminhome" style="text-decoration: none;color: #2645d9"></a> </p> -->
    </div>
    </c:when>
    </c:choose>
</div>
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
