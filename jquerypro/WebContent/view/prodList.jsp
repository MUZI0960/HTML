<%@page import="kr.or.ddit.lprod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 서블릿에서 저장된 결과를 꺼낸다.
List<ProdVO> list = (List<ProdVO>)request.getAttribute("list");
if(list != null && list.size() > 0){
%>
{
	"sw" : "ok",
	"datas": 


	[
	<%
	
	for(int i = 0; i<list.size(); i++){
		ProdVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
	
	{
		"id" : "<%=vo.getProd_id() %>",
		"name" : "<%=vo.getProd_name() %>"
	}
	
	<%
	}
	
	%>
	]
}

<%
}else{
%>
	
	{
	
	"sw" : "no"	
	
	}
	
<%
}
%>

