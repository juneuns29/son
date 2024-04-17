<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Member List</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logout.son');
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw650 w3-center">
		<h1 class="w3-padding w3-red w3-card-4">회원리스트</h1>
		<div class="w3-col">
			<div class="w3-btn w3-small w3-green w3-card-4 w3-left" id="home">home</div>
			<div class="w3-btn w3-small w3-pink w3-card-4 w3-right" id="logout">logout</div>
		</div>
		<hr class="w3-col w3-margin">
		<div class="w3-col">
<c:forEach var="DATA" items="${LIST}" varStatus="st">
			<div class="inblock idbtn w3-btn mgb10 ${COLOR[st.index]}">${DATA}</div>
</c:forEach>
		</div>
		
		<div class="w3-col mxw550" >
			<header class="w3-container w3-blue"> 
				<span class="w3-btn w3-display-topright" id="close">&times;</span>
				<h2><span id="tid membdata"></span>My Information</h2>
			</header>
			<div class="w3-container w3-padding">
				<div class="w3-col w3-center">
					<img class="avtBox2 w3-border w3-border-gray w3-margin" id="avtBox">
				</div>
				<hr class="w3-col w3-margin-top w3-margin-bottom">
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">이 름 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="name"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">아이디 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="id"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">메 일 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="mail"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">연락처 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="tel"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">성 별 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="gen"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-right-align w3-text-gray pdr10">가입일 : </h3>
					<h3 class="w3-col m8 w3-center w3-text-gray pdr10 membdata" id="jdate"></h3>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>