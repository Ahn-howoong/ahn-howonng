<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: 나만의한줄평</title>
<!-- Bootstrap CSS -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review_view.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
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
<script>
        $(document).ready(function () {
            $(".nav_container nav ul li").mouseenter(function (e) {
                $(".nav_container nav ul li a").siblings(".nav_dropdown").show();
            });

            $("nav").mouseleave(function () {
                $(".nav_dropdown").hide();
            });

            $(".nav_dropdown div").mouseenter(function () {
                $(this).parentsUntil("li").parent().css("background-color", "#ffe695");
            });

            $(".nav_dropdown div").mouseleave(function () {
                $(this).parentsUntil("li").parent().css("background-color", "#fff");
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
						<h2>나만의 한줄평</h2>
					</div>
					<div class="loc_history">
						홈 &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 나만의한줄평 </b>
					</div>
				</div>
				<div class="box">
					<div class="board_write">
						<div class="title">
							<h5>${vo.subject}</h5>
							<hr>
							<span>작성자 &nbsp;|&nbsp; <b>${vo.id}</b></span> <span>작성일
								&nbsp;|&nbsp; <b>${fn:split(vo.regdate, ' ')[0]}</b>
							</span> <span>조회수 &nbsp;|&nbsp; <b>${vo.readhit}</b></span>
							<hr>
							<div class="cont">${vo.content}</div>
							<hr>
							<div class="book_info">
								<img src="${vo.thumbnail}">
								<div class="book_detail">
									<b>읽은 책</b>&nbsp;|&nbsp;${vo.title}<br>
									<b>작가</b>&nbsp;|&nbsp;${vo.authors}
								</div>
							</div>
							<hr>
							<div class="bt_wrap">
								<input type="button" value="수정"
									onclick="location.href='modify_form.do?idx=${vo.idx}'">
								<input type="button" value="삭제"
									onclick="location.href='modify_form.do?idx=${vo.idx}'">
								<input type="button" value="목록"
									onclick="location.href='review.do'">
								<!-- 글 작성 게시판 마다 링크 바꿔야함-->
							</div>
						</div>
					</div>
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
	</div>
</body>
</html>