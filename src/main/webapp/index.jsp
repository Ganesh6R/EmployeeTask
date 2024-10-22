<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body{
background:linear-gradient(blue,pink);
background-repeat: no-repeat;
height:97vh;
}
.log{
font-size:30px;
font-style: italic; 
text-shadow:5px 5px 10px red;
color:#D2FF72;
 	display: flex; /* Enable Flexbox */
    justify-content: center; /* Center items horizontally */
    align-items: center; /* Center items vertically */
    text-align: center;
}
form{
	background-color:#789DBC;
	margin:auto;
	height:200px;
	padding:40px;
	font-size:20px;
	width:200px;
	border-radius:10px;
	box-shadow:0px 0px 10px white;
}
input{
margin-left:1em;
height:2em;
width:10em;
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
<div class="log">
<h2>Login </h2>
</div>
<a href="home">Home</a>


<form action="login" method="post">
 <label for="email">Email:</label>           
 <input type="email"  id="email" placeholder="Enter your email" name="email" required><br/><br/>
 <label for="password">Password:</label>
    <input type="password" id="password" name="password" required ><br/><br/>
  <button type="submit">Login</button>
</form>

</body>
</html>