<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/jquery-3.6.3.min.js" type="text/javascript"></script>
<style type="text/css">
.p1{
	float: left;
	width: 70%;
}
.p2{
	float: right;
	width: 25%;
}
.p3{
	clear: both;
}
input[name=reply] {
	height: 50px;
	vertical-align: top;
}
</style>

<script type="text/javascript">
$(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/ListPage.do',
		data : {'page' : 1, 
				'stype' : 'writer', 
				'sword' : '5'
				},
		type : 'post',
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
})
</script>

</head>
<body>

<div class="box"></div>

</body>
</html>