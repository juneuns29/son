<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-center w3-blue">파일게시글 내용</h1>
		
		<div class="w3-col w3-padding w3-card-4 w3-light-grey w3-text-blue">
			<h2 class="w3-center w3-blue w3-border-bottom" id="title">Test01</h2>
			 
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-user"></span> 작성자 </h3>
		    	<h3 class="w3-rest w3-center w3-text-blue-gray w3-border-bottom" id="writer"> jennie</h3>
			</div>
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-calendar-o"></span> 작성일 </h3>
		    	<h3 class="w3-rest w3-center w3-text-blue-gray w3-border-bottom" id="wdate"> 2024-04-05 13:30:30</h3>
			</div>
			<div class="w3-row w3-section w3-padding">
				<h3 class="w3-col inblock w3-right-align" style="width: 150px;"><span class="w3-xxlarge fa fa-calendar-o"></span> 작성일 </h3>
		    	<div class="w3-rest w3-center w3-text-blue-gray">
		    		<img src="/upload/anya.jpg" width="100" height="auto">
		    		<img src="/upload/anya2.png" width="100" height="auto">
		    		<img src="/upload/ania03.png" width="100" height="auto">
		    	</div>
			</div>
			
			
			<p class="w3-center">
			<button class="w3-button w3-section w3-blue w3-ripple"> Send </button>
			</p>
		</div>
	</div>
</body>
</html>