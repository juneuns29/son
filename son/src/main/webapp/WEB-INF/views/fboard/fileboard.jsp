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
	.fblist {
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.fblist').click(function(){
			var sbno = $(this).attr('id');
			
			$('#bno').val(sbno);
			$('#frm').submit();
		});
		
		$('#')
	});
</script>
</head>
<body>
	<form method="POST" action="/fboard/fboardDetail.son" id="frm" name="frm">
		<input type="hidden" name="bno" id="bno">
	</form>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-green" style="margin-bottom: 0px!important;">파일 게시판</h1>
		
		<div class="w3-col w3-margin-bottom">
			<div class="w3-col m2 w3-btn w3-small w3-lime w3-ripple" id="home">Home</div>
<c:if test="${not empty SID}">
			<div class="w3-col m2 w3-btn w3-small w3-amber w3-ripple w3-right" id="write">글작성</div>
			<div class="w3-col m2 w3-btn w3-small w3-blue w3-ripple w3-right" id="logout">로그아웃</div>
</c:if>
<c:if test="${empty SID}">
			<div class="w3-btn w3-small w3-khaki w3-ripple w3-right" id="login">로그인</div>
			<div class="w3-btn w3-small w3-orange w3-ripple w3-right" id="join">회원가입</div>
</c:if>
		</div>
		
		<div class="w3-col">
			<div class="w3-col w3-center">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-blue-gray">글번호</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-blue-gray">파일</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><div class="w3-blue-gray">작성일</div></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-blue-gray">작성자</div></div>
				<div class="w3-rest pdr5"><div class="w3-blue-gray">글제목</div></div>
			</div>
			
			<div class="w3-col w3-border-bottom w3-margin-top fblist" id="1234">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">1234</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-center file">0</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><small class="w3-center wdate">2024-04-05 13:30:30</small></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-center writer">jennie</div></div>
				<div class="w3-rest pdr5"><div class="title">test</div></div>
			</div>
			
			<div class="w3-col w3-border-bottom w3-margin-top fblist" id="1235">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">1234</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-center file">0</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><small class="w3-center wdate">2024-04-05 13:30:30</small></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-center writer">jennie</div></div>
				<div class="w3-rest pdr5"><div class="title">test</div></div>
			</div>
			
			<div class="w3-col w3-border-bottom w3-margin-top fblist" id="1236">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">1234</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-center file">0</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><small class="w3-center wdate">2024-04-05 13:30:30</small></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-center writer">jennie</div></div>
				<div class="w3-rest pdr5"><div class="title">test</div></div>
			</div>
			
			<div class="w3-col w3-border-bottom w3-margin-top fblist" id="1237">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">1234</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-center file">0</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><small class="w3-center wdate">2024-04-05 13:30:30</small></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-center writer">jennie</div></div>
				<div class="w3-rest pdr5"><div class="title">test</div></div>
			</div>
			
		</div>
		
		<div class="w3-col w3-center w3-margin-top">
			<div class="w3-bar w3-border w3-round">
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">&laquo;</a>
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">1</a>
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">2</a>
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">3</a>
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">4</a>
				<a href="#" class="w3-bar-item w3-button w3-green w3-hover-lime">&raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>