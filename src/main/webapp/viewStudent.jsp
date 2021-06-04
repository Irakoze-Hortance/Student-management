<%--
  Created by IntelliJ IDEA.
  User: Hortance
  Date: 5/13/2021
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Students Management</title>
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
	<h4>View single student</h4>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th></th>
        </tr>
        <tr>
            <td><c:out value="${existingStudent.id}"/></td>
            <td><c:out value="${existingStudent.firstName}"/></td>
            <td><c:out value="${existingStudent.lastName}"/></td>
            <td><c:out value="${existingStudent.gender}"/></td>
            <td>
                <a href="/student_management_war/edit?id=<c:out value='${existingStudent.id}' />">Edit</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a class="text-danger" href="/student_management_war/delete?id=<c:out value='${existingStudent.id}' />">Delete</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>