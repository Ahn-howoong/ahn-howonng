<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
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
	
	  $('ul.n_menu li').click(function(){
	     var tab_id = $(this).attr('data-tab');
	
	     $('ul.n_menu li').removeClass('current');
	     $('.tab-content').removeClass('current');
	
	     $(this).addClass('current');
	     $("#"+tab_id).addClass('current');
	  })
	
	   $('ul.tabs li').click(function(){
	     var tab_id = $(this).attr('data-tab');
	
	     $('ul.tabs li').removeClass('current');
	     $('.tab_content').removeClass('current');
	
	     $(this).addClass('current');
	     $("#"+tab_id).addClass('current');
	   })
	   $.ajax({
	          method: "GET",
	          url: "https://dapi.kakao.com/v3/search/book?target=title",
	          data: { query : "소설" },
	          headers : { Authorization: "KakaoAK 8e4c9f81d06f13ce398748177abb8d35" }
	      })
	          .done(function (msg) {
	              console.log(msg);
	              for(var i=0; i<4; i++) {
	                var str = msg.documents[i].title;
	                if(msg.documents[i].title.length > 14) {
	                  str = str.substr(0, 14) + "..";
	                }
	                $("#tab1_img").append("<img src='" + msg.documents[i].thumbnail + "'>");
	                $("#tab1_title").append("<p>" + str + "</p>");
	                $("#tab3").append("<img src='" + msg.documents[i].thumbnail + "'>");
	              }
	              for(var i=4; i<8; i++) {
	                $("#tab2").append("<img src='" + msg.documents[i].thumbnail + "'>");
	                $("#tab4").append("<img src='" + msg.documents[i].thumbnail + "'>");
	              }
	          });
	});
	function send(f) {
		let url = "login.do";
		let param = "id=" + f.id.value + "&pwd=" + f.pwd.value;
		
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			// no_id, no_pwd, clear 중 하나를 받는다.
			let data = xhr.responseText;
			
			if(data == 'no_id') {
				alert("아이디가 없습니다.");
			} else if (data == 'no_pwd') {
				alert("비밀번호가 틀렸습니다.");
			} else {
				location.href="main.do";
			}
		}
	}
</script>
<style>
.background1::after {
	width: 100%;
	height: 600px;
	content: "";
	background:
		url("${pageContext.request.contextPath}/resources/img/background1.png");
	background-position: center;
	background-repeat: no-repeat;
	position: absolute;
	top: 220px;
	left: 0;
	z-index: -999;
	opacity: 0.5;
}
</style>
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
										<li><a href="review.do">나만의한줄평</a></li>
										<li><a href="mbti.html">도서관NPC테스트</a></li>
									</div>
								</ul></li>
						</ul>
					</nav>
				</div>
			</section>
		</div>
		<div class="background1">
			<div class="box">
				<div id="search">
					<div>
						<span>통합검색</span> <input name="search"
							placeholder="도서명 또는 저자명을 입력해주세요"
							style="width: 410px; height: 50px; border: none;"> <input
							type="button" value="검색" id="btn">
					</div>
				</div>
			</div>
			<div class="box">
				<div class="box1">

					<c:choose>
						<c:when test="${empty user}">
							<div class="login">
								<h4>로그인</h4>
								<form>
									<input type="text" name="id" placeholder="아이디"><br>
									<input type="password" name="pwd" placeholder="비밀번호"><br>
									<input type="button" value="로그인" onclick="send(this.form);">
									<p>
										<a href="regi_form.do">회원가입</a>
									</p>
								</form>
							</div>
							<div class="mypage">
								<h5>나의 도서관</h5>
								<ul>
									<li><a href="#">나의 서재</a></li>
									<li><a href="checkout_return.html">대출조회/반납연기</a></li>
									<li><a href="book_request.html">희망도서 신청</a></li>
									<li><a href="recommend.html">맞춤도서 추천</a></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="login">
								<h4>
									<span>${user.name}</span>님 환영합니다
								</h4>
								<hr>
								<ul>
									<li><a href="#">나의 서재</a></li>
									<li><a href="checkout_return.html">대출조회/반납연기</a></li>
									<li><a href="book_request.html">희망도서 신청</a></li>
									<li><a href="recommend.html">맞춤도서 추천</a></li>
								</ul>
								<hr>
								<form>
									<input type="button" value="로그아웃"
										onclick="location.href='logout.do'">
								</form>
							</div>
							<div class="mypage">
								<a href="review.do"><img align="center"
									src="${pageContext.request.contextPath}/resources/img/review_icon.png"></a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="box2">
					<div id="carouselExampleSlidesOnly" class="carousel slide slider1"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text1.png"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text2.png"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text3.png"
									alt="Third slide">
							</div>
						</div>
					</div>
				</div>
				<div class="box3">
					<table border="1" bordercolor="#ccc">
						<tr>
							<td><a href="checkout_return.html"><img
									src="${pageContext.request.contextPath}/resources/img/icon1.png"></a></td>
							<td><a href="join.html"><img
									src="${pageContext.request.contextPath}/resources/img/icon2.png"></a></td>
						</tr>
						<tr>
							<td><a href="info.html"><img
									src="${pageContext.request.contextPath}/resources/img/icon3.png"></a></td>
							<td><a href="project.html"><img
									src="${pageContext.request.contextPath}/resources/img/icon4.png"></a></td>
						</tr>
					</table>
					<a href="mbti.html"><img
						src="${pageContext.request.contextPath}/resources/img/mbti_logo.png"
						style="float: right;"></a>
				</div>
			</div>
		</div>
		<!-- <section class="box" style="height:500px">

    </section> -->
		<section class="box">
			<div id="carouselExampleIndicators" class="carousel slide slider2"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster1.png"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster2.png"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster3.png"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div class="notice">
				<ul class="n_menu">
					<li class="tab-link current" data-tab="tab-1">도서관 행사</li>
					<li class="tab-link" data-tab="tab-2">문화강좌</li>
					<li class="tab-link" data-tab="tab-3">프로그램 신청</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<a href="#">&lt;<b>책벌레 클럽 주최</b>&gt; 월간 독서 모임
					</a><br> <a href="#">&lt;<b>2022 여름 북토크</b>&gt; 이만큼 가까이 - 정세랑
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a><br> <a href="#">&lt;<b>책벌레 클럽 주최</b>&gt; 월간 독서 모임
					</a><br> <a href="#">&lt;<b>2022 여름 북토크</b>&gt; 이만큼 가까이 - 정세랑
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a>
				</div>
				<div id="tab-2" class="tab-content">
					<a href="#"><b>[문화강좌]</b> 2022년 4기(10~12월) 문화강좌 회원 모집</a><br>
					<a href="#"><b>[문화강좌]</b> 2022년 3기(7~9월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 2기(4~6월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 1기(2-3월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 4기(10~12월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 3기(7~9월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 2기(4~6월) 문화강좌 회원 모집</a><br>
				</div>
				<div id="tab-3" class="tab-content">
					<a href="#"><b>[독서문화프로그램]</b> 직장인을 위한 레벨업 프로젝트</a><br> <a
						href="#"><b>[2022책축제]</b> 창작 인형극</a><br> <a href="#"><b>[2022책축제]</b>
						그림책극장 체험키트 신청</a><br> <a href="#"><b>[독서문화프로그램]</b> 직장인을 위한
						레벨업 프로젝트</a><br> <a href="#"><b>[2022책축제]</b> 창작 인형극</a><br>
					<a href="#"><b>[2022책축제]</b> 그림책극장 체험키트 신청</a><br> <a href="#"><b>[2022책축제]</b>
						그림책극장 체험키트 신청</a><br>
				</div>
			</div>
		</section>
		<div class="box">
			<div class="container">
				<ul class="tabs">
					<li class="tab_link current" data-tab="tab1">사서 추천도서</li>
					<li class="tab_link" data-tab="tab2">대출베스트 도서</li>
					<li class="tab_link" data-tab="tab3">신착도서</li>
					<li class="tab_link" data-tab="tab4">이달의 도서</li>
				</ul>
				<div id="tab1" class="tab_content current">
					<div id="tab1_img"></div>
					<div id="tab1_title"></div>
				</div>
				<div id="tab2" class="tab_content"></div>
				<div id="tab3" class="tab_content"></div>
				<div id="tab4" class="tab_content"></div>
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