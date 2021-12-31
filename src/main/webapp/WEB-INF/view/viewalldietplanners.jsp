<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
    <c:when test="${mode=='ALL_DIETPLANNERS' }">
        <div class="container text-center" id="tasksDiv">
            <h3>All DIET PLANNERS</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Gender</th>
                        <th>Experience</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dietplanner" items="${dietplanners }">
                        <tr>
                            <td>${dietplanner.id}</td>
                            <td>${dietplanner.fullname}</td>
                            <td>${dietplanner.email}</td>
                            <td>${dietplanner.phone}</td>
                            <td>${dietplanner.gender}</td>
                            <td>${dietplanner.experience}</td>
                            <td>${dietplanner.address}</td>
                            <td><a href="/edit-user/${dietplanner.id }">Edit<i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                            <td><a href="/delete-user/${dietplanner.id }">Delete<i class="fa fa-pencil" style="font-size:24px"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
    <c:when test="${mode=='EDIT_MODE'}">
        <form name="edit" action="/updatedietplanner" method="post">
            <input type="hidden" name="id" value="${Dietplanner.id}">
            <input type="text" name="fullname" value="${Dietplanner.fullname}">
            <input type="text" name="email" value="${Dietplanner.email}">
            <input type="text" name="phone" value="${Dietplanner.phone}">
            <input type="text" name="gender" value="${Dietplanner.gender}">
            <input type="text" name="experience" value="${Dietplanner.experience}">
            <input type="text" name="address" value="${Dietplanner.address}">
            <input type="hidden" name="password" value="${Dietplanner.password}">
            <input type="submit" value="Submit">
        </form>
    </c:when>
</c:choose>
</div>

</html>