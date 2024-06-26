<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	var fno = 1;
	function getFno(){
		fno += 1;
		return fno;
	}
	
	$(document).ready(function(){
		/*
		// 1. 비동기 통신으로 처리하는 방법
		$('.imgBtn').click(function(){
			// 할일
			// 삭제 처리 확인
			var bool1 = confirm('이미지를 삭제할 까요?');
			if(!bool1){
				return;
			}
			
			// 클릭된 이미지의 파일번호 꺼내온다.
			var sfno = $(this).attr('id').substring(3);
			// 비동기통신 함수 호출
			$.ajax({
				url: '/fboard/fboardDelImg.son',
				type: 'post',
				dataType: 'json',
				data: {
					fno: sfno
				},
				success: function(obj){
					var result = obj.result;
					if(result == 'OK'){
						// 삭제 처리에 성공한 경우
						// 삭제를 요청한 태그를 화면에서 삭제한다.
						$('#img' + sfno).remove();
					} else {
						// 실패한 경우
					}
				},
				error: function(){
					alert('### 서버 통신 에러 ###');
				}
			});
		});
		*/
		
		$('.imgBtn').click(function(){
			if(confirm('이미지를 삭제할까요?')){
				/*
					confirm('메세지')
					==> 컨펌 창을 띄우고
						확인 버튼을 클릭하면 true를
						취소 버튼을 클릭하면 false 를 반환해준다.
				*/
				// 확인 버튼을 클릭한 경우
				// 할일
				// 1. 클릭된 이미지의 이미지번호를 읽는다.
				var imgno = $(this).attr('id').substring(3);
				
				// 중복 처리
				var inolist = $(document.imgFrm.imgnos);
				
				for(var i = 0 ; i < inolist.length ; i++ ){
					if(inolist.eq(i).val() == imgno){
						// 중복된 이미지가 선택된 경우
						alert('이미 추가된 이미지 입니다.');
						return;
					}
				}
				//$('#imgFrm').append('<input type="hidden" name="imgnos" id="del' + imgno + '" value="' + imgno + '">');
				var el = document.createElement('input');
				$(el).attr('type', 'hidden');
				$(el).attr('id', 'del' + imgno);
				$(el).attr('name', 'imgnos');
				$(el).val(imgno);
				
				// 메모리에 만들어둔 태그를 #imgFrm 에 추가한다.
				$('#imgFrm').append(el);
				
				// 추가된 태그 갯수 꺼내고
				var qt = $(document.imgFrm.imgnos).length;
				// 추가된 갯수 쓰고
				$('#qt').html(qt);
				// 버튼 태그 보여주고
				if(qt != 0){
					$('#delfiles').removeClass('w3-hide');
				}
			}
		});
		
		// 이미지 삭제 이벤트 등록
		$('#delImgBtn').click(function(){
			// form 태그 전송
			$('#imgFrm').submit();
		});
		
		
		// home 버튼 클릭이벤트
		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		// list 버튼 클릭이벤트
		$('#list').click(function(){
			// imgFrm 태그의 action 속성값 변경하고
			$('#imgFrm').attr('action', '/fboard/fileboard.son');
			// 폼태그 전송하고
			$('#imgFrm').submit();
		});
		
		// 파일 선택 이벤트 처리
		$('#fileBox').on('change', document.frm.file, function(evt){
			var filename = evt.target.value;
			var tid = evt.target.id;
			var old_no = tid.substring(3);
			
			// 선택된 이미지  URL 꺼내기
			var imgPath = '';
			
			var last_id = $('#fileBox > input').first().attr('id');
			
			if(!filename){
				if(tid != last_id){
					$('#'+tid).remove();
					$('#imgFr'+old_no).remove();
				}
			} else {
				imgPath = URL.createObjectURL(evt.target.files[0]);
				if(tid == last_id){
					// 마지막 태그에서 파일을 선택한 경우
					var tno = getFno();
					var el1 = document.createElement('input');
					$(el1).attr('type', 'file');
					$(el1).attr('id', 'file' + tno);
					$(el1).attr('name', 'file');
					$(el1).addClass('w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom mgt10');
					
					$('#fileBox').prepend(el1);
					
					var imgEl = document.createElement('img');
					$(imgEl).attr('id', 'img' + old_no);
					$(imgEl).attr('width', '100');
					$(imgEl).attr('height', 'auto');
					$(imgEl).attr('src', imgPath);
					$(imgEl).addClass('w3-display-middle');
					
					var imgFr = document.createElement('div');
					$(imgFr).addClass('w3-display-container inblock imgBox100 w3-border mgw10');
					
					$(imgFr).append(imgEl);
					$(imgFr).attr('id', 'imgFr' + old_no);
					
					$('#imgBox').append(imgFr);
				} else {
					// 마지막이 아닌태그들이 변경되는 경우
					$('#img' + old_no).attr('src', imgPath);
				}
			}
			
		});
		
		$('#edit').click(function(){
			// 할일
			// 입력태그의 내용을 읽어온다.
			var oldTitle = $('#oldTitle').val();
			var oldBody = $('#oldBody').val();
			
			var newTitle = $('#title').val();
			var newBody = $('#body').val();
			
			if(newTitle == oldTitle){
				$('#title').prop('disabled', true);
			}
			
			if(newBody == oldBody){
				$('#body').prop('disabled', true);
			}
			
			$('[type="file"]').first().prop('disabled', true);
			
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<div class="w3-hide">
		<input type="hidden" id="oldTitle" value="${DATA.title}">
		<textarea id="oldBody">${DATA.body}</textarea>
	</div>
	<!-- 이미지 번호 전송용 폼태그 -->
	<form method="post" action="/fboard/delImgList.son" name="imgFrm" id="imgFrm">
		<input type="hidden" name="bno" value="${DATA.bno}">
		<input type="hidden" name="nowPage" value="${nowPage}">
	</form>
	
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-blue">게시글 수정</h1>
		
		<form method="POST" action="/fboard/editProc.son" name="frm" id="frm" enctype="multipart/form-data"
			 		class="w3-col w3-padding w3-card-4 w3-light-grey w3-text-blue">
			<input type="hidden" name="bno" value="${DATA.bno}">
			<input type="hidden" name="nowPage" value="${nowPage}">
			
			<div class="w3-row w3-section w3-padding">
				<label class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-user"></span> 작성자
				</label>
		    	<div class="w3-rest mgt10">
		    		<input type="text" name="id" id="id" value="${DATA.id}" disabled
		    				 class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom">
		    	</div>
			</div>
			<div class="w3-row w3-section w3-padding">
				<label for="title" class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-tag"></span> 제 목 
				</label>
		    	<div class="w3-rest mgt10">
		    		<input type="text" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom" name="title" id="title" value="${DATA.title}">
		    	</div>
			</div>
			<div class="w3-row w3-section w3-padding">
				<label class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-file-image-o"></span> 첨부파일 
				</label>
		    	<div class="w3-rest mgt10">
		    		<div class="w3-col mgt20 w3-center" id="imgBox">
			    	</div>
		    		<div class="w3-col" id="fileBox">
		    			<input type="file" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom w3-margin-bottom mgt10" name="file" id="file1">
		    		</div>
		    		<div class="w3-col w3-center w3-text-blue-gray w3-margin-top w3-border-top pdh10" id="files">
		  <c:forEach var="IMG" items="${LIST}">
		  				<div class="w3-display-container inblock imgBox100 w3-border mgw10 w3-btn imgBtn" id="img${IMG.fno}">
		    				<img src="${IMG.dir}${IMG.savename}" width="100" height="auto"
		    						class="w3-display-middle">
		  				</div>
		  </c:forEach>
		    		</div>
		    		
		    		<div class="w3-col w3-hide" id="delfiles">
		    			<div class="w3-col w3-btn w3-orange" id="delImgBtn"><span id="qt"></span> 개 이미지 삭제</div>
		    		</div>
		    	</div>
			</div>
			
			<div class="w3-row w3-section w3-padding">
				<label for="body" class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-file-image-o"></span>글 내 용 
				</label>
		    	<div class="w3-rest mgt10">
		    		<textarea name="body" id="body" placeholder="글 내용을 작성하세요!" 
		    				class="w3-input w3-border" style="resize: none;" rows="7">${DATA.body}</textarea>
				</div>
			</div>
		</form>
		
		<div class="w3-col">
			<div class="w3-third w3-btn w3-section w3-green w3-ripple" id="home">Home</div>
			<div class="w3-third w3-btn w3-section w3-blue w3-ripple" id="list">글목록</div>
			<div class="w3-third w3-btn w3-section w3-amber w3-ripple" id="edit">글수정</div>
		</div>
	</div>
</body>
</html>