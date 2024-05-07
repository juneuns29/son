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
			$(this).children().eq(1).stop().slideToggle(300);
		});
		
		$('#addTopic').click(function(){
			// 작성하고 있는 화면이 리로드 되면 안되므로 비동기 통신으로 처리하기로 한다.
			// 할일
			// 1. 주제 읽고
			var topic = $('#topic').val();
			if(!topic){
				$('#topic').focus();
				return;
			}
			// 2. 시작일 읽고
			var startdate = $('#start').val();
			if(!startdate){
				$('#start').focus();
				return;
			}
			// 3. 종료일 읽고
			var enddate = $('#end').val();
			if(!enddate){
				$('#end').focus();
				return;
			}
			
			var outdata = {
					title: topic,
					start: startdate,
					end: enddate
			};
			
			// 4. 서버에 보내서 결과받고
			$.ajax({
				url: '/survey/addTopic.son',
				type: 'POST',
				dataType: 'json',
				data: outdata,
				success: function(obj){
					if(obj.result == 'OK'){
						// 설문주제 등록에 성공한 경우
						$('#frm').append('<input type="hidden" id="tpno">');
						$('#tpno').val(obj.tpno);
					} else {
						// 설문주제 등록에 실패한 경우
						$('#modalFr h2').html('등록 실패!');
						$('#strMsg').html('등록에 실패했습니다.');
						$('#modalFr').css('display', 'block');
					}
				},
				error: function(){
					$('#modalFr h2').html('통신 에러!');
					$('#strMsg').html('서버와 통신에 실패했습니다!');
					$('#modalFr').css('display', 'block');
				}
			});
			
		});
		
		$('.closeBtn').click(function(){
			$('#modalFr').css('display', 'none');
		});
		
		$('#btnInputTitle').click(function(){
			$('#inputTitle').removeClass('w3-hide');
			$('#selectTitle').addClass('w3-hide');
			
			$(this).removeClass('w3-gray w3-hover-pink').addClass('w3-blue w3-hover-yellow');
			$('#btnSelectTitle').removeClass('w3-blue w3-hover-yellow').addClass('w3-gray w3-hover-pink');
		});
		
		$('#btnSelectTitle').click(function(){
			$('#selectTitle').removeClass('w3-hide');
			$('#inputTitle').addClass('w3-hide');
			$(this).removeClass('w3-gray w3-hover-pink').addClass('w3-blue w3-hover-yellow');
			$('#btnInputTitle').removeClass('w3-blue w3-hover-yellow').addClass('w3-gray w3-hover-pink');
		
			// 아이디가 selTitle 인 태그의 내용 읽기
			var str = $('#selTitle').html();
			if(str){
				/* str = '내용있음!'; */
				$('#selTitle').html('');
			}
			
			// 데이터베이스 조회해서 태그 추가하고
			$.ajax({
				url: '/survey/questList.son',
				type: 'POST',
				dataType: 'json',
				success: function(obj){
					// 매개변수 obj는 배열변수다.
					// 배열에 JSON 형식의 데이터가 채워져 있는 형태이다.
					// 따라서 배열의 크기만큼 반복해서 처리해야 한다.
					var len = obj.length;
					$('#selTitle').append('<option selected># 문항 선택 #</option>');
					for(var i = 0 ; i < len ; i++ ){
						$('#selTitle').append('<option value="' + obj[i].qno + '">' + obj[i].body + '</option>')
					}
				},
				error: function(){
					alert('### 서버 통신 에러 ###');
				}
			});
		});
		
		// 아이디가 "squestAddBtn"인 태그 클릭이벤트
		$('#squestAddBtn').click(function(){
			var svalue = $('#selTitle').val();
			var stitle = $('#selTitle > option:selected').text();
			alert(svalue + ' - ' + stitle);
			
			if(stitle != '# 문항 선택 #'){
				$('#selTitle > option:selected').remove();
			}
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
		<div class="w3-col w3-light-gray w3-margin-top w3-card-4" 
												style="display: none;">
			<ol id="qList">
				<h4>
					<li class="quest">
						<span id="q${qno}">설문문항1</span>
						<ol style="display: none; list-style-type: lower-alpha;">
							<li>보기1</li>
							<li>보기2</li>
							<li>보기3</li>
							<li>보기4</li>
						</ol>
					</li>
				</h4>
			</ol>
		</div>
		
		<!-- 설문 문항 입력 -->
		<div class="w3-col w3-light-gray w3-padding w3-margin-top w3-card-4">
			<div class="w3-col">
				<div class="w3-half w3-center w3-button w3-blue w3-hover-yellow" id="btnInputTitle">새 문항 입력</div>
				<div class="w3-half w3-center w3-button w3-gray w3-hover-pink" id="btnSelectTitle">기존 문항 선택</div>
			</div>
			<div class="w3-col w3-padding w3-margin-bottom" id="inputTitle">
				<h4 class="w3-blue w3-center">새 문항 입력</h4>
				<label for="title" class="w3-col m3 w3-right-align lbl">입력 문항 : </label>
				<input type="text" id="title" class="w3-col m6 w3-input w3-border">
				<div id="tquestAddBtn" class="w3-col w3-button w3-deep-orange w100 mgl5">추가</div>
			</div>
			<div class="w3-col w3-padding w3-margin-bottom w3-hide" id="selectTitle">
				<h4 class="w3-blue w3-center">기존 문항 선택</h4>
				<label for="selTitle" class="w3-col m3 w3-right-align lbl">입력 문항 : </label>
				<select id="selTitle" class="w3-col m6 w3-border w3-center w3-select"></select>
				<div id="squestAddBtn" class="w3-col w3-button w3-deep-orange w100 mgl5">추가</div>
			</div>
		</div>
		
		
		
	</div>
	
<!-- 메세지 모달 -->
	<div id="modalFr" class="w3-modal">
		<div class="w3-modal-content mxw550 w3-animate-top w3-card-4">
			<header class="w3-container w3-red"> 
				<span class="w3-button w3-display-topright w3-hover-red closeBtn">&times;</span>
				<h2>서버 오류!</h2>
			</header>
			<div class="w3-container">
				<h3 id="strMsg" class="w3-center">서버 통신 에러</h3>
				<br>
			</div>
			<footer class="w3-container w3-margin-bottom">
				<div class="w3-col w3-button w3-deep-orange w3-hover-red w3-margin-bottom closeBtn">확 인</div>
			</footer>
		</div>
	</div>
</body>
</html>