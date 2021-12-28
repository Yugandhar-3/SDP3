<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>SDP3</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
            font-family: "Times New Roman";
        }
        header{
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.1)),url('http://localhost:8978/img/img_2.png');
            background-repeat: no-repeat;
            background-size: cover;
        }
        nav{
            width: 100%;
            height: 12vh;
            background-color: rgba(0,0,0,0.2);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-transform: uppercase;
        }
        nav .menu{
            width: 25%;
            display: flex;
            justify-content: space-evenly;
        }
        nav .menu a{
            width: 2px;
            text-decoration: none;
            color: white;
        }
        nav .menu a:hover{
            text-decoration: underline;
            color: #f3955b;
        }
        nav .logo{
            width: 15%;
            text-align: center;
        }

    </style>
</head>
<body>
<header>
    <nav>
        <div class="logo">
            <h1 class=""><img src="http://localhost:8978/img/img_4.png" style="width: 90%; height: 90%;"></h1>
        </div>
        <div class="menu">
            <a href="/register">Register</a>
            <a href="/login">Login</a>
            <a href="#">Contact</a>
        </div>
    </nav>
    <main>
        <section>
            <h3>DIETLY</h3>
            <a href="#"class="aboutpage">Know More</a>
            <a href="#"class="registerpage">Sign Up</a>
        </section>
    </main>

</header>

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

</div>
</body>
</html>
