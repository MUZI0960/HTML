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
.reply-body{
	border: 1px dotted pink;
	background: #FFFAFA;
	padding: 10px;
	margin: 3px;
}

#modifyForm{
	display: none;
}

</style>

<script type="text/javascript">
currentPage = 1;
$(function() {
	
// 	$('#modifyForm').css('display', 'none');
// 	$('#modifyForm').hide();
	
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
		listPageServer(1);
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
	
	// 버튼 클릭 이벤트 - 수정, 삭제, 댓글 등록, 댓글 수정, 댓글 삭제, 제목 클릭
	$(document).on('click', '.action', function(){
		vaction = $(this).attr('name').trim();
		vidx = $(this).attr('idx').trim();
		
		if(vaction == "modify"){
			alert(vidx + "번 글을 수정합니다.");
			// 수정 버튼 클릭 시 모달 창 띄움 data-bs-toggle="modal" data-bs-target="#mModal"
			
			// 본문의 card에서 해당 값들을 가져와서 모달창에 띄움
			vparents = $(this).parents('.card');
			
			va = vparents.find('a').text().trim(); 		// 제목
			vw = vparents.find('.bw').text().trim(); 	// 이름
			vm = vparents.find('.bm').text().trim();	// 메일
			vp = vparents.find('.p3').html();			// 내용 - <br> 태그 들어있음.
			vp = vp.replaceAll(/<br>/g, "\n");
			console.log(va, vw, vm);
			
			$('#mform #num').val(vidx);

			$('#mform #subject').val(va);
			$('#mform #mail').val(vm);
			$('#mform #content').val(vp);
			
			$('#mform #writer').prop('disabled', true);
			$('#mform #writer').attr('disabled', 'disabled');
			
			
		}else if(vaction == "delete"){
			alert(vidx + "번 글을 삭제합니다.");
			
			boardDeleteServer();
			
		}else if (vaction == "reply") {
			alert(vidx + "번 글의 댓글을 작성합니다.");
			
			// 입력한 내용 (textarea), name(random), bonum
			reply = { };
			reply.cont = $(this).prev().val();
			reply.bonum = vidx;
			name1 = String.fromCharCode(parseInt(Math.random()*26 + 65));
			name2 = String.fromCharCode(parseInt(Math.random()*26 + 97));
			name3 = parseInt(Math.random()*100 + 1);
			
			reply.name = name1 + name2 + name3;
			
			replyInsertServer();
			$(this).prev().val("");
			
			gthis = this;
			
		}else if (vaction == "r_delete") {
			//alert(vidx + "번 댓글을 삭제합니다.");
			replyDeleteServer(this);
			
		}else if (vaction == "r_modify") {
			alert(vidx + "번 댓글을 수정합니다.");
			
			// 원본 내용 가져오기
			vcont = $(this).parents('.reply-body').find('.p3').html(); // br태그가 포함
			
			// br 태그를 \n으로 변경
			vmcont = vcont.replaceAll(/<br>/g, "\n");
			
			// modifyForm
			$('#modifyForm textarea').val(vmcont);
			
			$(this).parents('.reply-body').find('.p3').empty().append($('#modifyForm'));
			$('#modifyForm').show();
			
		}else if (vaction == "title") {
			//alert(vidx + "번 내용과 댓글을 보여줍니다.");
			
			gthis = this;
			replyListServer();
			
			// 조회수 증가
			vattr = $(this).attr("aria-expanded");
			if(vattr == "true"){
				alert(vidx+"조회수 증가");
				hitUpdateServer();
			}
			
		}
	})
	
	
	
	// 모달창에서 수정 - 수정 후 전송 버튼 클릭 이벤트
	$('#msend').on('click', function(){
		
		// 모든 입력한 값을 가져온다
		formdata = $('#mform').serializeJSON();
		
		// DB수정 - 화면 수정
		boardModifyServer();
		
		// 모달창 닫기, 모달창 값 지우기
		$('#mModal').modal('hide');
		$('#mform .txt').val("");
	})
	
	// 댓글 수정에서 취소버튼 클릭 이벤트
	$('#btncancel').on('click', function(){
		//p3를 검색
		vp3 = $(this).parents('.p3');
		//vp3 = $('#modifyForm').parent();
		
		// modifyForm을 body로 이동
		$('#modifyForm').appendTo('body');
		$('#modifyForm').hide();
		
		// 원래 내용을 p3에 출력
		$(vp3).html(vcont);
	})
	
	// 댓글 수정에서 확인버튼 클릭 이벤트
	$('#btnok').on('click', function(){
		
		// 수정내용 가져오기 - 엔터가 포함
		modicont = $(this).parents('.p3').find('textarea').val().trim();
		
		// p3을 검색
		vp3 = $(this).parents('.p3');
		
		// modifyForm을 body로 이동
		$('#modifyForm').appendTo('body');
		$('#modifyForm').hide();
		
		// 화면 수정 - <br> 태그로 변경
		vmodicont = modicont.replaceAll(/\n/g, "<br>");
		//vp3.html(vmodicont);
		
		// db를 수정 - db 수정 후 성공 시 화면 수정
		replyUpdate();		
				
		
	})
	
})
</script>

</head>
<body>
<br><br>

<form id="modifyForm">
	<textarea id="area" rows="5" cols="60"></textarea>
	<input id="btnok" type="button" value="확인">
	<input id="btncancel" type="button" value="취소">
</form>

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
        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
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
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="mform" name="mform">
        	<label>이름</label>
        	<input type="text" id="writer" class="txt" name="writer"><br>
        	
        	<input type="hidden" class="txt" id="num" name="num">
        	
        	<label>제목</label>
        	<input type="text" id="subject" class="txt" name="subject"><br>
        	
        	<label>비밀번호</label>
        	<input type="text" id="password" class="txt" name="password"><br>

        	<label>이메일</label>
        	<input type="text" id="mail" class="txt" name="mail"><br>
        	
        	<label>내용</label>
        	<textarea name="content" id="content" class="txt" rows="10" cols="60"></textarea><br>
        	
        	<input type="button" value="전송" id="msend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>