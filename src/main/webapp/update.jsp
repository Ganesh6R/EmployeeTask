<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update page</title>
<style>
body{
background:linear-gradient(blue,pink);
background-repeat: no-repeat;
height:97vh;
}
.log{
font-size:20px;
font-style: italic; 
text-shadow:5px 5px 10px red;
color:#D2FF72;
 	display: flex;
    justify-content: center; 
    align-items: center; 
    text-align: center;
}
form{
	background-color:#789DBC;
	margin:0 auto;
	padding:40px;
	font-size:20px;
	width:300px;
	border-radius:10px;
	box-shadow:0px 0px 10px white;
}
input{
margin-left:1em;
height:1.5em;
width:15em;
margin-top:10px;

}
button{
margin:1em 0em 0em 3em;
height:2em;
width:6em;
font-size:15px;
border-radius:10px;
background-color:#F95454;
color:white;
border:none;
}
input::placeholder {
    
    font-style: italic; 
    font-size: 14px; 
    
}
</style>
</head>
<body>
	<div class="log"><h1>Update here</h1></div>
	<form action="update">
	 <label for="id">ID:</label><br>
	<input type="text" value="${e.getId()}" name="id" readonly="readonly" ><br>
	 <label for="name">Name:</label><br>
	<input type="text" value="${e.getName()}" name="name" placeholder="Enter your Name" required><br>
	 <label for="name">Email:</label><br>
    <input type="email" value="${e.getEmail()}" name="email" placeholder="Enter your Email" required><br>
     <label for="name">Password:</label><br>
    <input type="password" value="${e.getPassword()}" name="password" placeholder="Enter your Password" required><br>
     <label for="name">DOB:</label><br>
    <input type="date" value="${e.getDob()}" name="dob" placeholder="Enter your Date of Birth" required><br>
    
    <label for="name">Age:</label><br>
    <input type="number" value="${e.getAge()}" name="age" placeholder="Enter your Age" required><br>
     <label for="name">Salary:</label><br>
    <input type="number" value="${e.getSalary()}" name="salary" placeholder="Enter your Salary" required><br>
     <label for="name">Status:</label>
    <select name="status" class="form-control">
        <option value="true" ${e.getStatus() ? 'selected' : ''}>Active</option>
        <option value="false" ${!e.getStatus() ? 'selected' : ''}>Inactive</option>
    </select><br>
	<button type="submit">Update</button>
	
	</form>
	
	
</body>
</html>