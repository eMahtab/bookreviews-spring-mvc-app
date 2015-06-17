<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<style>
body {
	background:
		url("${pageContext.request.contextPath}/images/background.jpg");
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Details</title>
</head>
<body>
	<div id='cssmenu'>
		<ul>
			<li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
			<li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
			<li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
			<li class='#'><a href='#'><span>Search Books</span></a></li>
			<li class=''><a href='#'><span>Feedback</span></a></li>
			<li><a href='#'><span>Contribute</span></a></li>
			<li><a href='#'><span>Contact us</span></a></li>
		</ul>
	</div>


	<br>
	<br>
	<div align="left">
		<table>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/images/${data.book.bookImageName}.jpg"
					height="330" width="280" /></td>
			</tr>
		</table>
	</div>
	<br><br><br>
	<div >
	<iframe  src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FedurekaIN&amp;width&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;header=false&amp;stream=false&amp;show_border=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:258px;" allowTransparency="true"></iframe>
	</div>
	

	<div style="position: absolute; top: 100px; left: 400px">

		<table>
			<tr>
				<td><p style="align: center; width: 60%;">
					<h1>${data.book.name}</h1>
					</td>
			</tr>
			<br>
		</table>
        <br>

		<c:forEach var="author" items="${data.book.authorsName}">
			<font color="#0B0117"><c:out value="${author}" /></font>
		</c:forEach>
         <br> <br>



		${data.book.published_date}<br><br>
		ISBN : ${data.book.isbn}<br><br>
		Price : ${data.book.price}.00
		
        <br> <br> <br> <br> <br> <br> <br>


		<h1>About The Book</h1>
		<br />
		<c:forEach var="about_book" items="${data.book.about_the_book}">
			<p style="align: justify; width: 60%; margin:">
				<c:out value="${about_book}" />
			</p>
			<br />
			<br />
		</c:forEach>


		<h1>Who This Book Is For</h1><br>
		<p style="align: justify; width: 60%; margin:">
			<c:out value="${data.book.who_this_book_is_for}" />
		</p>
		<br />
		<br />
		
		<h1>Table Of Contents</h1><br>
		<c:forEach var="content" items="${data.book.table_of_contents}"  varStatus="status">
			<font color="#0B0117">${status.count}. <c:out value="${content}" /></font><br><br>
		</c:forEach>
         <br> <br>
         
         <h2>User Reviews</h2><br><br>
         
         <br>
         <c:forEach var="comment" items="${data.comments}">
			 <c:out value="${comment.username}                              " />${comment.posted}
			 ____________________________________________________________________________________________<br>
			<p style="align: justify; width: 60%; margin:"> <c:out value="${comment.comment}"/></p> <br> <br><br> <br>
		</c:forEach>
         <br> 
         
<c:if test='${not empty sessionScope.username}'>
       <h2>Add Your Review</h2><br>
       <form method="post" action="saveComment">
<textarea name="comments" cols="100" rows="5" style="border:solid 1px black;">

</textarea><br><br>
<button type="submit" value="Submit" ><img src="${pageContext.request.contextPath}/images/post.PNG" width="100" height="40" border="0" /></button>
</form>
      <br><br> 
</c:if>

	</div>
</body>
</html>