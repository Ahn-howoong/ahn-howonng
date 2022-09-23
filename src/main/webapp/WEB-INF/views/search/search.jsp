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
	href="${pageContext.request.contextPath}/resources/css/search/search.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 통합검색</title>
<script type="text/javascript">
	$(document).ready(
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
				
		
				var str = "";
				
				<c:forEach var="vo" items="${list}">
					
				
									
					$.ajax({
	                    method: "GET",
	                    url: "https://dapi.kakao.com/v3/search/book",
	                    data: { query: "${vo.bname}" },
	                    headers: { Authorization: "KakaoAK 8e4c9f81d06f13ce398748177abb8d35" }
	                })
	                    .done(function (msg) {
	                       
	                    	// console.log(${list.size()});
	                    	
	                        	str += '<ul class="book_box"><li><a href="book_info.do?search=${vo.bname}"><img src="';
	                            str += msg.documents[0].thumbnail;      
	                            str += '" class="book_size"></a><dl><dt><a href="book_info.do?search=${vo.bname}">${vo.bname}</a></dt><dd><span>저자</span> ${vo.author}</dd><dd><span>출판사</span>'; 
	                            str += msg.documents[0].publisher;
	                            str += '</dd><dd><span>발행연도</span> ${vo.pdate}</dd><dd id="bottom_line"><span>등록번호</span> ${vo.reginum}</dd><dd>';
	                            str += msg.documents[0].contents.substr(0, 97);
	                            str += '...</dd></dl></li></ul>';
	                            
	                            document.getElementById("book_div").innerHTML = str;
	                           
	                    });
					</c:forEach>
					
					
				
			});
	
		
	
	function search() {

		var target = document.getElementById("select");

		var select = target.options[target.selectedIndex].value;

		var search = document.getElementById("search").value.trim();
		if (search == '') {
			// search에 값이 비어있으면 gogaeklist.do?search= 이렇게만 넘어가므로
			// gogaeklist.do?search=all로 넘어갈 수 있도록 해준다.
			search = 'all';
		}
		location.href = "search.do?page=${empty param.page ? 1 : param.page}&search="
				+ search + "&select=" + select;
	}
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
				<h1 style="font-size: 32px">통합검색</h1>
				<div class="loc_history">
					홈 &nbsp;>&nbsp; 자료검색 &nbsp;> &nbsp; <b> 통합검색 </b>
				</div>
				<div id="search_bar">
					<select style="margin-right: 10px;" id="select">
						<option value="all">전체 검색</option>
						<option value="bname">책 제목</option>
						<option value="author">저자 이름</option>
					</select> <input type="text" placeholder="검색어를 입력하세요"
						style="margin-right: 10px;" id="search"> <input
						type="button" id="btn" class="btn btn-dark" value="검색"
						onclick="search();">
				</div>

				<div id="book_div">
					<%-- <c:forEach var="vo" items="${list}">
						<ul class="book_box">
							<li><img src="" class="book_size" id="thumbnail">
								<dl>
									<dt>
										<a href="book_info.html">${vo.bname}</a>
									</dt>
									<dd>
										<span>저자</span> ${vo.author}
									</dd>
									<dd>
										<span>출판사</span> 눌와
									</dd>
									<dd>
										<span>발행연도</span> ${vo.pdate}
									</dd>
									<dd id="bottom_line">
										<span>등록번호</span> ${vo.reginum}
									</dd>
									<dd id="contents"></dd>
								</dl></li>
						</ul>
					</c:forEach> --%>
				</div>
				<div id="pageMenu">
					<c:if test="${!empty pageMenu}">
                		<p>${pageMenu}</p>
                	</c:if>
                </div>
			</section>
		</div>

		<footer>
			<div class="box">
				<nav id="bottom_menu">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><a href="privacy.htmls">개인정보처리방침</a></li>
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