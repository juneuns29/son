<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Son Main</title>
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#login').click(function(){
			var sid = '${SID}';
			if(!sid || sid == 'null'){
				$(location).attr('href', '/member/login.son');
			} else {
				alert('이미 로그인 했습니다.');
			}
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logout.son');
		});
		
		$('#join').click(function(){
			// 로그인 여부 검사
			var sid = '${SID}';
			if(!sid || sid == 'null'){
				$(location).attr('href', '/member/join.son');
			//	location.href = '/member/join.jsp';
			} else {
				return;
			}
		});
		
		$('#fboard').click(function(){
			$(location).attr('href', '/fboard/fileboard.son');
		});
		
		/* 방명록 클릭이벤트 추가 */
		$('#gboard').click(function(){
			// 할일
			$(location).attr('href', '/gboard/gboard.son');
		});
		
		$('#idList').click(function(){
			$(location).attr('href', '/member/memberList.son');
		});
		
		/*  
			myInfo 버튼이 클릭되면 아이디가 frm 태그에 bno 를 기억할 태그를 추가해서 
			/member/myInfo.son 으로 전송해서
			로그인한 회원의 정보를 출력하도록
			myInfo.jsp의 내용을 완성하세요.
			
			컨트롤러 함수는 myInfo()로 한다.
			
			단, 이페이지의 모든 작업은 jQuery로 처리하기로 한다.
			
			제출은 
				main.jsp
				myInfo.jsp
				Member.java
				요청설계.txt
				
			파일을 제출하는 것으로 한다.
			
		*/
		
		/*  이 부분에 코드 작성 */
		
		$('#myInfo').click(function(){
			// 할일
			// 태그를 추가
			var el = document.createElement('input'); // 메모리에 <input> 생성
			$(el).attr('type', 'hidden');	// <input type="hidden">
			$(el).attr('name', 'id');		// <input type="hidden" name="id">
			$(el).val('${SID}');			// <input type="hidden" name="id" value="${SID}">
			
			// 만든 태그를 폼태그에 추가
			$('#frm').append(el);
			// 폼태그 속성들 추가
			// action
			$('#frm').attr('action', '/member/myInfo.son');
			// 폼태그 전송
			$('#frm').submit();
		});
		
		$('#sdata').click(function(){
			$(location).attr('href', '/survey/dataInit.son');
		});
		
	});
</script>
</head>
<body>
	<form method="POST" id="frm">
	</form>
	
	<div class="w3-content mxw650 w3-center">
		<h1 class="w3-deep-purple w3-padding w3-card-4"> 
<c:if test="${not empty SID}">
			${SID}
</c:if>
<c:if test="${empty SID}">
			Son
</c:if>
			메인
		
		</h1>

		<div class="w3-col mgt10">
<!-- 로그인에 성공하면 session에 SID라는 속성으로 아이디를 기억시켜 놓을 것이므로 -->
			<div class="w3-btn w3-small w3-pink w3-left" id="fboard">게시판</div>
			<div class="w3-btn w3-small w3-amber w3-left" id="gboard">방명록</div>
<c:if test="${not empty SID}">
	<c:if test="${empty SCNT || SCNT eq 0}">
			<div class="w3-btn w3-small w3-yellow w3-left" id="sdata">설문조사초기화</div>
	</c:if>
</c:if>
<c:if test="${not empty SID}">
			<div class="w3-btn w3-small w3-orange w3-right" id="logout">로그아웃</div>
			<div class="w3-btn w3-small w3-light-green w3-left" id="idList"> 회원들 </div>
			<div class="w3-btn w3-small w3-blue w3-left" id="myInfo">myInfo</div>
</c:if>
<c:if test="${empty SID}">
			<div class="w3-btn w3-small w3-blue w3-right" id="join">회원가입</div>
			<div class="w3-btn w3-small w3-green w3-right" id="login">로그인</div>
</c:if>
		</div>
	</div>
</body>
</html>