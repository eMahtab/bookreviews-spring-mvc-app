<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#table-scroll {
  height:150px;
  overflow:auto;  
  margin-top:20px;
}

</style>
<style>
td {
    padding-top: .5em;
    padding-bottom: .5em;
}

th {
    background-color: green;
    color: white;
}
</style>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">

<script type="text/javascript"
	src="<c:url value="/resources/jquery/1.6/jquery-1.6.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery-ui/jquery-ui-1.8.10.custom.min.js" />"></script>

<style>
body {
	background:
		url("${pageContext.request.contextPath}/images/background.jpg");
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
	background:
		url(http://weebtutorials.com/wp-content/uploads/2012/11/a.png);
	width: 210px;
	margin: 20px;
}

nav ul {
	/* Removes bullet points */
	list-style: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	/* Any child positioned absolutely will be positioned relative to this */
	position: relative;
}

nav a {
	color: #e8e8e8;
	padding: 12px 0px;
	/* Fill all available horizontal space */
	display: block;
	/* Remove underline */
	text-decoration: none;
	/* 
	New CSS3 animations:
	apply transition to background property, taking 1s to change it 
	*/
	transition: background 1s;
	-moz-transition: background 1s;
	-webkit-transition: background 1s;
	-o-transition: background 1s;
	font-family: tahoma;
	font-size: 13px;
	text-transform: uppercase;
	padding-left: 20px;
}

nav a:hover {
	/* 
	RGBA background for transparancy: 
	last number(0.05) is the transparency 
	*/
	background: RGBA(255, 255, 255, 0.05);
	color: #fff;
}

nav a:hover span {
	background: #7d2c41;
	transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-webkit-transform: rotate(90deg);
}

nav ul li:hover ul {
	display: block;
}

nav ul ul {
	position: absolute;
	left: 210px;
	top: 0;
	border-top: 1px solid #e9e9e9;
	display: none;
}

nav ul ul li {
	width: 200px;
	background: #f1f1f1;
	border: 1px solid #e9e9e9;
	border-top: 0;
}

nav ul ul li a {
	color: #a8a8a8;
	font-size: 12px;
	text-transform: none;
}

nav ul ul li a:hover {
	color: #929292;
}

nav span {
	width: 12px;
	height: 12px;
	background: #fff;
	display: inline-block;
	float: left;
	margin-top: 3px;
	margin-right: 20px;
	position: relative;
	transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	-webkit-transition: all 0.5s;
}

nav span:before {
	content: "";
	width: 12px;
	height: 2px;
	background: #3a3b3b;
	position: absolute;
	left: 0px;
	top: 5px;
}

nav span:after {
	content: "";
	width: 2px;
	height: 12px;
	background: #3a3b3b;
	position: absolute;
	left: 5px;
	position: top;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:url var="findStateCitiesURL" value="/loadData" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#term')
								.change(
										function() {
											$
													.getJSON(
															'${findStateCitiesURL}',
															{
																stateName : $(
																		this)
																		.val(),
																ajax : 'true'
															},
															function(data) {
																var html = '<option value="">---Select---</option>';
																var len = data.length;
																for (var i = 0; i < len; i++) {
																	html += '<option value="' + data[i].value + '">'
																			+ data[i].value
																			+ '</option>';
																}
																html += '</option>';

																$('#populate')
																		.html(
																				html);
															});
										});
					});
</script>

<script type="text/javascript">

function submitForm(){
	var form = document.getElementById("s1");
	var a="cacac";
	alert("cvbn");
	form.submit();
}

$(document).ready(function() {
$("#f12").click(function() {
var f=$('#term').val();
var f2=$('#populate').val();
var a = $("<input>").attr("type", "hidden").attr("name", "criteria").val(f);
var b = $("<input>").attr("type", "hidden").attr("name", "term").val(f2);
$("form[name='searchCriteria']").append($(a))
$("form[name='searchCriteria']").append($(b))
$("form[name='searchCriteria']").submit();
});
});

</script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#populate").change(onSelectChange);
	});

	function onSelectChange() {
		var selected = $("#populate option:selected");		
		var output = "";
		if(selected.val() != 0){			
		}
		$("#output").html(output);
		
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<div id='cssmenu'>
		<ul>
			<li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
			<li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
			<li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
			<li class='#'><a
				href='${pageContext.request.contextPath}/findBooks'><span>Search
						Books</span></a></li>
			<li class=''><a href='#'><span>Feedback</span></a></li>
			<li><a href='#'><span>Contribute</span></a></li>
			<li><a href='#'><span>Contact us</span></a></li>
		</ul>
	</div>




	<div style="position: absolute; top: 90px">
		<nav>
		<ul>
			<li class="current"><a
				href='${pageContext.request.contextPath}/allCategory'><span></span>
					All Category </a></li>
			<li><a href="#"><span></span>Programming</a>
				<ul>
					<li class=><a
						href='${pageContext.request.contextPath}/renderBooks?category=java'>Java</a></li>
					<li><a
						href='${pageContext.request.contextPath}/renderBooks?category=ruby'>Ruby</a></li>
					<li><a
						href='${pageContext.request.contextPath}/renderBooks?category=C#'>C#</a></li>
				</ul></li>
			<li><a href="#"><span></span>Databases </a>
				<ul>
					<li><a
						href='${pageContext.request.contextPath}/searchBooks?category=oracle'>Oracle</a></li>
					<li><a
						href='${pageContext.request.contextPath}/searchBooks?category=mysql'>MySQL</a></li>
					<li><a
						href='${pageContext.request.contextPath}/searchBooks?category=mongodb'>MongoDB</a></li>
				</ul></li>
			<li><a href="#"><span></span>Big Data </a>
				<ul>
					<li class="current"><a href="#">Hadoop</a></li>
					<li><a href="#">Cloudera Hadoop</a></li>

				</ul></li>
			<li><a href="#"><span></span>Software Testing </a>
				<ul>
					<li class="current"><a href="#">Selenium</a></li>
					<li><a href="#">QTP</a></li>
					<li><a href="#">IBM RFT</a></li>
				</ul></li>
			<li><a href="#"><span></span>Operating System </a>
				<ul>
					<li class="current"><a href="#">Solaris</a></li>
					<li><a href="#">Linux</a></li>
					<li><a href="#">Ubuntu</a></li>
					<li><a href="#">Linux Mint</a></li>
					<li><a href="#">RedHat 7</a></li>
				</ul></li>
			<li><a href="#"><span></span>Certification </a>
				<ul>
					<li class="current"><a href="#">Vmware vSphere</a></li>
					<li><a href="#">Peoplesoft</a></li>
					<li><a href="#">Oracle Java 7</a></li>
					<li><a href="#">Zend PHP</a></li>

				</ul></li>
			<li><a href="#"><span></span>Networking</a>
				<ul>
					<li class="current"><a href="#">CCNA</a></li>
					<li><a href="#">NetAPP</a></li>

				</ul></li>
			<li><a href="#"><span></span>Security </a>
				<ul>
					<li class="current"><a href="#">OAuth</a></li>
					<li><a href="#">OpenID</a></li>

				</ul></li>
			<li><a href="#"><span></span>Web Development</a>
				<ul>
					<li class="current"><a href="#">Javascript</a></li>
					<li><a href="#">Css</a></li>
					<li><a href="#">jQuery</a></li>
					<li><a href="#">AngularJS</a></li>
				</ul></li>
			<li><a href="#"><span></span>Web Design </a>
				<ul>
					<li class="current"><a href="#">Photoshop</a></li>
					<li><a href="#">Blender</a></li>

				</ul></li>
			<li><a href="#"><span></span>Miscellaneous </a></li>
		</ul>
		</nav>
	</div>

    <h1>${data['az']}</h1>

	<c:forEach var="author" items="${data.writers}">
		<font color="#0B0117"><c:out value="${author}" /></font>
		<br />
	</c:forEach>


	<div style="position: absolute; top: 200px; left: 400px">
		<form name="searchCriteria" id="s1" action="getBooks" method="get">
		<div>
			<fieldset>
				<legend>Select Criteria </legend>
				<br><select id="term"  >
					<option value="">---Search Criteria---</option>
					<option value="author">Author</option>
					<option value="publisher">Publisher</option>
					<option value="category">Category</option>
				</select>

                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                
                <select id="populate" >
					<option value="">--------------------</option>					
				</select>
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                
                 <input type="button"  id="f12" value=" Search Books " style="border: 2px solid;font-weight: bold" >
                 
          </fieldset>
			</div>
		</form>
		
		
		
	</div>
	
	<c:if test='${not empty data}'>
	<div id="table-scroll" style="height:200px;width:800px;position:absolute;left:400px;top:280px">
	<table  style="border-collapse: collapse;border:1px">
	<tr><th>Book Name</th><th>Author</th><th>ISBN</th><th>Published</th><th>Price</th><th>Publisher</th><th>&nbsp;</th></tr>
	<c:forEach var="list" items="${data.list}">
<tr>
<td><c:out value="${list.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><c:out value="${list.authorsName}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><c:out value="${list.isbn}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><c:out value="${list.published_date}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><c:out value="${list.price}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><c:out value="${list.publisher}"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</c:forEach>
</table>
	</div>
	</c:if>


</body>
</html>