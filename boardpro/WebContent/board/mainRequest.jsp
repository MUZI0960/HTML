<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page isELIgnored="false" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/board.js" type="text/javascript"></script>
<script src="../js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
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
#stype{
      width: 10%;    
      margin-left: 100px;
   }
   #sword{
      float : left;
   }
   nav{
      width: 50%;
      margin-left: 40%;
      
   }
.pagination{
	width: 20%;
	float: left;
}
.plist{
	margin-left: 20%;
	
}
#write{
	margin-left: 80%; 
}
</style>

<script type="text/javascript">
currentPage = 1;
$(function() {
	
	// 처음 실행
	listPageServer(1);
	
	// 페이지 번호 클릭 이벤트
	$(document).on('click', '.pagination a.pnum', function(){
		//alert($(this).text().trim());
		currentPage = $(this).text().trim();
		listPageServer(currentPage);
	})
	
	// 이전 버튼 클릭 이벤트
	$(document).on('click', '.prev', function(){
		//alert(parseInt($('a.pnum').first().text().trim()) -1);
		currentPage = parseInt($('a.pnum').first().text().trim()) -1;
		listPageServer(currentPage);
	})
	
	// 다음 버튼 클릭 이벤트
	$(document).on('click', '.next', function(){
		//alert(parseInt($('a.pnum').last().text().trim()) +1);
		currentPage = parseInt($('a.pnum').last().text().trim()) +1;
		listPageServer(currentPage);
	})
	
	// 검색 이벤트
	$('#search').on('click', function() {
		listPageServer(1    );
	})
	
	// 글쓰기 전송 버튼 이벤트
	$('#wsend').on('click', function() {
		// 입력한 모든 값을 가져온다.
		formdata = $('#wform').serialize();
		formdata = $('#wform').serializeArray();
		formdata = $('#wform').serializeJSON();
		
		console.log(formdata);
		
		boardWriteServer();
		
		$('#wModal').modal('hide');
		$('.txt').val("");
	})
	
	// 버튼 클릭 이벤트 - 수정, 삭제, 댓글 등록, 댓글 수정, 댓글 삭제
	$(document).on('click', '.action', function() {
		vaction = $(this).attr('name').trim();
		vidx = $(this).attr('idx').trim();
		
		if(vaction == "modify"){
			alert(vidx + "번 글을 수정합니다.");
			// 수정 버튼 클릭 시 모달 창 띄움 data-bs-toggle="modal" data-bs-target="#mModal"
			
			// 본문의 card에서 해당 값들을 가져와서 모달창에 띄움
			vparents = $(this).parents('.card');
			vparents.find('a').text(); 		// 제목
			vparents.find('bw').text(); 	// 이름
				// 메일
				// 내용
			
		}else if(vaction == "delete"){
			alert(vidx + "번 글을 삭제합니다.");
			
			boardDeleteServer();
			
		}else if (vaction == "reply") {
			alert(vidx + "번 글의 댓글을 작성합니다.");
		}
	})
	
	
	
	// 모달창에서 수정 - 수정 후 전송 버튼 클릭 이벤트
	
		
	
})
</script>

</head>
<body>
<br><br>
<input type="button" data-bs-toggle="modal" data-bs-target="#wModal" value="글쓰기" id="write" class="btn btn-primary" ><br><br>
	
<nav class="navbar navbar-expand-sm navbar-dark">
  	
  	<select class="form-control" id="stype">
  		<option value="">전체</option>
  		<option value="writer">이름</option>
  		<option value="subject">제목</option>
  		<option value="content">내용</option>
  	</select>
  	
      <form class="d-flex">
        <input id="sword" class="form-control me-2" type="text" placeholder="Search">
        <button id="search" class="btn btn-primary" type="button">Search</button>
      </form>
   
</nav>
	
	<div class="box"></div>		<!-- 게시판 리스트 출력 -->
	<br><br><br>
	<div class="plist"></div>	<!-- 페이지 리스트 출력 -->

	
<!-- 글쓰기 Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글쓰기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="wform" name="wform">
        	<label>이름</label>
        	<input type="text" class="txt" name="writer"><br>
        	
        	<label>제목</label>
        	<input type="text" class="txt" name="subject"><br>
        	
        	<label>비밀번호</label>
        	<input type="text" class="txt" name="password"><br>

        	<label>이메일</label>
        	<input type="text" class="txt" name="mail"><br>
        	
        	<label>내용</label>
        	<textarea name="content" class="txt" rows="10" cols="60"></textarea><br>
        	
        	<input type="button" value="전송" id="wsend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<!-- 글수정 Modal -->
<div class="modal" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="mform" name="mform">
        	<label>이름</label>
        	<input type="text" class="txt" name="writer"><br>
        	
        	<label>제목</label>
        	<input type="text" class="txt" name="subject"><br>
        	
        	<label>비밀번호</label>
        	<input type="text" class="txt" name="password"><br>

        	<label>이메일</label>
        	<input type="text" class="txt" name="mail"><br>
        	
        	<label>내용</label>
        	<textarea name="content" class="txt" rows="10" cols="60"></textarea><br>
        	
        	<input type="button" value="전송" id="msend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>