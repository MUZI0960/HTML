<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 서블릿에서 저장한 데이터 꺼내기
int res = (Integer)request.getAttribute("result");
if(res > 0) {
	%>
	
	{
	
	"flag" : "성공"
	
	}
	
	<%
}else{
	
	%>
	
	"flag" : "실패"
	
	<%
	
}

%>