/**
 * 
 */

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
		code +=	`<div class="card">
					<div class="card-header">
						<a class="btn" data-bs-toggle="collapse" href="#collapse${v.num}">
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
								<input type="button" idx="${v.num}" value="수정" name="modify" class="action">
								<input type="button" idx="${v.num}" value="삭제" name="delete" class="action">
							</p>
							<p class="p3">
								${v.content}
							</p>
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