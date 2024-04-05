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
		
		<div class="w3-col w3-card-4 w3-light-grey w3-text-blue">
			<h2 class="w3-center" id="title">Test01</h2>
			 
			<div class="w3-row w3-section">
				<div class="w3-col inblock" style="width: 100px;"><span class="w3-xxlarge fa fa-user"></span> 작성자</div>
		    	<div class="w3-rest" id="writer">jennie</div>
			</div>
			
			<div class="w3-row w3-section">
			  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
			    <div class="w3-rest">
			      <input class="w3-input w3-border" name="last" type="text" placeholder="Last Name">
			    </div>
			</div>
			
			<div class="w3-row w3-section">
			  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
			    <div class="w3-rest">
			      <input class="w3-input w3-border" name="email" type="text" placeholder="Email">
			    </div>
			</div>
			
			<div class="w3-row w3-section">
			  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
			    <div class="w3-rest">
			      <input class="w3-input w3-border" name="phone" type="text" placeholder="Phone">
			    </div>
			</div>
			
			<div class="w3-row w3-section">
			  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
			    <div class="w3-rest">
			      <input class="w3-input w3-border" name="message" type="text" placeholder="Message">
			    </div>
			</div>
			
			<p class="w3-center">
			<button class="w3-button w3-section w3-blue w3-ripple"> Send </button>
			</p>
		</div>
	</div>
</body>
</html>