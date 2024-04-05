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
		
		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		
		$('#write').click(function(){
			$(location).attr('href', '/fboard/fboardWrite.son');
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logout.son');
		});
		
		$('#login').click(function(){
			$(location).attr('href', '/member/login.son');
		});
		
		$('#join').click(function(){
			$(location).attr('href', '/member/join.son');
		});
	});
</script>
</head>
<body>
	<!-- 전송용 폼 태그 -->
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
<c:if test="${not empty LIST}">
	<c:forEach var="DATA" items="${LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top fblist" id="${DATA.bno}">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">${DATA.bno}</div></div>
				<div class="inblock w3-right" style="width: 50px;"><div class="w3-center file">${DATA.cnt}</div></div>
				<div class="inblock w3-right pdr5" style="width: 170px;"><small class="w3-center wdate">${DATA.sdate}</small></div>
				<div class="inblock w3-right pdr5" style="width: 150px;"><div class="w3-center writer">${DATA.id}</div></div>
				<div class="w3-rest pdr5">
					<div class="title">${DATA.title}</div>
				</div>
			</div>
	</c:forEach>
	
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
</c:if>
<c:if test="${empty LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top">
				<h3 class="w3-center w3-text-gray">* 아직 작성된 글이 없습니다. *</h3>
			</div>
</c:if>
		</div>
		
	</div>
</body>
</html>