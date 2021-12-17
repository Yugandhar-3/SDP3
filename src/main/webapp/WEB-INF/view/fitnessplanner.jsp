<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<div class="content">
    <div id="sidebar" class="side">
        <ul>
            <br><a href="/back">BACK</a><br>
        </ul>
    </div>
<c:choose>
    <c:when test="${mode=='ADD_FITNESSPLANNER'}">
        <div class="container" align="center">
            <br>
            <h3>ADDING NEW FITNESS PLANNER</h3>
            <form method="POST" action="/save-fitnessplanner">
                    <%--                <input type="hidden" name="id" value=${dietplanner.id}><br>--%>
                <br><input type="text" name="fullname" placeholder="FULLNAME" value="${fitnessplanner.fullname}" required><br>
                <br><input type="text" name="email" placeholder="EMAIL" value="${fitnessplanner.email}" required><br>
                <br><input type="text" name="phone" placeholder="PHONE NUMBER" value="${fitnessplanner.phone}" required><br>
                <br><input type="text" name="gender" placeholder="GENDER" value="${fitnessplanner.gender}" required><br>
                <br><input type="text" name="experience" placeholder="EXPERIENCE" value="${fitnessplanner.experience}" required><br>
                <br><input type="text" name="address" placeholder="ADDRESS" value="${fitnessplanner.address}" required><br>
                <br><input type="hidden" name="password" placeholder="PASSWORD" value="fitnessplanner" ><br>
                <br><input type="submit" value="ADD">
            </form>
            <br>
            <!--<p><a href="/adminhome" style="text-decoration: none;color: #2645d9"></a> </p> -->
        </div>
    </c:when>
</c:choose>
</div>
</html>