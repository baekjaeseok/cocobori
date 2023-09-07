<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoPetDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoPetDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>반려동물 백과사전</title>
<style type="text/css">
	@font-face {
		font-family: 'omyu_pretty';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
			format('woff2');
		font-weight: normal;
		font-style: normal;
	}


</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	%>
	<%
		CocoPetDTO pet = (CocoPetDTO)session.getAttribute("pet");
	%>
   
    <%
		CocoPetDAO dao = new CocoPetDAO();
		List<CocoPetDTO> petList = dao.selAllBird();
	%>
	
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
							<li><a href="questionReportAdmin.jsp" id="question-link"><span class="icon solid fa-thumbtack">문의 및 신고</span></a></li>
							<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-share">로그아웃</span></a></li>
						<% } else {%>
							<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
							<li><a href="board.jsp" id="community-link"><span class="icon solid fa-comments">커뮤니티</span></a></li>
							<li><a href="friend.jsp" id="community-link"><span class="icon solid fa-heart">친구</span></a></li>
							<li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-book">반려동물 백과사전</span></a></li>
							<li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-wifi">주변 정보</span></a></li>
							<li><a href="question.jsp" id="question.jsp-link"><span class="icon solid fa-thumbtack">문의 및 신고</span></a></li>
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
		<!-- Portfolio -->
		<section id="portfolio" class="two" style="padding-top: 20px; padding-bottom: 20px;">
			<img class="icon_pet" alt="" src="./images/icon_bird.gif"><span class="sub_title">조류 백과사전</span>
			<div class="container-a" style="width: 70%; font-size: 18px;">

				<form action="SelectBird" method="post" enctype="multipart/form-data">
					
					<!-- 품종 소분류 -->
					<select style="width:50%; height:50px; margin: auto;" class="form-select"
						aria-label="Default select example" name="pet_breed" id="pet_breed">
						<option selected>상세품종</option>
						
							<%
								for (int i = 0; i < petList.size(); i++) {
							%>
							<option value="<%=petList.get(i).getPet_breed()%>"><%=petList.get(i).getPet_breed()%></option>						
							<%
								}
							%>
					</select>
					<button style="margin-top: 10px;" type="submit" class="btn btn-warning">동물백과 조회</button>
					<button style="margin-top: 10px; background-color: #b37c57;" type="button" class="btn btn-light" onclick="location.href='resetPet'">뒤로가기</button>
				</form>

				<%
					if (pet == null) {
				%>
				<!-- 동영상 올리기 -->
				<br>
				<br>
				<video style="margin-top: 10px; border-radius: 15px;"  src="./images/dic_parrot.mp4" autoplay="autoplay" muted="muted" loop="loop" width="60%" height="70%">
				</video>
				<%
					}
				%>
				<%
					if (pet != null) {
				%>
				<img alt="X" src="<%="./pet_file/" + pet.getPet_pic()%>"
					width="50%" height="40%" style="margin-bottom: 10px; margin-top: 10px; border-radius: 15px;">
				<h3><%=pet.getPet_breed()%></h3>
				<table class="table" style="border: 1px solid black;">
					<tr>
						<td class="pet-score">온도</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_temp()%></td>
					</tr>
					<tr>
						<td class="pet-score">먹이</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_eat()%></td>
					</tr>
					<tr>
						<td class="pet-score">케이지</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_cage()%></td>
					</tr>
					<tr>
						<td class="pet-score">질병</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_health()%></td>
					</tr>
					<tr>
					<tr>
						<td class="pet-score">성격</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_adapt()%></td>
					</tr>
					<tr>
						<td class="pet-score">유의사항</td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_etc()%></td>
					</tr>

				</table>
				<%
				}
				%>
			</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>


</body>
</html>