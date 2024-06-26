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
	html, body {
		margin-bottom: 20px;
		padding-bottom: 20px;
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
	<form method="POST" id="frm"></form>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-green" style="margin-bottom: 0px!important;">설문조사 결과</h1>
		
		<div class="w3-col w3-margin-bottom">
			<div class="w3-col m2 w3-btn w3-small w3-lime w3-ripple" id="home">Home</div>
<c:if test="${not empty SID}">
			<div class="w3-col m2 w3-btn w3-small w3-blue w3-ripple w3-right" id="logout">로그아웃</div>
	<c:if test="${SID eq 'euns'}">
			<div class="w3-col m2 w3-btn w3-small w3-indigo w3-ripple w3-right" id="addSvy">설문입력</div>
	</c:if>
</c:if>
<c:if test="${empty SID}">
			<div class="w3-btn w3-small w3-khaki w3-ripple w3-right" id="login">로그인</div>
			<div class="w3-btn w3-small w3-orange w3-ripple w3-right" id="join">회원가입</div>
</c:if>
		</div>
		
		<div class="w3-col">
			<div class="w3-container">
				<h3 class="w3-text-blue">* ${LIST.get(0).title}</h3>
			</div>
			<ol style="padding-left: 0px!important;">
	<c:forEach var="SVO" items="${LIST}" varStatus="st1">
	<c:if test="${st1.index eq 0}">
		<script type="text/javascript">
			$(document).ready(function(){
				$('#frm').append('<input type="hidden" name="tpno" value="${SVO.tpno}">');
			});
		</script>
	</c:if>
				<div class="w3-col w3-padding w3-margin-bottom w3-light-gray w3-card-4 w3-left-align pdl50"
						style="padding-bottom: 20px!important;">
					<h4>
						<li>
							${SVO.body}
						</li>
						<ol style="list-style-type: none; padding-left: 0px!important;">
			<c:forEach var="ANS" items="${SVO.bogis}" varStatus="st">
							<li>
								<div class="w3-col">
									<small> ${st.index + 1})&nbsp; &nbsp; ${ANS.body}</small>
									<small class="w3-right w3-text-indigo">${ANS.per} %</small>
								</div>
								<div class="w3-col pdl30" style="height: 10px;">
									<div class="w3-col w3-blue" style="width: ${ANS.per}%; height: 10px;"> </div>
								</div>
							</li>
			</c:forEach>
						</ol>
					</h4>
				</div>
	</c:forEach>
			</ol>
		</div>
	</div>
</body>
</html>