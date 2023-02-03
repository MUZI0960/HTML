/**
 * 
 */

replyDeleteServer = function(but){ 	// but : 댓글 삭제 버튼
	
	$.ajax({
		url : 'http://localhost/boardpro/ReplyDelete.do',
		data : {"renum" : vidx}, 
		type : 'post',
		success : function(res){
			// 성공 시 - 화면 삭제
			if(res.flag == "성공"){
				// 댓글삭제 버튼을 기준으로 조상(.reply-body)를 찾아서 지운다
				$(but).parents('.reply-body').remove();
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
		
	})
}

replyListServer = function(){
	
	$.ajax({
		url : 'http://localhost/boardpro/ReplyList.do',
		data : {"bonum" : vidx}, // data : {"bonum" : reply.bonum}
		type : 'post',
		success : function(res){
			rcode = "";
			
			$.each(res, function(i, v){
				
				cont = v.cont;
				cont = cont.replaceAll(/\n/g, "<br>");
				
				rcode += `<div class="reply-body">
								<p class="p1">
									작성자<span class="bw">${v.name}</span>&nbsp;&nbsp;&nbsp; 
									날짜<span class="bd">${v.redate}</span>
								</p>
								<p class="p2">
									<input type="button" idx="${v.renum}" value="댓글수정" name="r_modify" class="action">
									<input type="button" idx="${v.renum}" value="댓글삭제" name="r_delete" class="action">
								</p>
								<p class="p3">${cont}</p>
							</div>`	
				
			})
			
			// 출력
			// 클릭한 등록버튼 또는 제목을 기준으로 card-body를 검색하여 rcode(reply-body)를 추가
			$(gthis).parents('.card').find('.reply-body').remove();
			
			$(gthis).parents('.card').find('.card-body').append(rcode);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}

replyInsertServer = function(){
	
	$.ajax({
		url : 'http://localhost/boardpro/ReplyInsert.do',
		data : reply, /* name, bonum, cont */
		type : 'post',
		success : function(res){
			alert(res.flag);
			
			// 성공 시 화면에 댓글을 출력
			replyListServer(); 
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
	
}

boardModifyServer = function(){
	
	$.ajax({
		url : 'http://localhost/boardpro/BoardModify.do',
		data : formdata, /* writer, mail, subject, content */
		type : 'post',
		success : function(res){
			alert(res.flag);
			if(res.flag == "성공"){
				// 본문 수정 - modal창의 내용으로  (formdata)
				vparents.find('a').text(formdata.subject); 	// 제목
				vparents.find('.bm').text(formdata.mail);	// 메일
				
				vp3 = vparents.find('.p3').html();	// 내용 - <\r\n> 태그 들어있음. -> <br>태그로 변환
				vp3 = vp3.replaceAll(/\n/g, "<br>");
				
				vparents.find('.p3').html(vp3); 	// 내용
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}

boardDeleteServer = function(){
	
	$.ajax({
		url : 'http://localhost/boardpro/BoardDelete.do',
		data : { "num" : vidx },
		type : 'get',
		success : function(res){
			// 성공 시 - listPageServer(currentPage)
			
			//alert(res.flag);
			if(res.flag == "성공"){
				listPageServer(currentPage);
				//currentPage = res.tp;
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}


boardWriteServer = function(){
	$.ajax({
		url : 'http://localhost/boardpro/BoardWrite.do',
		data : formdata,
		type : 'post',
		success : function(res){
			// 저장 성공 시 - listPageServer
			//alert(res.flag);
			if(res.flag=="성공"){
				listPageServer(1);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}

listPageServer = function(vpage){
	stype = $('#stype option:selected').val();
	sword = $('#sword').val().trim();
	
	$.ajax({
//		url : '<%=request.getContextPath()%>/ListPage.do',
		url : 'http://localhost/boardpro/ListPage.do',
		data : {'page' : vpage, 
				'stype' : stype, 
				'sword' : sword
				},
		type : 'post',
		success : function(res){
			code = `<div class="container mt-3"><div id="accordion">`
			$.each(res.datas, function(i, v) {
				
				content = v.content;
				content = content.replaceAll(/\n/g, "<br>");		
					
			code +=	`<div class="card">
					<div class="card-header">
						<a class="btn action" name="title" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">
							${v.subject} </a>
					</div>
					<div id="collapse${v.num}" class="collapse">
						<div class="card-body">
							<p class="p1">
								작성자<span class="bw">${v.writer}</span>&nbsp;&nbsp;&nbsp; 
								이메일<span class="bm">${v.mail}</span>&nbsp;&nbsp;&nbsp;
								조회수<span class="bh">${v.hit}</span>&nbsp;&nbsp;&nbsp; 
								날짜<span class="bd">${v.wdate}</span>
							</p>
							<p class="p2">
								<input type="button" idx="${v.num}" data-bs-toggle="modal" data-bs-target="#mModal" value="수정" name="modify" class="action">
								<input type="button" idx="${v.num}" value="삭제" name="delete" class="action">
							</p>
							<p class="p3">${content}</p>
							<p class="p4">
								<textarea rows="" cols="60"></textarea>
								<input type="button" idx="${v.num}" value="등록" name="reply" class="action">
							</p>
						</div>
					</div>
				</div>`
				
				})
				
				code += `</div>
					</div>`
			
				  	
			$('.box').html(code);	  
			
			// 이전 출력
			pager = "";
			if(res.sp > 1){
				pager += `<ul class="pagination">
				  			<li class="page-item"><a class="page-link prev" href="#">Previous</a></li>
						</ul>`
			}
			// 페이지 출력		
			//currentPage = res.tp;
			if(vpage > res.tp) currentPage = res.tp;
			
			pager += `<ul class="pagination">`;
			for(i=res.sp; i<=res.ep; i++){
				if(i == currentPage){
					pager += `<li class="page-item active"><a class="page-link pnum" href="#">${i}</a></li>`;
				}else {
					pager += `<li class="page-item"><a class="page-link pnum" href="#">${i}</a></li>`;
				}
			}
			pager += `</ul>`
			
			// 다음 출력
			if(res.ep < res.tp){
				pager += `<ul class="pagination">
		  			<li class="page-item"><a class="page-link next" href="#">Next</a></li>
				</ul>`
			}
			
			$('.plist').html(pager);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}	/* listPage */