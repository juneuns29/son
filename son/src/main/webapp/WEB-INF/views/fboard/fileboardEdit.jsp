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
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-blue">게시글 수정</h1>
		
		<form method="POST" action="/fboard/writeProc.son" name="frm" id="frm"
			 		class="w3-col w3-padding w3-card-4 w3-light-grey w3-text-blue">
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
		    		<div class="w3-col" id="fileBox">
		    			<input type="file" class="w3-input w3-center w3-text-blue-gray w3-border w3-border-bottom" name="file" id="file1">
		    		</div>
		    		<div class="w3-col w3-center w3-text-blue-gray w3-margin-top" id="files">
		  <c:forEach var="IMG" items="${LIST}">
		    			<img src="${IMG.dir}${IMG.savename}" width="100" height="auto">
		  </c:forEach>
		    		</div>
		    	</div>
			</div>
			
			<div class="w3-row w3-section w3-padding">
				<label for="body" class="w3-col w3-right-align lbl" style="width: 150px;">
					<span class="w3-xxlarge fa fa-file-image-o"></span> 첨부파일 
				</label>
		    	<div class="w3-rest mgt10">
		    		<textarea name="body" id="body" placeholder="글 내용을 작성하세요!" 
		    				class="w3-input w3-border" style="resize: none;" rows="7">${DATA.body}</textarea>
				</div>
			</div>
		</form>
		
		<div class="w3-col">
			<div class="w3-quarter w3-btn w3-section w3-green w3-ripple" id="home">Home</div>
			<div class="w3-quarter w3-btn w3-section w3-blue w3-ripple" id="list">글목록</div>
			<div class="w3-quarter w3-btn w3-section w3-amber w3-ripple" id="write">글등록</div>
			<div class="w3-quarter w3-btn w3-section w3-red w3-ripple" id="delete">글삭제</div>
		</div>
	</div>
</body>
</html>