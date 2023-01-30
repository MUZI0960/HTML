<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//서블릿에서 저장한 데이터 꺼내기
List<ZipVO> list = (List<ZipVO>)request.getAttribute("value");

Gson gson = new Gson();

String result = gson.toJson(list); 	// VO클래스의 속성들을 기준으로 만들어짐

out.print(result);
out.flush(); 	// 청소...

%>