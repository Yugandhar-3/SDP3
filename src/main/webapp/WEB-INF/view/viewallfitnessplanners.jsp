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
                                <%--                        <th>Delete</th>--%>
                                <%--                        <th>Edit</th>--%>
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
                                <td><a href="/delete-user?id=${fitnessplanner.id }">DELETE<i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                                <td><a href="/edit-user?id=${fitnessplanner.id }">EDIT<i class="fa fa-pencil" style="font-size:24px"></i></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>
</html>