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
                            <%--                        <th>Delete</th>--%>
                            <%--                        <th>Edit</th>--%>
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
                            <td><a href="/delete-user?id=${dietplanner.id }"><i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                            <td><a href="/edit-user?id=${dietplanner.id }"><i class="fa fa-pencil" style="font-size:24px"></i></a></td>
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