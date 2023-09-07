<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>COCOBORI</title>
<style type="text/css">
	@font-face {
   	 	font-family: 'omyu_pretty';
   	 	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    	font-weight: normal;
   	 	font-style: normal;
	}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/87eea0d038.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
<%String user_email = (String)session.getAttribute("user_email"); %>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src="images/cocobori_logo.png"
					alt="" /></span>
			</div>
			<br>
			<br>
			<br>
			<br>
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">홈</span></a></li>
					<li><a href="login.jsp" id="login-link"><span
							class="icon solid fa-seedling">로그인</span></a></li>
					<li><a href="join.jsp" id="join-link"><span
							class="icon solid fa-pencil">회원가입</span></a></li>
					<li><a href="dic_pet.jsp" id="petinfo-link"><span
						  	class="icon solid fa-book">반려동물 백과사전</span></a></li>
					<li><a href="veterinaryClinic.jsp" id="loc-link"><span
							class="icon solid fa-wifi">주변 정보</span></a></li>
				</ul>
			</nav>
		</div>
		<div class="bottom">

			<!-- Social Icons -->
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
	</div>

	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="#">
			<h1>LOGIN</h1>
			
		</section>
		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container-a">
				<form action="LoginService" method="post">

					<div class="input-group mb-3" style="padding-bottom: 5px">
						<span class="input-group-text" id="login">
						<i	class="fas fa-light fa-envelope"></i></span> 
						<input type="text"	class="form-control" name="user_email" placeholder="이메일"
							aria-label="user_email" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3" style="padding-bottom: 5px">
						<span class="input-group-text" id="pw">
						<i	class="fas fa-light fa-lock"></i></span> 
						<input type="password"	class="form-control" name="user_pw" placeholder="비밀번호"
							aria-label="user_pw" aria-describedby="basic-addon1">
					</div>

					<div>
						<button style="margin-top: 10px; background-color: #FFD95A;" type="submit"
							class="btn btn-light" onclick="login()">로그인</button>
						<button style="margin-top: 10px; background-color: #4C3D3D;" type="button"
							class="btn btn-light" onclick="location.href='join.jsp'">회원가입</button>
					</div>
				</form>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</section>
	</div>

	<!-- Footer -->
	<div id="footer">

		<!-- Copyright -->
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
	</div>
	
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>