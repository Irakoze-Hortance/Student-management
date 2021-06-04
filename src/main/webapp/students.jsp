<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/30/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Students Managment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
    <h1>Students Management</h1>
    <h4>
        <a href="/student_management_war/new">Add New Student</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/student_management_war/list">List All Students</a>
    </h4>
</div>
<div align="center" class="container">
	<h4>List of Students</h4>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th></th>
        </tr>
        <c:forEach var="student" items="${listStudent}">
            <tr>
                <td><c:out value="${student.id}" /></td>
                <td><c:out value="${student.firstName}" /></td>
                <td><c:out value="${student.lastName}" /></td>
                <td><c:out value="${student.gender}" /></td>
                <td>
                    <a href="/student_management_war/edit?id=<c:out value='${student.id}' />">Edit</a>
                    <a class="text-danger" href="/student_management_war/delete?id=<c:out value='${student.id}' />">Delete</a>
                    <a href="/student_management_war/view?id=<c:out value='${student.id}'/>">View</a>

                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>