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
</style>

</head>
<body>
<h1>JSP : Java Server Page</h1>
<%
	int qty =Integer.parseInt( request.getParameter("qty") ); // name과 일치해야함
	int price = Integer.parseInt( request.getParameter("price") );
	
	String code = request.getParameter("code");
	
	int result = qty * price;
	
%>
<h3>결과</h3>
코드 : <%= code %><br>
수량 : <%= qty %><br>
가격 : <%= price %><br>
결과 : <%= result %>
</body>
</html>