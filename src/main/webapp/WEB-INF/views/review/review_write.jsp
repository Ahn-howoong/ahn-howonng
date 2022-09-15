<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review_write.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 나만의한줄평</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".nav_container nav ul li").mouseenter(
								function(e) {
									$(".nav_container nav ul li a").siblings(
											".nav_dropdown").show();
								});

						$("nav").mouseleave(function() {
							$(".nav_dropdown").hide();
						});

						$(".nav_dropdown div").mouseenter(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#ffe695");
								});

						$(".nav_dropdown div").mouseleave(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#fff");
								});
						$("#search_btn")
								.click(
										function() {
											$
													.ajax(
															{
																method : "GET",
																url : "https://dapi.kakao.com/v3/search/book?target=title",
																data : {
																	query : $(
																			"#search")
																			.val()
																},
																headers : {
																	Authorization : "KakaoAK 8e4c9f81d06f13ce398748177abb8d35"
																}
															})
													.done(
															function(msg) {
																for (var i = 0; i < 10; i++) {
																	$("#title1")
																			.append(
																					msg.documents[i].title);
																	$(
																			"#thumbnail1")
																			.append(
																					"<img src='" + msg.documents[i].thumbnail + "'>");
																}
															});
										});
					});
</script>
</head>
<body>
	<div id="all">
		<header>
			<div class="box">
				<nav id="menu">
					<ul id="top_menu">
						<li>로그인</li>
						<li>|</li>
						<li>로그아웃</li>
						<li>|</li>
						<li>마이페이지</li>
					</ul>
				</nav>
				<div id="logo">
					<a href="index.html"><img
						src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
				</div>
			</div>
		</header>
		<div id="sticky">
			<section class="navigation box">
				<div class="nav_container">
					<nav>
						<ul>
							<li><a href="search.html" class="title">자료검색</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="search.html">통합검색</a></li>
										<li><a href="recommend.html">추천도서</a></li>
									</div>
								</ul></li>
							<li><a href="info.html" class="title">도서관소개</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="info.html">도서관 안내</a></li>
										<li><a href="borrow.html">대출반납안내</a></li>
										<li><a href="map.html">찾아오시는길</a></li>
										<li><a href="join.html">회원증 발급</a></li>
									</div>
								</ul></li>
							<li><a href="project.html" class="title">열린공간</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="project.html">공지사항</a></li>
										<li><a href="lost.html">자주하는질문</a></li>
										<li><a href="qna.html">Q&A 게시판</a></li>
										<li><a href="event.html">행사안내</a></li>
									</div>
								</ul></li>
							<li><a href="checkout_return.html" class="title">나만의도서관</a>
								<ul class="nav_dropdown">
									<div>
										<li><a href="checkout_return.html">도서대출현황</a></li>
										<li><a href="book_request.html">희망도서신청</a></li>
										<li><a href="review.html">나만의한줄평</a></li>
										<li><a href="mbti.html">도서관NPC테스트</a></li>
									</div>
								</ul></li>
						</ul>
					</nav>
				</div>
			</section>
		</div>

		<div class="box">
			<aside>
				<ul>
					<li id="strong">나만의 도서관</li>
					<li><a href="checkout_return.html">도서대출현황</a></li>
					<li><a href="book_request.html">희망도서 신청</a></li>
					<li><a href="review.html">나만의 한줄평</a></li>
					<li><a href="mbti.html">도서관 NPC 테스트</a></li>
				</ul>
			</aside>
			<div class="board_wrap">
				<div id="location">
					<div class="loc_title">
						<h2>한줄평 작성</h2>
					</div>
					<div class="loc_history">
						홈 &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 나만의한줄평 </b>
					</div>
				</div>
				<div class="board_table">
					<table>
						<colgroup>
							<col width="15%;" />
							<col width="40%;" />
							<col width="10%;" />
							<col width="45%;" />
						</colgroup>
						<thead>
							<tr>
								<th><span>제목</span></th>
								<td colspan="2"><input type="text" placeholder="제목 입력"></td>
								<td><input type="button" class="btn-dark" id="search_btn"
									value="책 검색"></td>
							</tr>
						</thead>
						<thead>
							<tr>
								<th><span>기록할 책</span></th>
								<td colspan="3">동의보감</td>
							</tr>
							<tr>
								<th><span>작가</span></th>
								<td colspan="3">허준</td>
							</tr>
						</thead>
						<tr>
						<td colspan="4">
							<textarea placeholder="당신의 이야기를 들려주세요"></textarea>
						</td>
						</tr>
					</table>
				</div>
				<!-- 
				<div class="board_write">
					<div class="title">
						<p>
							<span>제목</span> <input type="text" placeholder="제목 입력"> <input
								type="button" class="btn-dark" id="search_btn" value="책 검색">
						</p>
						<p>
							<span>기록할 책</span> <input type="hidden" value="" id="book_title">
						</p>
					</div>
					<div class="cont">
						<textarea placeholder="당신의 이야기를 들려주세요"></textarea>
					</div>
				</div>
				 -->
				<div class="bt_wrap">
					<a href="#" class="submit">등록</a> <a href="project.html"
						class="submit">취소</a>
					<!-- 글 작성 게시판 마다 링크 바꿔야함-->
				</div>

			</div>
		</div>
		<footer>
			<div class="box">
				<nav id="bottom_menu">
					<ul>
						<li><a href="tos.html">이용약관</a></li>
						<li><a href="privacy.html">개인정보처리방침</a></li>
						<li><a href="use.html">도서관운영조례</a></li>
					</ul>
				</nav>
				<div class="items">
					<ul>
						<li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights
							Reserved.</li>
					</ul>
				</div>
			</div>
		</footer>
</body>
</html>