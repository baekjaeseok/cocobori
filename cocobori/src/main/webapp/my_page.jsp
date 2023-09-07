
<%@page import="com.smhrd.model.CocoMemberDTO"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/87eea0d038.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
	<% CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember"); %>
	<% String user_email = member.getUser_email(); %>
	<% String user_pw = member.getUser_pw(); %>
	<% String user_nick = member.getUser_nick(); %>
	<% String user_phone = member.getUser_phone(); %>
	
	<%-- <% String user_name = member.getUser_name(); %> --%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">

				<!-- 로고 넣는 자리 -->
				<span class="image avatar48">
					<img src="<%="./images/cocobori_logo.png"%>">
				</span><br><br><br><br><br>

				<!-- 로그인시 프로필사진과 닉네임 나오는 자리 -->
				<% if (member != null) {%>
					<div class="card" style="padding-bottom: 10px">
						<div style="height: 60px;" class="card-body">
							<span class="image avatar49">
							<% if (member.getUser_file() == null) {%>
								<img style="width: 50px; height: 50px; margin-top: 10px; margin-left: 20px; border-radius: 70%" alt="" src="<%= "./images/foot.png"%>">
							<% } else {%>
								<img style="width: 50px; height: 50px; margin-top: 10px; margin-left: 20px; border-radius: 70%" alt="" src="<%="./upload/" + member.getUser_file()%>">
							<% }%>
							</span>
							<h3 style="border: medium;"><%=member.getUser_nick()%></h3>
						</div>
					</div>
				<% }%>

			</div>
			<!-- ================================================================================ -->

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">홈</span></a></li>
					<% if (member == null) {%>
						<li><a href="login.jsp" id="login-link"><span class="icon solid fa-seedling">로그인</span></a></li>
						<li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-book">반려동물 백과사전</span></a></li>
						<li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-wifi">주변 정보</span></a></li>
					<% } else {%>
						<% if(member.getUser_email().equals("admin@admin.com")) {%>
							<li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-hammer">전체회원정보</span></a></li>
							<li><a href="InsertPet.jsp" id="petinfo-link"><span class="icon solid fa-book">반려동물 백과사전</span></a></li>
							<li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-wifi">주변 정보</span></a></li>
							<li><a href="questionReportAdmin.jsp" id="community-link"><span class="icon solid fa-thumbtack">문의 및 신고</span></a></li>
							<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-share">로그아웃</span></a></li>
						<% } else {%>
							<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
							<li><a href="board.jsp" id="community-link"><span class="icon solid fa-comments">커뮤니티</span></a></li>
							<li><a href="friend.jsp" id="community-link"><span class="icon solid fa-heart">친구</span></a></li>
							<li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-book">반려동물 백과사전</span></a></li>
							<li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-wifi">주변 정보</span></a></li>
							<li><a href="question.jsp" id="community-link"><span class="icon solid fa-thumbtack">문의 및 신고</span></a></li>
							<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-share">로그아웃</span></a></li>
						<% }%>
					<% }%>
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
		<section id="top" class="#" style="padding-top: 20px; padding-bottom: 20px" >
		<h1>마이페이지</h1>
		<p>비밀번호, 닉네임, 휴대폰번호를 변경할 수 있습니다.</p>
				<p><%= user_email %></p>
		</section>
		
		<section id="portfolio" class="two">
			<div class="container-a" >
				<form action="UpdateService" method="post" enctype="multipart/form-data">
						
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify" ><i class="fas fa-thin fa-lock"></i></span>
 						 <input type="password" class="form-control" name="user_pw" placeholder="변경할 비밀번호" aria-label="user_pw" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify"><i class="fas fa-thin fa-pencil"></i></span>
 						 <input type="text" class="form-control" name="user_nick" placeholder="변경할 닉네임" aria-label="user_nick" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify"><i class="fas fa-thin fa-phone"></i></span>
 						 <input type="text" class="form-control" name="user_phone" placeholder="변경할 휴대폰 번호" aria-label="user_phone" aria-describedby="basic-addon1">
						</div>
						
					<div class="mb-3">
 					 <label for="formFileMultiple" class="form-label">변경하고 싶은 사진을 등록해주세요!</label>
 					 <input class="form-control" type="file" name="user_file" multiple>
					</div>
					<div>
						<button style="margin-top: 10px; background-color: #FFD95A;" type="submit"
                     class="btn btn-light" >적용</button>
						<button style="margin-top: 10px; background-color: #4C3D3D;" type="button"
                     class="btn btn-light" onclick="deleteMember()">회원탈퇴</button>
					</div> 

					<script>
					function deleteMember() {
  					confirm("정말 탈퇴하시겠습니까?");
  					window.location.href ="MemberDeleteService?user_email=<%=user_email%>";
					}
					</script>
				</form>
			</div>
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
	<!-- JavaScript Bundle with Popper -->

</body>
</html>