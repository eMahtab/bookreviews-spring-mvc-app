<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<style>
body{
background:url("${pageContext.request.contextPath}/images/background.jpg");
}

.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}



nav {
	/* Repeating background image */
	background: url(http://weebtutorials.com/wp-content/uploads/2012/11/a.png);
	width:210px;
	margin:20px;
}

nav ul {
	/* Removes bullet points */
	list-style:none;
	margin:0;
	padding:0;
	
}
nav ul li {
	/* Any child positioned absolutely will be positioned relative to this */
	position:relative;
}
nav a {
	color:#e8e8e8;
	padding:12px 0px;
	/* Fill all available horizontal space */
	display:block;
	/* Remove underline */
	text-decoration:none;
	/* 
	New CSS3 animations:
	apply transition to background property, taking 1s to change it 
	*/
	transition:background 1s;
	-moz-transition:background 1s;
	-webkit-transition:background 1s;
	-o-transition:background 1s;
	font-family:tahoma;
	font-size:13px;
	text-transform:uppercase;
	padding-left:20px;
}
nav a:hover {
	/* 
	RGBA background for transparancy: 
	last number(0.05) is the transparency 
	*/
	background: RGBA(255,255,255,0.05);
	color:#fff;
	
}
nav a:hover span {
	background: #7d2c41;
	transform:rotate(90deg);
	-moz-transform:rotate(90deg);
	-webkit-transform:rotate(90deg);
}
nav ul li:hover ul {
	display:block;
}
nav ul ul {
	position:absolute;
	left:210px;
	top:0;
	border-top:1px solid #e9e9e9;
	display:none;
}
nav ul ul li {
	width:200px;
	background:#f1f1f1;
	border:1px solid #e9e9e9;
	border-top:0;
}
nav ul ul li a {
	color:#a8a8a8;
	font-size:12px;
	text-transform:none;
}
nav ul ul li a:hover {
	color:#929292;
}
nav span {
	width:12px;
	height:12px;
	background:#fff;
	display:inline-block;
	float:left;
	margin-top:3px;
	margin-right:20px;
	position:relative;
	transition:all 0.5s;
	-moz-transition:all 0.5s;
	-o-transition:all 0.5s;
	-webkit-transition:all 0.5s;
}
nav span:before {
	content:"";
	width:12px;
	height:2px;
	background:#3a3b3b;
	position:absolute;
	left:0px;
	top:5px;
}
nav span:after {
	content:"";
	width:2px;
	height:12px;
	background:#3a3b3b;
	position:absolute;
	left:5px;
	position:top;
}

</style>
    <title>
        Login
    </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
.user-icon {
	top:153px; /* Positioning fix for slide-in, got lazy to think up of simpler method. */
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/user-icon.png') no-repeat center;	
}

.pass-icon {
	top:201px;
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/pass-icon.png') no-repeat center;
}


</style>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   <li class='#'><a href='${pageContext.request.contextPath}/findBooks'><span>Search Books</span></a></li>
    <li class=''><a href='#'><span>Feedback</span></a></li>
   <li><a href='#'><span>Contribute</span></a></li>
   <li><a href='#'><span>Contact us</span></a></li>
</ul>
</div>
<br>
<h1 align="center">${logoutMessage}</h1>
<br>
<div style="position:absolute;left:500px;top:25px">
<br><br><br><br><br>
Don`t have an account, click here to <a href='${pageContext.request.contextPath}/register'>Register</a>
<br><font color="red">${message}</font>
</div>

<div id="wrapper">

	<form name="login-form" class="login-form" action="checkLogin" method="post">
	
		<div class="header">
		<h1>Login </h1>
		<span></span>
		</div>
	
		<div class="content">
		<input name="username" type="text" class="input username" placeholder="Username" />
		<div class="user-icon"></div>
		<input name="password" type="password" class="input password" placeholder="Password" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		<input type="submit" name="submit" value="Login" class="button" />
		
		</div>
	
	</form>

</div>
<div class="gradient"></div>


</body>
</html>
