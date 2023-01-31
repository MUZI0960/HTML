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
/* #stype{ */
/* 	width: 10%; */
/* 	margin-left: 100%; */
/* } */
/* #sword{ */
/* 	float: left; */
/* } */
/* nav{ */
/* 	width: 20%; */
/* 	margin-left: 40%; */
/* 	margin-top: 100px; */
/* } */
</style>

<script type="text/javascript">
$(function() {
	
	stype = $('#stype option:selected').val();
	sword = $('#sword').val().trim();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/ListPage.do',
		data : {'page' : 1, 
				'stype' : stype, 
				'sword' : sword
				},
		type : 'post',
		success : function(res){
			code = `<div class="container mt-3"><div id="accordion">`
				$.each(res.datas, function(i, v) {
		code +=	`<div class="card">
					<div class="card-header">
						<a class="btn" data-bs-toggle="collapse" href="#collapse\${v.num}">
							\${v.subject} </a>
					</div>
					<div id="collapse\${v.num}" class="collapse">
						<div class="card-body">
							<p class="p1">
								작성자<span class="bw">\${v.writer}</span>&nbsp;&nbsp;&nbsp; 
								이메일<span class="bm">\${v.mail}</span>&nbsp;&nbsp;&nbsp;
								조회수<span class="bh">\${v.hit}</span>&nbsp;&nbsp;&nbsp; 
								날짜<span class="bd">\${v.wdate}</span>
							</p>
							<p class="p2">
								<input type="button" idx="\${v.num}" value="수정" name="modify" class="action">
								<input type="button" idx="\${v.num}" value="삭제" name="delete" class="action">
							</p>
							<p class="p3">
								${v.content}
							</p>
							<p class="p4">
								<textarea rows="" cols="60"></textarea>
								<input type="button" idx="\${v.num}" value="등록" name="reply" class="action">
							</p>
						</div>
					</div>
				</div>`
				
				})
				
				code += `</div>
					</div>`
			
				  	
			$('.box').html(code);	  
			
			// 이전 출력
			if(res.sp > 1){
				pager = `<ul class="pagination">
				  			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<ul>`
			}
			// 페이지 출력		
			
			// 다음 출력
			if(res.ep < res.tp){
				pager += `<ul class="pagination">
		  			<li class="page-item"><a class="page-link" href="#">Next</a></li>
				<ul>`
			}	  	
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
	
<nav class="navbar navbar-expand-sm navbar-dark">
  	
  	<select class="form-control" id="stype">
  		<option value="">전체</option>
  		<option value="writer">이름</option>
  		<option value="subject">제목</option>
  		<option value="content">내용</option>
  	</select>
  	
      <form class="d-flex">
        <input id="sword" class="form-control me-2" type="text" placeholder="Search">
        <button class="btn btn-primary" type="button">Search</button>
      </form>
   
</nav>
	
	<div class="box"></div>
	<div class="plist"></div>

</body>
</html>