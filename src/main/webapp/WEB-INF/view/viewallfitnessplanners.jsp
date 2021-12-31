<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<div class="content">
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
    <c:choose>
        <c:when test="${mode=='ALL_FITNESSPLANNERS' }">
            <div class="container text-center" id="tasksDiv">
                <h3>All FITNESS PLANNERS</h3>
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
                            <th>Delete</th>
                            <th>Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="fitnessplanner" items="${fitnessplanners }">
                            <tr>
                                <td>${fitnessplanner.id}</td>
                                <td>${fitnessplanner.fullname}</td>
                                <td>${fitnessplanner.email}</td>
                                <td>${fitnessplanner.phone}</td>
                                <td>${fitnessplanner.gender}</td>
                                <td>${fitnessplanner.experience}</td>
                                <td>${fitnessplanner.address}</td>
                                <td><a href="/edit-fuser/${fitnessplanner.id }">EDIT<i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                                <td><a href="/delete-fuser/${fitnessplanner.id }">DELETE<i class="fa fa-pencil" style="font-size:24px"></i></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>
        <c:when test="${mode=='EDIT_MODE'}">
            <form name="edit" action="/updatefitnessplanner" method="post">
                <input type="hidden" name="id" value="${FitnessTrainer.id}">
                <input type="text" name="fullname" value="${FitnessTrainer.fullname}">
                <input type="text" name="email" value="${FitnessTrainer.email}">
                <input type="text" name="phone" value="${FitnessTrainer.phone}">
                <input type="text" name="gender" value="${FitnessTrainer.gender}">
                <input type="text" name="experience" value="${FitnessTrainer.experience}">
                <input type="text" name="address" value="${FitnessTrainer.address}">
                <input type="hidden" name="password" value="${FitnessTrainer.password}">
                <input type="submit" value="Submit">
            </form>

        </c:when>
    </c:choose>
</div>
</html>