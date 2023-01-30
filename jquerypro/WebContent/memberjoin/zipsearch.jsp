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
<link rel="stylesheet" href="../css/public.css">
<script src="../js/jquery-3.6.3.min.js" type="text/javascript"></script>
<style type="text/css">
.ziptr:hover{
	background: grey;
	
}
</style>
<script type="text/javascript">
$(function() {
	$('input:button').on('click', function() {
		// 입력한 동 이름을 가져오기
		dongValue = $('#dong').val().trim();
		
		if(dongValue.length < 1){
			alert("동 이름을 입력하세요.");
			return false;
		}
		
		// 서버로 전송
		$.ajax({
// 			url : 'http://localhost/jquerypro/ZipSearch.do',
			url : '<%=request.getContextPath()%>/ZipSearch.do',
			type : 'post',
			data : {"dong" : dongValue },
			success : function(res){
				
				code = "<table border='1' class='table table-striped'><tr><td>우편번호</td><td>주소</td><td>번지</td></tr>";
						
				$.each(res,function(i,v) {
						code += "<tr class='ziptr' ><td>" + v.code + "</td>";
						code += "<td>" + v.addr + "</td>";
						code += "<td>" + v.bunji + "</td></tr>";
						})
				code += "</table>";
				
				$('#res').html(code);
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
		})
		
	})
	
	// 동적으로 새롭게 생성된 요소의 이벤트 - delegate
	$(document).on('click', '.ziptr', function() {
		codetext = $('td', this).eq(0).text();
		addrtext = $('td', this).eq(1).text();
	
		$('#uzip', opener.document).val(codetext);
		$('#uadd1', opener.document).val(addrtext);
		
		window.close();
	})
	
	
})

</script>

</head>
<body>

<div class="box">
	<h1>우편번호 찾기</h1>
	<p>찾고자 하는 동 이름을 입력하세요</p>
	
	<input type="text" id="dong">
	<input type="button" value="확인">
	<br><br>
	<div id="res"></div>
</div>

</body>
</html>