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
</head>
<style>
    .display{
        color: deepskyblue;
        border-radius: 20px;
        font-family: "Comic Sans MS";
    }
</style>
<body>
<center>
    <h1>Students Management</h1>
    <h2>
        <a href="/studentManagement_war_exploded/new" class="link">Add New Student</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/studentManagement_war_exploded/list" class="link">List All Students</a>
    </h2>
</center>
<div align="center">
        <caption><h2>View single student</h2></caption>
    <div  class="display">
        <h3>Last Name : ${existingStudent.lastName}</h3>
        <h3>First Name: ${existingStudent.firstName}</h3>
        <h3>Gender    : ${existingStudent.gender}</h3>
    </div>


    <a href="/studentManagement_war_exploded/edit?id=<c:out value='${existingStudent.id}' />">Edit</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/studentManagement_war_exploded/delete?id=<c:out value='${existingStudent.id}' />">Delete</a>

</div>
</body>
</html>