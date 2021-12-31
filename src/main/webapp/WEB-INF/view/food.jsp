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
    <c:when test="${mode=='ADD_FOODTYPE'}">
        <div class="container" align="center">
            <br>
            <h3>ADDING NEW FOOD TYPE</h3>
            <form method="POST" action="/save-foodtype">
                    <%--                <input type="hidden" name="id" value=${dietplanner.id}><br>--%>
                <br> <input type="text" name="fname" placeholder="FOOD NAME" value="${foodtype.fname}" required> <br>
                <br> <input type="text" name="fquantity" placeholder="FOOD QUANTITY" value="${foodtype.fquantity}" required> <br>
                <br> <input type="text" name="fcarbo" placeholder="CARBOHYDRATES QUANTITY" value="${foodtype.fcarbo}"><br>
                <br> <input type="text" name="fprotein" placeholder="PROTEIN QUANTITY" value="${foodtype.fprotein}"><br>
                <br> <input type="text" name="fvitamins" placeholder="VITAMINS QUANTITY" value="${foodtype.fvitamins}"><br>
                <br><input type="submit" value="ADD"><br>
                <br>
                <p>Note: For Items like Idly or Dosa Quantity refers to number of items(1 idly, 1 dosa) where as items like rice or biryani
                quantiy refers to no of plates (approx: 150g for 1 plate)</p>
            </form>
            <br>
            <!--<p><a href="/adminhome" style="text-decoration: none;color: #2645d9"></a> </p> -->
        </div>
    </c:when>
</c:choose>
</div>
</html>