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
    <c:choose>
    <c:when test="${mode=='MODE_BMI'}">
        <div class="cont">
    <div class="container" align="center">
        <h3>BMI CALCULATOR</h3>
       <br>
        <br>
        <form method="POST" action="/calculate-bmi">
            <input type="text" name="weight" placeholder="Enter Your Weight" value="${bmi.weight}" required>
            <select name="weightype" value="${bmi.weightype}" >
                <option   value="pounds" >Pounds</option> &nbsp;&nbsp;
                <option  value="kg" >Kgs </option>&nbsp;&nbsp;<br>
            </select>
            <input type="text" name="height" placeholder="Enter Your Height" value="${bmi.height}" required>
            <select name="heigtype" value="${bmi.heigtype}">
                <option  value="meters"> Metres &nbsp;&nbsp;
                <option value="inches"> Inches &nbsp;&nbsp;<br>
            </select>
            <input type="submit" value="Calculate My BMI">
        </form>
    </div>
<div class="container2">
    <h2>Length Converter</h2>

        <%--            L--%>
    <p>Type a value in the Feet field to convert the value to Inches:</p>

    <p>
        <label>Feet</label>
        <input id="inputFeet" type="number" placeholder="Feet" oninput="LengthConverter(this.value)" onchange="LengthConverter(this.value)">
    </p>
    <br>
    <br>
    <p>Inches: <span id="outputInches"></span></p>

    <script>
        function LengthConverter(valNum) {
            document.getElementById("outputInches").innerHTML=valNum*12;
        }
    </script>


        <%--            L1--%>
    <p>Type a value in the Feet field to convert the value to Meters:</p>

    <p>
        <label>Feet</label>
        <input id="inputFeet1" type="number" placeholder="Feet" oninput="LengthConverter1(this.value)" onchange="LengthConverter1(this.value)">
    </p>
    <br>
    <p>Meters: <span id="outputMeters1"></span></p>

    <script>
        function LengthConverter1(valNum) {
            document.getElementById("outputMeters1").innerHTML=valNum/3.2808;
        }
    </script>


        <%--            L2--%>
    <p>Type a value in the cm field to convert the value to Inches:</p>

    <p>
        <label>cm</label>
        <input id="inputcm" type="number" placeholder="cm" oninput="LengthConverter2(this.value)" onchange="LengthConverter2(this.value)">
    </p>
    <br>
    <p>Inches: <span id="outputInches2"></span></p>

    <script>
        function LengthConverter2(valNum) {
            document.getElementById("outputInches2").innerHTML=valNum*0.39370;
        }
    </script>

        <%--                L3--%>

    <p>Type a value in the cm field to convert the value to Meters:</p>

    <p>
        <label>cm</label>
        <input id="inputcm1" type="number" placeholder="cm" oninput="LengthConverter3(this.value)" onchange="LengthConverter3(this.value)">
    </p>
    <br>
    <p>Meters: <span id="outputMeters"></span></p>

    <script>
        function LengthConverter3(valNum) {
            document.getElementById("outputMeters").innerHTML=valNum/100;
        }
    </script>

        <%--             L4--%>






</div>
</div>


</div>

    </c:when>
    </c:choose>


    <c:choose>
    <c:when test="${mode=='VIEW-BMI' }">
    <div class="container text-center" id="tasksDiv">
        <h3>Your BMI</h3>
        <hr>
        <div class="card">
            <p>Your Height in "${bmi.weightype}": "${bmi.weight}"</p>
            <p>Your Weight in "${bmi.heigtype}": "${bmi.height}"</p>
            <p>Your BMI Value: "${bmi.bmivalue}"</p>
            <p>You are: "${bmi.response}"</p>
        </div>
        </c:when>
        </c:choose>

</body>

<style>
    .container{
        display: flex;
        justify-content: center;
        margin:0px auto 10px 15px;
        max-width: 350px;
        min-height: 200px;
        background-color: antiquewhite;
        flex-wrap: wrap;
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
    .container select{
        width: 25%;
        padding: 12px;
    }
    .container input[type=submit]{
        background-color: #ec9c32;
        cursor: pointer;
        border-radius: 12px;
        width: 50%;
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
    .cont .container{
        display: flex;
        float: right;
        margin-right: 20px;
    }
    .cont .container2{
        display: flex;
        float: left;
        margin-left: 20px;
    }
    .container2{
        display: flex;
        justify-content: center;
        margin:0px auto 10px 15px;
        max-width: 500px;
        min-height: 500px;
        background-color: #ee9d7b;
        flex-wrap: wrap;
        border-radius: 10px;
        margin: 2px;
        padding: 2px;
    }
    .container2 input{
        width: 70%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }
</style>

</html>


</body>
</div>
</html>