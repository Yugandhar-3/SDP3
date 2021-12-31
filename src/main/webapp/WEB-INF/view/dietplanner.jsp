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
    <c:choose>
        <c:when test="${mode=='ADD_DIETPLANNER'}">

           <div class="cont" align="center">
               <div class="container" align="center">
                   <br>
                   <h3 style="margin-top: 15px">ADDING NEW DIET PLANNER</h3>
                   <form method="POST" action="/save-dietplanner">
                       <input type="text" name="fullname" placeholder="FULLNAME" value="${dietplanner.fullname}" required>
                       <input type="text" name="email" placeholder="EMAIL" value="${dietplanner.email}" required>
                       <input type="text" name="phone" placeholder="PHONE NUMBER" value="${dietplanner.phone}" required>
                       <input type="text" name="gender" placeholder="GENDER" value="${dietplanner.gender}" required>
                       <input type="text" name="experience" placeholder="EXPERIENCE" value="${dietplanner.experience}" required>
                       <input type="text" name="address" placeholder="ADDRESS" value="${dietplanner.address}" required>
                       <input type="hidden" name="password" placeholder="PASSWORD" value="dietplanner" >
                       <input type="submit" value="ADD">
                   </form>
               </div>
           </div>

        </c:when>
    </c:choose>

</div>
</body>

<style>
    .cont .container{
        display: flex;
    }
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
    .container input{
        width: 70%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }
    .container input[type=submit]{
        background-color: #ec9c32;
        cursor: pointer;
        border-radius: 12px;
        width: 31%;
    }
    .container{
        display: flex;
        justify-content: center;
        margin:0px auto 10px 15px;
        max-width: 500px;
        min-height: 500px;
        background-color: antiquewhite;
        flex-wrap: wrap;
    }
</style>
</html>
