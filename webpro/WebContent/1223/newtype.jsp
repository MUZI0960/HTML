<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

h1 {
	background-color: pink;
	text-align: center;
}

</style>

</head>
<body>
<h1>JSP : Java Server Page</h1>

<%

	String tel = request.getParameter("tel");
	out.print("전화번호 : " + tel + "<br>");
	
%>

	전화번호 : <%= tel %>

</body>
</html>