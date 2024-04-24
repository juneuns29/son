<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Son Login</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#home').click(function(){
			$(location).attr('href', '/main.cls');
		});
		
		$('#join').click(function(){
			$(location).attr('href', '/member/join.cls');
		});

		// 로그인 버튼 클릭이벤트 
		
		/*
			입력태그의 내용을 읽어서 form 태그에 데이터를 추가하고
			form 태그를 memberLogin.cls 로 제출하는 코드를 작성하세요.
			form 태그의 전송방식은 "POST"로 한다.
		*/
	});
</script>
</head>
<body>
	<form id="frm"></form>
	
    <div class="w3-content w3-center mxw700">
        <h1 class="w3-pink w3-padding w3-round-large w3-card-4">Member Login</h1>
        <div class="w3-container w3-padding w3-margin-top w3-round-large w3-card-4 pdh30">
            <div class="w3-col w3-padding">
                <label for="id" class="w3-col m3 w3-right-align w3-text-gray lbl">ID : </label>
                <input type="text" class="w3-col m7 w3-input w3-border"
                        			id="id" placeholder="아이디를 입력하세요.">
            </div>
            <div class="w3-col w3-padding">
                <label for="pw" class="w3-col m3 w3-right-align w3-text-gray lbl">PW : </label>
                <input type="password" class="w3-col m7 w3-input w3-border"
                    				id="pw" placeholder="비밀번호를 입력하세요.">
            </div>
        </div>

        <div class="w3-col w3-margin-top w3-card-4 w3-round-large frHidden">
            <div class="w3-third w3-btn w3-green w3-hover-lime" id="home">Home</div>
            <div class="w3-third w3-btn w3-orange w3-hover-yellow" id="join">회원가입</div>
            <div class="w3-third w3-btn w3-blue w3-hover-aqua" id="login">로그인</div>
        </div>
    </div>
</body>
</html>