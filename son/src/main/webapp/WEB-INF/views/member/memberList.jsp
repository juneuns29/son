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
		// 아이디 버튼 클릭이벤트
		$('.idbtn').click(function(){
			// 아이디 읽고
			var sid = $(this).html(); // 일반태그이므로 html() 또는 text() 함수로 읽는다.
			
			// 읽은 데이터 서버로 보내고 
			// 보낸 아이디에 해당하는 회원의 정보 조회 결과 받고
			$.ajax({
				url: '/member/memberInfo.son',
				type: 'POST',
				dataType: 'json',
				data: {
					id: sid
				},
				success: function(result){
					/*
						통신에 성공해서 데이터가 정상적으로 가져오는 경우 result는
						
						var result = {
							"id": "jennie",
							"name": "김제니",
							....
						};
						의 형태로 변수가 준비되기 때문에...
					
						var id = result.id;
					*/
					
					// 데이터꺼내고
					var id = result.id;
					var name = result.name;
					var mail = result.mail;
					var tel = result.tel;
					var gen = (result.gen == 'F') ? '여자' : '남자';
					var jdate = result.sdate;
					var avatar = result.savename;
					
					// 태그에 데이터 채우고
					$('#avtBox').attr('src', '/avatar/' + avatar);
					$('#tid').html(id);
					$('#id').html(id);
					$('#name').html(name);
					$('#mail').html(mail);
					$('#tel').html(tel);
					$('#gen').html(gen);
					$('#jdate').html(jdate);
					
					// 창 보이게 처리
					$('#wmodal').css('display', 'block');
				},
				error: function(){
					alert('### 서버 통신 에러 ###');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw650 w3-center">
		<h1 class="w3-padding w3-red w3-card-4">회원리스트</h1>
		<div class="w3-col">
<c:forEach var="DATA" items="${LIST}" varStatus="st">
			<div class="inblock idbtn w3-btn mgb10 ${COLOR[st.index]}">${DATA}</div>
</c:forEach>
		</div>
	</div>
	
	<div id="wmodal" class="w3-modal">
		<div class="w3-modal-content mxw550" >
			<header class="w3-container w3-blue"> 
				<span class="w3-btn w3-display-topright" id="close">&times;</span>
				<h2><span id="tid"></span> 회원 Information</h2>
			</header>
			<div class="w3-container w3-padding">
				<div class="w3-col w3-center">
					<img class="avtBox2 w3-border w3-border-gray w3-margin" id="avtBox">
				</div>
				<hr class="w3-col w3-margin-top w3-margin-bottom">
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">이 름 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="name"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">아이디 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="id"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">메 일 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="mail"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">연락처 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="tel"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">성 별 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="gen"></h3>
				</div>
				<div class="w3-col">
					<h3 class="w3-col m3 w3-text-light-gray pdr10">가입일 : </h3>
					<h3 class="w3-col m8 w3-text-light-gray pdr10" id="jdate"></h3>
				</div>
			</div>
			<footer class="w3-col">
				<div class="w3-col w3-purple w3-btn" id="cbtn">확인</div>
			</footer>
		</div>
	</div>
	
</body>
</html>