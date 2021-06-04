<%@page import="com.example.studentManagement.models.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
	<%! Student std; %>
	<%
		if(request.getAttribute("student")!=null){
			std = (Student) request.getAttribute("student");
		};
	%>
	<div align="center">
	    <h1>Students Management</h1>
	    <h5>
	        <a href="/student_management_war/new">Add New Student</a>
	        &nbsp;&nbsp;&nbsp;
	        <a href="/student_management_war/list">List All Students</a>
	    </h5>
	</div>
	<div class="container">
	    <c:if test="${student != null}">
	    	<form action="update" method="post" class="pb-4">
	    </c:if>
	    <c:if test="${student == null}">
	        <form action="insert" method="post" class="pb-4">
	     </c:if>
         <h2>
              <c:if test="${student != null}">
                   Edit Student
              </c:if>
              <c:if test="${student == null}">
                   Add Student
              </c:if>
          </h2>
       	  <c:if test="${student != null}">
                <input type="hidden" name="id" value="<c:out value='${student.id}' />" />
          </c:if>
	     <div class="form-group">
		    <label for="fname">First name:</label>
		    <input type="text" value="<c:out value='${student.firstName}' />" name="firstName" class="form-control" id="fname">
		  </div>
		  <div class="form-group">
		    <label for="lname">Last name:</label>
		    <input type="text" value="<c:out value='${student.lastName}' />" name="lastName" class="form-control" id="lname">
		  </div>
		  <div class="radio">
		  	<label for="gender-picker">Gender: </label>
		  	<c:if test="${student != null}">
	    		<label id="gender-picker">
				    <% if(std.getGender().strip().equals("Male") || std.getGender().strip().equals("male")){ %>
				    	<% out.print("<input checked value='Male' name='gender' type='radio'> Male</label>&emsp;&emsp;<input value='Female' name='gender' type='radio'> Female</label>"); %>
				    <% }else if(std.getGender().strip().equals("Female") || std.getGender().strip().equals("female")){ %>
				    	<% out.print("<input value='Male' name='gender' type='radio'> Male</label>&emsp;&emsp;<input checked value='Female' name='gender' type='radio'> Female</label>"); %>
				    <%}%>
		    	</label>
	    	</c:if>
	    	<c:if test="${student == null}">
	    		<label id="gender-picker">
				    <input checked value='Male' name='gender' type='radio'> Male</label>&emsp;&emsp;
				    <input value='Female' name='gender' type='radio'> Female</label>
		    	</label>
	    	</c:if>
		  </div>
		  <button type="submit" class="btn btn-success mt-2 mb-4 py-2 px-4">Save</button>
		</form>
	</div>
</body>
</html>