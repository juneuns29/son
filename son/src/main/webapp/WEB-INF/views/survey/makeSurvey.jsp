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
	.lbl {
		color: gray;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#home').click(function(){
			$(location).attr('href', '/main.son');
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logout.son');
		});
		
		$('#topicReset').click(function(){
			$('#topicFr input').val('');
		});
		
		$('.quest').click(function(){
			$(this).children().eq(1).stop().slideToggle(1000);
		});
	});
</script>
</head>
<body>
	<form method="POST" id="frm"></form>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-pink" style="margin-bottom: 0px!important;">설문 추가 등록</h1>
		
		<div class="w3-col w3-margin-bottom">
			<div class="w3-col m2 w3-btn w3-small w3-lime w3-ripple" id="home">Home</div>
			<div class="w3-col m2 w3-btn w3-small w3-blue w3-ripple w3-right" id="logout">로그아웃</div>
		</div>
		
		<!-- 설문 주제 추가 -->
		<div class="w3-col w3-light-gray w3-card-4" id="topicFr">
			<!-- 주제 입력 -->
			<div class="w3-col w3-margin-top w3-padding">
				<label for="topic" class="w3-col m3 w3-right-align pdr10 lbl">설문 주제 : </label>
				<div class="w3-col m8 pdl10 pdr10">
					<input type="text" id="topic" class="w3-input w3-border">
				</div>
			</div>
			<!-- 시작일 선택 -->
			<div class="w3-col w3-padding">
				<label class="w3-col m3 w3-right-align pdr10 lbl">설문기간 : </label>
				<div class="w3-col m8 pdl10 pdr10">
					<input type="date" id="start" class="w3-col m5 w3-input w3-border">
					<span class="w3-col m2 w3-center lbl"> ~ </span>
					<input type="date" id="end" class="w3-col m5 w3-input w3-border">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom w3-padding">
				<div class="w3-half w3-btn w3-amber w3-small" id="topicReset">reset</div>
				<div class="w3-half m1 w3-btn w3-blue w3-small w3-right" id="addTopic">등록</div>
			</div>
		</div>
		
		<!-- 설문 문항 추가 내용 확인 리스트 -->
		<div class="w3-col w3-light-gray w3-margin-top w3-card-4">
			<ol id="qList">
				<li class="quest">
					<h4 id="q${qno}">설문문항1</h4>
					<ol style="display: none; list-style-type: lower-alpha;">
						<li>보기1</li>
						<li>보기2</li>
						<li>보기3</li>
						<li>보기4</li>
					</ol>
				</li>
			</ol>
		</div>
	</div>
</body>
</html>