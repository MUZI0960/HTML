<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table {
	border: 1px solid blue;
}
td {
	width: 300px;
	height: 50px;
	text-align: center;
}
</style>

    <% 
    request.setCharacterEncoding("utf-8");
    
    String userId = request.getParameter("id");
    String userName = request.getParameter("name");
    
    // db연결해서 crud 처리
    // 처리결과를 가지고 응답 데이터를 생성
    
    %>
    
    <table border="1">
    	
    	<tr>
    		<td>아이디</td>
    		<td><%= userId %></td>
    	</tr>
    	
    	<tr>
    		<td>이름</td>
    		<td><%= userName %></td>
    	</tr>
    
    </table>