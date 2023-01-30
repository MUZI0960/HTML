<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

h1 {
	color: red;
}
p{
	font-size: 1.5em;
}
table {
	border: 2px solid pink;
}
td {
	width:  200px;
	height: 50px;
	text-align: center;
}

</style>
</head>
<body>
<h1>JSP : Java Server Page</h1>
<p>클라이언트 요청(전송)시 데이터를 전달 받아서 처리하는 서버프로그램</p>
<p>처리결과를 html태그를 이용하여 응답</p> 

<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String userFile = request.getParameter("file");
	String korea[] = request.getParameterValues("korea");
	
	String res = "";
	for(int i = 0; i<korea.length; i++){
		res += korea[i] + "<br>";
	}
				
	String ameri = request.getParameter("ameri");

%>

<table border="1">

	<tr>
		<td>이름</td>
		<td><%= userName %></td>
	</tr>
	
	<tr>
		<td>파일</td>
		<td><%= userFile %></td>
	</tr>
	
	<tr>
		<td>좋아하는 한식</td>
		<td><%= res %></td>
	</tr>
	
	<tr>
		<td>좋아하는 양식</td>
		<td><%= ameri %></td>
	</tr>
	
</table>

</body>
</html>