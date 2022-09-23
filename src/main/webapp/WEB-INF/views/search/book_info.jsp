<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search/book_info.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 책 정보</title>
<script type="text/javascript">
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
    
    <c:forEach var="vo" items="${list}">
    $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v3/search/book",
        data: { query: "${vo.bname}" },
        headers: { Authorization: "KakaoAK 8e4c9f81d06f13ce398748177abb8d35" }
    })
        .done(function (msg) {
            	
                var thumbnail = msg.documents[0].thumbnail;      
                var publisher = msg.documents[0].publisher;
                var isbn = msg.documents[0].isbn;
                var contents = msg.documents[0].contents.substr(0, 97);
                
                document.getElementById("thumbnail").src = msg.documents[0].thumbnail;
                document.getElementById("thumbnail2").src = msg.documents[0].thumbnail;
                document.getElementById("publisher").innerHTML = msg.documents[0].publisher;
                document.getElementById("isbn").innerHTML = msg.documents[0].isbn;
                document.getElementById("contents").innerHTML = msg.documents[0].contents;
        });
    </c:forEach>

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
							<li><a href="#" class="title">자료검색</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="search.html">통합검색</a></li>
										<li><a href="recommend.html">추천도서</a></li>
									</div>
								</ul></li>
							<li><a href="#" class="title">도서관소개</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="info.html">도서관 안내</a></li>
										<li><a href="borrow.html">대출반납안내</a></li>
										<li><a href="map.html">찾아오시는길</a></li>
										<li><a href="join.html">회원증 발급</a></li>
									</div>
								</ul></li>
							<li><a href="#" class="title">열린공간</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="project.html">공지사항</a></li>
										<li><a href="#">자주하는질문</a></li>
										<li><a href="#">Q&A 게시판</a></li>
										<li><a href="event.html">행사안내</a></li>
									</div>
								</ul></li>
							<li><a href="#" class="title">나만의도서관</a>
								<ul class="nav_dropdown">
									<div>
										<li><a href="checkout_return.html">도서대출현황</a></li>
										<li><a href="book_request.html">희망도서신청</a></li>
										<li><a href="review.html">나만의한줄평</a></li>
										<li><a href="#">도서관NPC테스트</a></li>
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
					<li id="strong">자료검색</li>
					<li><a href="search.html">통합검색</a></li>
					<li><a href="recommend.html">추천도서</a></li>
				</ul>
			</aside>
			<section class="main">
				<c:forEach var="vo" items="${list}">
				<h1 style="font-size: 32px;">통합검색</h1>
				<div class="loc_history">
					홈 &nbsp;>&nbsp; 통합검색 &nbsp;> &nbsp; <b> 상세페이지 </b>
				</div>
				<div>
					<ul class="book_box">
						<li><img src="" class="book_size" id="thumbnail">
							<dl class="font_height">
								<dt>${vo.bname}</dt>
								<dd>ISBN : <span id="isbn"></span></dd>
								<dd>저자 : ${vo.author}</dd>
								<dd>발행년도 : ${vo.pdate}</dd>
								<dd>출판사 : <span id="publisher"></span></dd>
								<dd>등록번호 : ${vo.reginum}</dd>
							</dl></li>
					</ul>
				</div>
				<div>
					<h2>소장 위치</h2>
					<table>
						<tr>
							<th>기관명</th>
							<th>자료실명</th>
							<th>등록번호</th>
							<th>도서상태</th>
							<th>대출예약</th>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>종합자료실 4관</td>
							<td>EMA00884</td>
							<td>대출가능</td>
							<td><input type="button" value="예약신청" id="btn"></td>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>종합자료실 2관</td>
							<td>MAZ00666</td>
							<td>대출가능</td>
							<td><input type="button" value="예약신청" id="btn"></td>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>종합자료실 1관</td>
							<td>ETA09914</td>
							<td>대출불가</td>
							<td><input type="button" value="예약불가" id="btn"></td>
						</tr>
					</table>
				</div>
				</c:forEach>
				<div style="text-align: center;">
					<button id="heart">관심도서담기</button>
				</div>
				<br>
				<br>
				<br>
				<div id="red_box">
					<button id="red">예약/신청 안내</button>
					<p id="red_text">도서상태가 대출중 도서의 경우 예약 가능하며 보존서고 도서의 경우 도서상태가
						신청가능 일 경우에 신청 가능 부득이하게 취소해야 할 경우는 [홈페이지>나의공간>내서재>신청]에서 취소 가능합니다.</p>
				</div>
				<div>
					<h1 style="margin: 20px; margin-top: 60px;">책소개</h1>
					<ul class="book_box2">
						<li><img src="" class="book_size2" id="thumbnail2">
							<dl class="dl2">
								<dd id="contents"></dd>
							</dl></li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="heart" value="돌아가기" onclick="location.href='search.do'">
					</div>
				</div>
			</section>
		</div>

		<footer>
			<div class="box">
				<nav id="bottom_menu">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><a href="privacy.html">개인정보처리방침</a></li>
						<li><a href="#">도서관운영조례</a></li>
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