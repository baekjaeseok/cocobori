<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.CocoBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">


	<!-- 게시글 세부내용 조회 기능 --> 
	
	<%
	CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	List<CocoBoardDTO> board_list = new CocoBoardDAO().showBoard();
	%>
	
		<%
		List<CocoBoardDTO> board_List = null;
		try{
			int postId = Integer.parseInt(request.getParameter("num")); //num값 받아오기
			board_list = new CocoBoardDAO().detail_showBoard(postId);
		}catch(Exception e){
			board_list = null;
		};
		
		//board_list에 null값이나 없는 값 넣었을시(주소로 검색했을때 오류처리)
		if(board_list == null || board_list.size() == 0 ) { 
		%>
		
		<h1>입력하신 자료가 없습니다</h1>
		
		<% }else{
			CocoBoardDTO post = board_list.get(0); //board_list로 받아온 값에서는 무조건 인덱스0.(클릭된 값으로 들어갈테니 하나의 값만 받아오기에)
		
			
			//session에 값 저장해주기(무조건 세부사항을 열어야 수정가능하니까 여기에 session사용/ session:창 닫으면 값 없어짐)
			//session.setAttribute("BoardB_seq", post.getB_seq());
			//session.setAttribute("BoardB_title",post.getB_title());
			session.setAttribute("BoardUser_email",post.getUser_email());
			session.setAttribute("BoardB_Content", post.getB_content());
			session.setAttribute("BoardB_file", post.getB_file());
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

		<!-- Portfolio -->
		<section id="#" class="two">
		
		<div class="container-b">
			<table border = "1" style="width: 50%; margin: auto;">
				<tr>
					<td><button style="margin-top: 10px; background-color: #FFD95A;" type="submit" class="btn btn-light" onclick="location.href='board.jsp'"> < </button></td> 
					<td></td>
				</tr>
				
					<!-- <td>내용</td> -->
				<tr>
					<td colspan="2">
					
					<% if (post.getB_file()!= null){ %>
		            <span class="image avatar50">
		               <img alt="" src="<%= "./upload/"+ post.getB_file()%>">
		            </span>
		            <%}else{ %>
		            <span class="image avatar50">
		               <img alt="" src="<%= "./images/foot.png"%>">
		            </span>
		            <%} %>
					<br>	
				</tr>	
				<tr>
					<td colspan="2"><b><%=post.getUser_email()%></b></td>
				</tr>
			</table>
			<div style="width: 46%; margin: auto; text-align: left; padding-bottom: 10px;"><%=post.getB_content() %></div>
			<hr style="width: 50%; margin: auto; padding-bottom: 10px;">
			<div>
			<button style="margin-top: 10px; background-color: #4C3D3D;" type="submit" class="btn btn-light" onclick="location.href='BoardUpdate.jsp?num=<%=post.getB_seq()%>'">수정</button>
			<button style="margin-top: 10px; background-color: #FFD95A;" type="submit" class="btn btn-light" onclick="Delete()">삭제</button> 
	        
	        </div>
	        
	        <script>
	        	function Delete() {
        		if(!confirm("정말 삭제 하시겠습니까?")){
        			
        		}else{
	 				window.location.href ="DeleteBoardService?num=<%=post.getB_seq()%>";
        		}
				}
	        </script>
	        
		</div>
		<% } %>
		
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