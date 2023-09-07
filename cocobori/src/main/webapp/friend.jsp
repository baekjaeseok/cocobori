<%@page import="com.smhrd.model.CocoFriendDAO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>COCOBORI</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body class="is-preload">

	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
		String user_email = member.getUser_email();

		// 친구 목록
		List<CocoFriendDTO> friendList = new CocoFriendDAO().showAllFriends(user_email);
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

			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">홈</span></a></li>
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
				</ul>
			</nav>

		</div>

		<div class="bottom">

			<!-- Social Icons -->
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
			</ul>

		</div>

	</div>

	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="#">
			<div class="container">
				<h1>친구</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two">
			<div class="friend_list container" style="width: 800px;">
				<div class="row" style="justify-content: center;">
					<div class="col-md-9">
						<table class="table">
							<tr>
								<td style="text-align: center;">친구 목록</td>
								<td style="text-align: right;">
									<button class="btn btn-light" type="button" style="margin-top: 10px; background-color: #FFD95A;" onclick="location.href='searchMember.jsp'">유저 검색</button>
								</td>
							</tr>
							<% for (int i = 0; i < friendList.size(); i++) {%>
								<tr>
									<td class="friend_email" colspan="2" onclick="location.href='FriendDetail.do?user_email=<%=friendList.get(i).getFriend_email()%>'">
										<%=friendList.get(i).getFriend_email()%>
									</td>
								</tr>
							<% }%>
						</table>
					</div>
				</div>
			</div><br><br><br><br><br><br><br><br>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>