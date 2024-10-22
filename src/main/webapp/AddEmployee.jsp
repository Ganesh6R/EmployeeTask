<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
	margin:1em auto;
	height:400px;
	padding:40px;
	font-size:20px;
	width:200px;
	border-radius:10px;
	box-shadow:0px 0px 10px white;
}
input{
margin-left:1em;
height:2em;
width:13em;
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
<div class="log"><h1>Register the Employee</h1></div>

<form action="save" method="post" >
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br/><br/>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br/><br/>
        
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required ><br/><br/>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" required ><br/><br/>
    
    <label for="salary">Salary:</label>
    <input type="number" id="salary" name="salary" step="0.01" required><br/><br/>

    <label for="status">Status:</label>
    <select id="status" name="status" required>
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
    </select><br/><br/>

     <button type="submit">Register</button>
</form>


</body>
</html>