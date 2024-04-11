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
	$(document).ready(function(){

		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		
		$('#edit').click(function(){
			$('#frm').submit();
		});
		
		$('#list').click(function(){
			// frm의 action 속성값을 변경한다.
			$('#frm').attr('action', '/fboard/fileboard.son');
			// 글번호는 리스트뷰에서 필요없으므로 전송하지 않게 처리
			$('#bno').prop('disabled', true);
			// 폼태그 전송
			$('#frm').submit();
		});
		
	});
</script>
</head>
<body>

	<form method="POST" action="/fboard/fboardEdit.son" name="frm" id="frm">
		<input type="hidden" name="bno" id="bno" value="${DATA.bno}">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
	</form>
	
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-blue">파일게시글 내용</h1>
		
		<div class="w3-col w3-padding w3-card-4 w3-light-grey w3-text-blue">
			<h2 class="w3-center w3-blue w3-border-bottom" id="title">${DATA.title}</h2>
			 
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-user"></span> 작성자 </h3>
		    	<h3 class="w3-rest w3-center w3-text-blue-gray w3-border-bottom" id="writer">${DATA.id}</h3>
			</div>
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-calendar-o"></span> 작성일 </h3>
		    	<h3 class="w3-rest w3-center w3-text-blue-gray w3-border-bottom" id="wdate">${DATA.sdate}</h3>
			</div>
			
<c:if test="${not empty LIST}">
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-file-image-o"></span> 첨부파일 </h3>
		    	<div class="w3-rest w3-center w3-text-blue-gray" id="files">
		  <c:forEach var="IMG" items="${LIST}">
		    		<img src="${IMG.dir}${IMG.savename}" width="100" height="auto">
		  </c:forEach>
		    	</div>
			</div>
</c:if>
			
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-calendar-o"></span> 글내용 </h3>
		    	<div class="w3-rest w3-padding w3-text-blue-gray w3-border-bottom">
		    		<pre id="body">${DATA.body}</pre>
				</div>
			</div>
		</div>
			
			
		<div class="w3-col">
<c:if test="${not empty DATA}">
	<c:if test="${SID eq DATA.id}">
			<div class="w3-third w3-btn w3-section w3-green w3-ripple" id="home">Home</div>
			<div class="w3-third w3-btn w3-section w3-blue w3-ripple" id="list">글목록</div>
			<div class="w3-third w3-btn w3-section w3-amber w3-ripple" id="edit">글수정</div>
	</c:if>
</c:if>
<c:if test="${empty DATA or empty SID or (SID ne DATA.id)}">
			<div class="w3-half w3-btn w3-section w3-green w3-ripple" id="home">Home</div>
			<div class="w3-half w3-btn w3-section w3-blue w3-ripple" id="list">글목록</div>
</c:if>
		</div>
	</div>
</body>
</html>