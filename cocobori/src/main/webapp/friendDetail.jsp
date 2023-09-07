<%@page import="com.smhrd.model.CocoBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="com.smhrd.model.CocoFriendDAO"%>
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

		// 친구 정보
		@SuppressWarnings("unchecked")
		List<CocoMemberDTO> friendInfo = (List<CocoMemberDTO>)session.getAttribute("friendInfo");
		
		// 친구 활동 내력
		@SuppressWarnings("unchecked")
		List<CocoBoardDTO> friendHistory = (List<CocoBoardDTO>)session.getAttribute("friendHistory");
		
		// 친구 이메일 세션에 저장
		String friend_email = friendInfo.get(0).getUser_email();
		session.setAttribute("friend_email", friend_email);
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
				<h1>친구 정보</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two">
			<div class="friend_detail container" style="width: 1000px;">
				<div class="row" style="justify-content: center;">
					<div class="col-md-9">
						<table class="table">
						<tr>
							<td class="text-center" rowspan="2" style="width: 150px; height: 150px;">
								<% if (friendInfo.get(0).getUser_file() == null) {%>
									<img alt="" src="<%= "./images/foot.png"%>" style="width: 150px; height: 150px;">
								<% } else {%>
									<img alt="" src="<%= "./upload/" + friendInfo.get(0).getUser_file()%>" style="width: 150px; height: 150px;">
								<% }%>
							</td>
							<td class="text-center">
								<%= friendInfo.get(0).getUser_email()%>
								<button class="btn btn-danger" type="button" style="margin-top: 10px;" onclick="location.href='DeleteFriend.do?friend_email=<%= friendInfo.get(0).getUser_email()%>'">언팔로우</button>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<button class="btn btn-light" type="button" style="width: 150px; margin-top: 10px; background-color: #FFD95A;" onclick="location.href='chat.jsp'">채팅</button>
							</td>
						</tr>
						<tr>
							<td class="text-center" colspan="2">게시물</td>
						</tr>
						<tr>
							<td class="friend_content text-center" colspan="2">
								<% if (friendHistory.size() < 9) {%>
									<% for (int i = 0; i < friendHistory.size(); i++) {%>
										<img style="width: 200px; height: 200px; margin: 5px;" alt="" src="<%="./upload/" + friendHistory.get(i).getB_file()%>" onclick="location.href='BoardDetail.jsp?num=<%= friendHistory.get(i).getB_seq()%>'">
									<% }%>
								<% } else {%>
									<% for (int i = 0; i < 9; i++) {%>
										<img style="width: 200px; height: 200px; margin: 5px;" alt="" src="<%="./upload/" + friendHistory.get(i).getB_file()%>" onclick="location.href='BoardDetail.jsp?num=<%= friendHistory.get(i).getB_seq()%>'">
									<% }%>
								<% }%>
							</td>
						</tr>
					</table>
					<button class="btn btn-light" id="writer" style="margin-top: 10px; background-color: #4C3D3D;" onclick="location.href='friend.jsp'">친구 페이지</button>
					</div>
				</div>
			</div><br><br>
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