<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 서블릿에서 저장한 데이터 꺼내기
String res = (String)request.getAttribute("value"); 		// 저장 후 결과 id
String input = (String)request.getAttribute("inputid");		// 입력한 id
if(res != null){
	%>
	
	{
		"sw" : "<%=res %>님 환영합니다."
	}
	
	<%
	
}else{
	%>
	
	{
		"sw" : "<%=input %>님 가입 실패"
	}
	
	<%
}

%>