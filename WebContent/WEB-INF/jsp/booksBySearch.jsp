<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring pagination using data tables</title>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	//Plug-in to fetch page data

	$(document).ready(function() {

		$("#example").dataTable({
				"bProcessing": true,
		        "bServerSide": true	,
		        "sAjaxSource": "searchBooks",
		        "iDisplayLength": 10,
		        "aoColumns": [
		                      { "mData": "name" },
		                      { "mData": "price" },
		                      { "mData": "isbn" },	                   
		                       
		                  ]	        
		 }	
		);
	});
</script>
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
<br><Br>
<h2 align="center">Populating Books Data using Pagination</h2><br><br>
	<form:form action="" method="GET">

	 	<!--  <table width="50%" height="10%"
			style="border: 3px;top:50px;left:100px; background: rgb(243, 244, 248);">  -->
			<table style="position:absolute;width:900px;left:250px;background: rgb(243, 244, 248);">
			<tr>
				<td>

					<table id="example" class="display" cellspacing="0"  width="100%">
						<thead>
							<tr>
								<th>Name</th>
								<th>Price</th>
								<th>ISBN</th>

							</tr>
						</thead>
						
					</table>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>