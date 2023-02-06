<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script  src="http://localhost/jquerypro/js/jquery.serializejson.min.js" type="text/javascript"></script>

<style type="text/css">   
.ziptr:hover{
	background: grey;
}
</style>

<script type="text/javascript">
$(function(){
	
	/* id 데이터 검증 */
	$('#uid').on('keyup', function() {
		// 입력한 id값 가져오기
		idvalue = $('#uid').val().trim();
		
		idreg = /^[a-z][a-z0-9]{3,7}$/;
		
		if(!(idreg.test(idvalue))){
			// 틀린 경우
			$(this).css('border', '2px solid red');
			$('#idcheck').prop('disabled', true);
		}else {
			// 맞은 경우
			$(this).css('border', '2px solid blue');
			$('#idcheck').prop('disabled', false);
		}
		
	})
	
	/* 이름 데이터 검증 */
	$('#uname').on('keyup', function() {
		// 입력한 이름 가져오기
		namevalue = $(this).val().trim();
		
		namereg = /^[가-힣]+|^[a-zA-Z]+$/;
		
		if(namereg.test(namevalue)){
			rkor = /^[가-힣]{2,5}$/;
			reng = /^[a-zA-Z]{5,20}$/;
			
			if(rkor.test(namevalue)){
					// 한글
					$(this).css('border', '2px solid blue');
				}else if(reng.test(namevalue)){
					// 영문
					$(this).css('border', '2px solid blue');
				}else {
					$(this).css('border', '2px solid red');
				}
			}else {
				// 한글, 영문 X
				$(this).css('border', '2px solid red');
			}
		
	})
	
	/* 이메일 검증 */
	$('#umail').on('keyup', function() {
		//입력한 값 가져오기
		mailvalue = $(this).val().trim();
		
		mailreg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/;
		
		
	})
	
	
	/* 전화번호 검증 */
	$('#utel').on('keyup', function() {
		telvalue = $(this).val().trim();
		
		telreg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		//telreg = /^\d{3}-\d{4}-\d{4}$/;
	})
	
	/* 비밀번호 검증 - 영문 대(65-90)소문자(97-122) 숫자(48-57) 특수문자 반드시 포함 */
	// 전방탐색 찾을문자(?=기준문자) 찾을문자가 표현되지 않으면 기준문자는 반드시 포함되어야 한다.
	$('#pwd').on('keyup', function() {
		passvalue = $(this).val().trim();
// 		passreg = /.*(?=[a-z])/
		passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_-]).{10,20}$/;
		
		if(passreg.test(passvalue)){
			$(this).css('border', '2px solid blue');
		}else {
			$(this).css('border', '2px solid red');
		}
		
	})
	
	/* 번호 검색 */
	$('#zipbtn').on('click', function(){
		window.open("zipsearch.jsp", "우편번호찾기", "width=500 height=500 top=100 left=200")
	})
	
	
	/* id중복검사  */
	$('#idcheck').on('click', function(){
		// 입력한 id값 가져오기
		idvalue = $('#uid').val().trim();
		
		if(idvalue.length < 1){
			alert("ID를 입력 하세요.");
			return false;
		}
		
		// 서버로 전송
		$.ajax({
// 			url : '/jquerypro/IDCheck.do', 
// 			url : 'http://localhost/jquerypro/IDCheck.do', 
			url : '<%=request.getContextPath()%>/IDCheck.do',
			type : 'get',
			data : { "id" : idvalue },
			success : function(res){
				//alert(res.sw);
				$('#idres').html(res.sw).css('color', 'red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'
		})
		
	})
	
	
	/* 전송 - 가입하기 */
	// input type=button / button type=button 일 경우
	$('#send').on('click', function(){
// 		alert("hello button");
	// 입력한 모든 값을 다 가져온다.
	// bir, code, add1, add2 아직 안가져옴
	
// 	$('#ubir').val();
// 	$('#uzip').val();
// 	$('#uadd1').val();
// 	$('#uadd2').val();
	
	// 자동으로 입력된 값 가져오기
	formdata1 = $('form').serialize();
	formdata2 = $('form').serializeArray();
	formdata = $('form').serializeJSON();
	
	console.log(formdata);
	
	// 서버로 보내기
	$.ajax({
		url : '<%=request.getContextPath()%>/Insert.do',
		type : 'post',
		data : formdata,
		dataType: 'json',
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		success : function(res){
			alert(res.sw);
		}
		
	})
	
	})
	
	 // input type = submit / button type=submit일 경우 - form태그에서 onsubmit="return false;"
	   $('form').on('submit', function(){
	      //alert("hello submit");
	      
	   })
	   /* 우편번호 모달 띄우기 - 특별한 이벤트 없이 해당버튼에 아래 속성들을 설정한다.  */
	   //data-toggle="modal" data-target="#zipModal"
	   
	   
	   /* 우편번호 모달에서 dong입력 후 확인버튼 클릭시*/
	   $('#searchdong').on('click', function(){
	      //입력한 동을 가져온다.
	      dongvalue = $('#dong').val().trim();
	      
	      if(dongvalue.length < 1){
	         alert("동을 입력하세요");
	         return false;
	      }
	      
	      //서버로 보낸다.
	      $.ajax({
	         url : '<%=request.getContextPath()%>/ZipSearch.do',
	         type : 'Post',
	         data : {"dong" : dongvalue},
	         success : function(res){
	            
	            code = "<table><tr><td>우편번호</td><td>주소</td><td>번지</td></tr>";
	            $.each(res, function(i, v){
	               code += "<tr class='ziptr'><td>" + v.code + "</td>"
	               code += "<td>" + v.addr + "</td>"
	               code += "<td>" + v.bunji + "</td></tr>";
	            })
	            code += "</table>";
	            
	            $('#res').html(code);
	            
	         },
	         error : function(xhr){
	            alert("상태 : " + xhr.status);
	         },
	         dataType : 'json'
	         
	     	 })
	      })
	      	
	      
	      // 동적으로 새롭게 생성된 요소의 이벤트 - delegate
   $(document).on('click', '.ziptr',function() {
      codetext = $('td', this). eq(0).text();
      addrtext = $('td', this). eq(1).text();
      
      $('#uzip').val(codetext);
      $('#uadd1').val(addrtext);
      
      $('#zipModal').modal('hide');
   })// click

   /* 모달 닫기 이벤트 */
   $('#zipModal').on('hide.bs.modal', function(){
	   
	   $('#dong').val("");
	   $('#res').empty();
	   
   })
   
	
}) //$function
</script>

</head>
<body>
<div class="container">
<form class="needs-validation" novalidate onsubmit="return false;">
  <div class="form-group">
    <label for="uid">아이디</label>
    <input type="button" value="중복검사" id="idcheck" class="btn btn-outline-dark btn-sm">
    <span id="idres"></span>
    <input type="text" class="form-control" id="uid" name="mem_id" required>
<!--     <div class="valid-feedback">Valid.</div> -->
<!--     <div class="invalid-feedback">Please fill out this field.</div> -->
  </div>
  
  <div class="form-group">
    <label for="uname">이름</label>
    <input type="text" class="form-control" id="uname" name="mem_name" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="ubir">생년월일</label>
    <input type="date" class="form-control" id="ubir" name="mem_bir" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="pwd">비밀번호</label>
    <input type="password" class="form-control" id="pwd" name="mem_pass" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="utel">전화번호</label>
    <input type="text" class="form-control" id="utel" name="mem_hp" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="umail">이메일</label>
    <input type="text" class="form-control" id="umail" name="mem_mail" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="uzip">우편번호</label>
    <input type="button" value="번호검색" id="zipbtn" class="btn btn-outline-dark btn-sm">
    <input type="button" value="모달검색" class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#zipModal" >
    <input type="text" class="form-control" id="uzip"  name="mem_zip" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="uadd1">주소</label>
    <input type="text" class="form-control" id="uadd1"  name="mem_add1" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="uadd2">상세주소</label>
    <input type="text" class="form-control" id="uadd2" name="mem_add2" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <button type="button" id="send" class="btn btn-primary">확인</button>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>


<!-- The Modal -->
<div class="modal" id="zipModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="box">
         <p>찾고자 하는 동 이름을 입력하세요</p>
			
			<input type="text" id="dong">
			<input type="button" value="확인" id="searchdong">
			<br><br>
			<div id="res"></div>
		</div>
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