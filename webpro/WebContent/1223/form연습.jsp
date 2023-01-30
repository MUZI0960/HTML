<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP : Java Server Page</h1>
<%

request.setCharacterEncoding("UTF-8");
String userName = request.getParameter("name");
String userAddr = request.getParameter("addr");
String userEmail = request.getParameter("email");
String userMale = request.getParameter("Male");
String userFemale = request.getParameter("Female");
String userText = request.getParameter("text");

%>

<table border="1">

	<tr>
		<td>이름</td>
		<td><%= userName %></td>
	</tr>

	<tr>
		<td>주소</td>
		<td><%= userAddr %></td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td><%= userName %></td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td><%= userText %></td>
	</tr>
	
</table>


</body>
</html>