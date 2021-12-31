<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>SDP3</title>
</head>
<body style="background-image: url('http://localhost:8978/img/img_1.png'); background-repeat: no-repeat;
background-size: cover;
height: 95vh;
background-color: rgba(0,0,0,0.8);">
<div id="navbar" class="navd">
    <ul>
        <li><a href="/"><h3>WELCOME</h3></a></li>
       <div class="topright">
            <li><a href="/register" class="active">Register</a> |</li>
            <li><a href="/login" class="active">Login</a> | </li>
            <li><a href="/adminlogin" class="active">AdminLogin</a></li>
            <li><a href="/contactus" class="active">Contact</a></li>
        </div>
    </ul>
</div>
<div class="content">
    <c:choose>
        <c:when test="${mode=='MODE_REGISTER'}">
            <div class="container" align="center">
                <br>
                <h3>USER REGISTRATION FORM</h3>
                <form method="POST" action="/save-user">
                    <br><input type="hidden" name="id" value="${user.id}" ><br>
                    <br><input type="text" name="firstname" placeholder="FIRSTNAME" value="${user.firstname}" required><br>
                    <br><input type="text" name="lastname" placeholder="LASTNAME" value="${user.lastname}" required><br>
                    <br><input type="text" name="email" placeholder="EMAIL" value="${user.email}" required><br>
                    <br><input type="password" name="password" placeholder="PASSWORD" value="${user.password}" required><br>
                    <br><input type="password" name="retypepassword" placeholder="RETYPEPASSWORD" value="${user.retypepassword}" required><br>
                    <br><input type="submit" value="REGISTER"><br>
                </form>
                <br>
                <p>Have an account?<a href="/login" style="text-decoration: none;color: #2645d9">Login</a> </p>
            </div>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${mode=='MODE_LOGIN'}">
            <div class="container" align="center">
                <br>
                <h3>USER LOGIN PAGE</h3>
                <br>
                <form method="post" action="/login-user">
                    <c:if test="${not empty error}">
                        <span style="color:red;"><c:out value="${error}"></c:out></span>
                    </c:if>
                    <br>
                    <br>
                    <input type="text" name="email" placeholder="EMAIL" value="${user.email}" required><br>
                    <input type="password" name="password" placeholder="PASSWORD" value="${user.password}" required><br>
                    <br>
                    <input type="submit" value="LOGIN">
                </form>
                <br>
                <a href="#"  style="color: #2645d9"> Forgot Password ??</a>
                <br>
                <br>
                <p style="text-decoration: none">Dont Have an Account ?? <a href="/register" style="color: #2645d9">SignUp</a></p>
                <br>
            </div>
        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${mode=='MODE_ADMINLOGIN'}">
            <div class="container" align="center">
                <br>
                <h3>ADMIN LOGIN PAGE</h3>
                <br>
                <form method="post" action="/admin-login">
                    <c:if test="${not empty error}">
                        <span style="color:red;"><c:out value="${error}"></c:out></span>
                    </c:if>
                    <br>
                    <br>
                    <input type="text" name="email" placeholder="EMAIL" value="${admin.email}" required><br>
                    <input type="password" name="password" placeholder="PASSWORD" value="${admin.password}" required><br>
                    <br>
                    <input type="submit" value="LOGIN">
                </form>
                <br>
                <a href="#"  style="color: #2645d9"> Forgot Password ??</a>
                <br>
                <br>
                <p style="text-decoration: none">Dont Have an Account ?? <a href="/admin-login" style="color: #2645d9">SignUp</a></p>
                <br>
            </div>
        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${mode=='CONTACT_US'}">
            <p>Dietly</p>
        </c:when>
    </c:choose>

</div>
</body>
</html>
