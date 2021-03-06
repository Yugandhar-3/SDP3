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
        <c:when test="${mode=='ALL_FOODTYPES' }">
            <div class="container text-center" id="tasksDiv">
                <h3>All FOOD TYPES</h3>
                <hr>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>FOOD NAME</th>
                            <th>FOOD QUANTITY</th>
                            <th>FOOD SIZE</th>
                            <th>CARBOHYDRATES QUANTITY</th>
                            <th>PROTEINS QUANTITY</th>
                            <th>VITAMINS QUANTITY</th>
                                <%--                        <th>Delete</th>--%>
                                <%--                        <th>Edit</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="foodtype" items="${foodtypes }">
                            <tr>
                                <td>${foodtype.fname}</td>
                                <td>${foodtype.fquantity}</td>
                                <td>${foodtype.fsize}</td>
                                <td>${foodtype.fcarbo}</td>
                                <td>${foodtype.fprotein}</td>
                                <td>${foodtype.fvitamins}</td>
                                <td><a href="/delete-user?id=${foodtype.fname }"><i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
                                <td><a href="/edit-user?id=${foodtype.fname }"><i class="fa fa-pencil" style="font-size:24px"></i></a></td>
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