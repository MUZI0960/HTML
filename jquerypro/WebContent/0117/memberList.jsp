<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// controller ----------
// 클라이언트 전송 시 데이터를 받는다.

// 데이터를 바탕으로 db처리 한다. - SqlMapClient객체가 필요
	SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
	
// db처리의 결과를 가지고 응답 데이터를 생성한다. - (현재) json object 배열 데이터
	List<MemberVO> list = client.queryForList("member.selectAll");
	
	
%>

<%-- view --%>
[
<% 
	for(int i = 0; i<list.size(); i++){
		MemberVO vo = list.get(i);
		if(i > 0) out.print(",");
%>	
	
		{
			"id"	: "<%= vo.getMem_id() %>",
			"name"	: "<%= vo.getMem_name() %>",
			"bir"	: "<%= vo.getMem_bir() %>",
			"hp"	: "<%= vo.getMem_hp() %>",
			"mail"	: "<%= vo.getMem_mail() %>",
			"add1"	: "<%= vo.getMem_add1()  %>",
			"add2"	: "<%= vo.getMem_add2()  %>",
			"zip"	: "<%= vo.getMem_zip() %>"
		}
	
<%	
	}
%>
]