<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 서블릿에서 저장한 데이터 꺼내기
String res = (String)request.getAttribute("value");
if(res !=null){
%>
	
	{
		"sw" : "사용 불가능 id"
	}
	
	
<%}else{ 	%>
	
	{
		"sw" : "사용 가능 id"
	}
	
<%
}
%>