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
            <li><a href="/logout"><i class="fas fa-sign-out-alt" ></i></a></li>
        </div>
    </ul>
</div>
<br>
<div class="content">

    <h1>Welcome <%=session.getAttribute("username2")%> </h1>
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
