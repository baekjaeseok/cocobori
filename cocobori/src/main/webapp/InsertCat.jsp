<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>반려동물 백과사전</title>
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
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">

	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
         <div id="logo">
            <!-- 로고 넣는 자리 -->
            
            <span class="image avatar48">
               <img  src="<%= "./images/cocobori_logo.png" %>">
            </span>
            
            <br>
            <br>
            <br>
            <br>
            <br>
      
            <!-- 로그인시 프로필사진과 닉네임 나오는 자리 -->
                  <%
                     if (member != null) {
                  %>
                     <div class="card" style="padding-bottom: 10px">
                     <div style="height: 60px;" class="card-body">
                     <span class="image avatar49"> 
                        <img style="width: 50px; height: 50px; margin-top: 10px; margin-left: 20px; border-radius:70% " alt=""   src="<%="./upload/" + member.getUser_file()%>">
                     </span>
                     
                  <h3 style="border: medium;">
                  <%= member.getUser_nick() %>
                  </h3>
                     </div>
                     </div>
                  <% }%>
                     
         </div>	

			<!-- Nav -->
			<nav id="nav">
			<ul>
               <li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">홈</span></a></li>
               <% if (member == null) { %>
               <li><a href="login.jsp" id="login-link"><span class="icon solid fa-envelope">로그인</span></a></li>
               <li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 백과사전</span></a></li>
                  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
               <% } else { %>
                  <% if(member.getUser_email().equals("admin@admin.com")) { %>
				  <li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-hammer">전체회원정보</span></a></li>
				  <li><a href="InsertPet.jsp" id="petinfo-link"><span class="icon solid fa-book">반려동물 백과사전</span></a></li>
		    	  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-wifi">주변 정보</span></a></li>
				  <li><a href="questionReportAdmin.jsp" id="question-link"><span class="icon solid fa-thumbtack">문의 및 신고</span></a></li>
				  <li><a href="LogoutService" id="logout-link"><span class="icon solid fa-share">로그아웃</span></a></li>
                  <% } else { %>
                  <li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
                  <li><a href="board.jsp" id="community-link"><span class="icon solid fa-envelope">커뮤니티</span></a></li>
                  <li><a href="friend.jsp" id="community-link"><span class="icon solid fa-envelope">친구</span></a></li>
                  <li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 백과사전</span></a></li>
                  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
                  <li><a href="question.jsp" id="community-link"><span class="icon solid fa-envelope">문의 및 신고</span></a></li>
                  <li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
                  <% } %>
               <% } %>
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
		<img class="icon_pet" alt="" src="./images/icon_cat.gif"><span class="sub_title">고양이 백과사전 등록</span>
			<div class="container-c">
			<div><button style="background-color: #55cbcd; margin-top: 10px; margin-right: 10px; margin-bottom: 10px;" type="button" class="btn btn-light" onclick="location.href='InsertDog.jsp'">강아지 백과사전 등록</button></div>
			<div><button style="background-color: #caa6fe; margin-top: 10px; margin-right: 10px; margin-bottom: 10px;" type="button" class="btn btn-light" onclick="location.href='InsertCat.jsp'">고양이 백과사전 등록</button></div>
			<div><button style="background-color: #a9d39e; margin-top: 10px; margin-right: 10px; margin-bottom: 10px;" type="button" class="btn btn-light" onclick="location.href='InsertRep.jsp'">파충류 백과사전 등록</button></div>
			<div><button style="background-color: #b37c57; margin-top: 10px; margin-right: 10px; margin-bottom: 10px;" type="button" class="btn btn-light" onclick="location.href='InsertBird.jsp'">조류 백과사전 등록</button></div>
			</div>
			
			<div class="container-b" style="width: 70%;">
				<form action="InsertCat" method="post" enctype="multipart/form-data">
					<select style="margin-bottom: 10px" class="form-select" aria-label="Default select example" name="pet_type">
					<!-- 품종 대분류 -->
						<option selected>품종</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="파충류">파충류</option>
						<option value="조류">조류</option>
					</select>
					<!-- 품종 소분류 -->
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_breed" class="form-control-sm" placeholder="상세품종">
					</div>
					<!-- 동물 사진 -->
					<div class="input-group mb-3" style="margin-bottom: 10px;">
						<input type="file" class="form-control" id="inputGroupFile02" name="pet_pic">
					</div>
					<!-- 친화력 지표 -->
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_affno" class="form-control-sm" placeholder="친화력 지표 점수">
					</div>
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_aff" class="form-control-sm" placeholder="친화력 지표">
					</div>
					<!-- 활동성 지표 -->
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_actno" class="form-control-sm" placeholder="활동성 지표 점수">
					</div>
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_act" class="form-control-sm" placeholder="활동성 지표">
					</div>
					<!-- 건강 지표 -->
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_healthno" class="form-control-sm" placeholder="건강 지표 점수">
					</div>
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_health" class="form-control-sm" placeholder="건강 지표">
					</div>
					<!-- 그루밍 난이도 -->
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_groomno" class="form-control-sm" placeholder="그루밍 난이도">
					</div>
					<div class="form-floating" style="margin-bottom: 10px;">
						<input type="text" name="pet_groom" class="form-control-sm" placeholder="그루밍">
					</div>
					
					<button style= "margin-top: 10px;" type="submit" class="btn btn-warning">동물백과 등록</button>
					<button type="button" class="btn btn-light" style="background-color: #b37c57; margin-top: 10px;" onclick="location.href='InsertPet.jsp'">뒤로가기</button>
				</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			<!-- 		<button type="submit" class="btn btn-warning">LOGIN</button>
					<button type="button" class="btn btn-info"
						onclick="location.href='join.jsp'">SIGN UP</button> -->
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
</body>
</html>