<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
body{
background:linear-gradient(#73EC8B,#15B392);
background-repeat: no-repeat;
height:96vh;
}
h1{
color:#9B7EBD;
font-style: italic; 
text-shadow:5px 5px 5px #D4BEE4;
margin:15px;
}
.add{

	background-color: #007BFF; 
    color: white; 
    border: none;
    border-radius: 5px; 
    padding: 10px 20px; 
    cursor: pointer;
    font-size: 15px; 
    transition: background-color 0.3s;
    margin-left:10em;
}
.box{
border-collapse: collapse;
background:#9B7EBD;
}
.con{
	margin-top:2em;
	display: flex; /* Enable Flexbox */
    justify-content: center; /* Center items horizontally */
    align-items: center; /* Center items vertically */
    text-align: center;
}

.res{
border-collapse: collapse;
background:#D4BEE4;
}
.del{
background:red;
color:white;
border-radius:10px;
}
.upd{
color:white;
border-radius:10px;
background:green;
}
@media (max-width: 400px) {
  
.box{
border-collapse: collapse;
background:#9B7EBD;
width:200px;
}
}

</style>
</head>
<body>
 <h1>Employee Details</h1>
 <a href="AddEmployee.jsp"><button class="add">Add Employee</button></a>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="con">
<table class="box" border="1" cellpadding="2">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Date of Birth</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>	
    <tbody class="res">
        <c:forEach var="e" items="${emp}">
            <tr>
                <td>${e.getId()}</td>
                <td>${e.getName()}</td>
                <td>${e.getEmail()}</td>
                <td>${e.getPassword()}</td>
                <td>${e.getDob()}</td>
                <td>${e.getAge()}</td>
                <td>${e.getSalary()}</td>
                <td>${e.getStatus() ? 'Active' : 'Inactive'}</td>
                <td>
                    <a href="delete?id=${e.getId()}"><button class="del">Delete</button></a>
                    <a href="updatePage?id=${e.getId()}"><button class="upd">Update</button></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
 
</body>
</html>