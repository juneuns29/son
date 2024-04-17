<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
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
		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		
		$('#write').click(function(){
			// 데이터 유효성 검사
			var sid = $('#id').val();
			if(!sid){
				$('#id').focus();
				return;
			}
			var title = $('#title').val();
			if(!title){
				$('#title').focus();
				return;
			}
			var body = $('#body').val();
			if(!body){
				$('#body').focus();
				return;
			}
			
			for(var i = 0 ; i < $(document.frm.file).length ; i++ ){
				var sfile = $(document.frm.file).eq(i).val();
				if(!sfile){
					$(document.frm.file).eq(i).prop('disabled', true);
				}
			}
			
			$('#frm').submit();
		});
		
		$('#list').click(function(){
			$(location).attr('href', '/fboard/fileboard.son');
		});
		
		/*
		function addTag(e1){
			var sfile = $(e1).val();
			
			if(sfile){
				var tno = getFno();
				$('#fileBox').append(
					'<input type="file" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom" name="file" id="file'+ tno +'">'
				);
				
				$('#file' + tno).change(function(){
					addTag($('#file' + tno));
				});
			} else {
				var len = $('#fileBox > input').length;
				if($(e1) != $('#fileBox > input').eq(len - 1)){
					var tlist = $('#fileBox > input');
					$(e1).remove();
				}
			}
		}
		
		$('#file1').change(function(){
			addTag(this);
		})
		*/
		
		$('#fileBox').on('change', document.frm.file, function(evt){
			var filename = evt.target.value;
			var tid = evt.target.id;
			var old_no = tid.substring(3);
			
			var last_id= $('#fileBox > input').last().attr('id');
			
			if(!filename){
				if(tid != last_id){
					$('#'+tid).remove();
					$('#img'+old_no).remove();
				}
			} else {
				if(tid == last_id){
					// 마지막 태그에서 파일을 선택한 경우
					var tno = getFno();
					var el1 = document.createElement('input');
					$(el1).attr('type', 'file');
					$(el1).attr('id', 'file' + tno);
					$(el1).attr('name', 'file');
					$(el1).addClass('w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom mgt10');
					
					$('#fileBox').append(el1);
					
					var imgEl = document.createElement('img');
					$(imgEl).attr('id', 'img' + old_no);
				} else {
					// 마지막이 아닌태그들이 변경되는 경우
				}
			}
			
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-blue">Write</h1>
		
		<form method="POST" action="/fboard/writeProc.son" name="frm" id="frm" enctype="multipart/form-data"
			 		class="w3-col w3-padding w3-card-4 w3-light-grey w3-text-blue">
			<div class="w3-row w3-section w3-padding">
				<label class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-user"></span> 작성자
				</label>
		    	<div class="w3-rest mgt10">
		    		<input type="text" name="id" id="id" value="${SID}" readonly
		    				 class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom">
		    	</div>
			</div>
			<div class="w3-row w3-section w3-padding">
				<label for="title" class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-tag"></span> 제 목 
				</label>
		    	<div class="w3-rest mgt10">
		    		<input type="text" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom" name="title" id="title">
		    	</div>
			</div>
			<div class="w3-row w3-section w3-padding">
				<label class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-file-image-o"></span> 첨부파일 
				</label>
				<div class="w3-rest mgt10">
			    	<div class="w3-col mgt10" id="fileBox">
			    		<input type="file" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom" name="file" id="file1">
			    	</div>
			    	<div class="w3-col mgt20" id="imgBox">
			    	</div>
				</div>
			</div>
			
			<div class="w3-row w3-section w3-padding">
				<label for="body" class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-file-image-o"></span>글내용 
				</label>
		    	<div class="w3-rest mgt10">
		    		<textarea name="body" id="body" placeholder="글 내용을 작성하세요!" 
		    				class="w3-input w3-border" style="resize: none;" rows="7"></textarea>
				</div>
			</div>
		</form>
			
			
		<div class="w3-col">
			<div class="w3-third w3-btn w3-section w3-green w3-ripple" id="home">Home</div>
			<div class="w3-third w3-btn w3-section w3-blue w3-ripple" id="list">글목록</div>
			<div class="w3-third w3-btn w3-section w3-amber w3-ripple" id="write">글등록</div>
		</div>
	</div>
</body>
</html>