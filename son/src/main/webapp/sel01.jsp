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

</style>
<script type="text/javascript">
	$(document).ready(function(){
		var arr = $('#qList > h4 > li:first-child li');
		
		alert(arr.length);
	});
</script>
</head>
<body>
		<div class="w3-col w3-light-gray w3-margin-top w3-card-4" >
			<ol id="qList">
				<h4> 
					<li class="quest"></li>
					<li class="quest">
						<ol style="list-style-type: lower-alpha;">
							<li>보기1</li>
							<li>보기2</li>
							<li>보기3</li>
							<li>보기4</li>
							<div class="w3-button w3-tiny w3-right w3-orange" id="plusSrv">설문 문항 등록</div>
						</ol>
					</li>
				</h4>
			</ol>
		</div>
</body>
</html>