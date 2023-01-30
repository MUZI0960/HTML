<%@page import="kr.or.ddit.lprod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

// 서블릿에서 저장된 결과 꺼내기
ProdVO vo = (ProdVO)request.getAttribute("list");

%>

{
	"id"	: "<%= vo.getProd_id() %>",
	"name"	: "<%= vo.getProd_name() %>",
	"lgu"	: "<%= vo.getProd_lgu() %>",
	"price"	: "<%= vo.getProd_price() %>",
	"sale"	: "<%= vo.getProd_sale() %>",
	"cost"	: "<%= vo.getProd_cost() %>",
	"color" : "<%= vo.getProd_color() %>",
	"buyer" : "<%= vo.getProd_buyer() %>",
	"deliv" : "<%= vo.getProd_delivery() %>"
}
