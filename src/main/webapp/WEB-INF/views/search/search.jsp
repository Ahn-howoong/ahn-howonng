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
                    <a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
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
                                </ul>
                            </li>
                            <li><a href="#" class="title">도서관소개</a>
                                <ul class="nav_dropdown">
                                    <div class="menu_bd">
                                        <li><a href="info.html">도서관 안내</a></li>
                                        <li><a href="borrow.html">대출반납안내</a></li>
                                        <li><a href="map.html">찾아오시는길</a></li>
                                        <li><a href="join.html">회원증 발급</a></li>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="#" class="title">열린공간</a>
                                <ul class="nav_dropdown">
                                    <div class="menu_bd">
                                        <li><a href="project.html">공지사항</a></li>
                                        <li><a href="#">자주하는질문</a></li>
                                        <li><a href="#">Q&A 게시판</a></li>
                                        <li><a href="event.html">행사안내</a></li>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="#" class="title">나만의도서관</a>
                                <ul class="nav_dropdown">
                                    <div>
                                        <li><a href="checkout_return.html">도서대출현황</a></li>
                                        <li><a href="book_request.html">희망도서신청</a></li>
                                        <li><a href="review.html">나만의한줄평</a></li>
                                        <li><a href="#">도서관NPC테스트</a></li>
                                    </div>
                                </ul>
                            </li>
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
                <h1 style="font-size:32px"> 통합검색</h1>
                <div class="loc_history">
                    홈 &nbsp;>&nbsp; 자료검색 &nbsp;> &nbsp; <b> 통합검색 </b>
                </div>
                <div id="search_bar">
                    <select style="margin-right: 10px;">
                        <option>전체 검색</option>
                        <option>책 제목</option>
                        <option>저자 이름</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요" style="margin-right: 10px;">
                    <button id="btn" class="btn btn-dark">검색</button>
                </div>
                
                <div>
                    <ul class="book_box">
                        <li> <img src="img/식물문답.jpg" class="book_size">
                            <dl>
                                <dt><a href="book_info.html">식물 문답 : 식물화가와 나누는 사소한 식물 이야기</a></dt>
                                <dd id="bottom_line">저자 : 조현진 | 지음출판사 : 눌와 | 발행연도 : 2021</dd>
                                <dd>열한 살 소녀 에리와 에미는 단짝 친구다. 할아버지의 병환으로 급작스레
                                    시골로 이사한 에리는 할아버지가 가꾸던 밭을 맡으면서 놀라운 자연의 세계를
                                    경험한다. 에리는 에미와 편지를 주고받으며 서로의 일상을 공유하고,
                                    따돌림으로 인해 마음의 문을 닫게 된 또 다른 친구 겐지를 조심스레 떠올린다.
                                    두 소녀는 에리의 밭에서 자라는 거미, 애벌레, 잡초 등 저마다의 속도로
                                    자라나는 동식물들을 직간접적으로 지켜보며 상처 입은 겐지를 다시 일어...</dd>
                            </dl>
                        </li>
                    </ul>
                    <ul class="book_box">
                        <li> <img src="img/book_re2.jpg" class="book_size">
                            <dl>
                                <dt><a href="#">수면의 과학 : 잠이 먼저 당신을 찾아오도록 만드는 수면 과학의 모든 것</a></dt>
                                <dd id="bottom_line">저자 : 헤더 다월-스미스 지음 | 김은지 옮김 | 출판사 : 시그마북스</dd>
                                <dd>어두운 밤, 어딘가로 달아난 잠을 붙잡고 싶은 당신을 위한 잠의 책.
                                    ‘잠을 잔다’라는 본능은 인간이 잠을 자도록 프로그램 되어 있기 때문에
                                    당연한 현상이다. 밤에 잠을 잘 못 잤을 때, 피곤할 때, 견딜 수 없는
                                    스트레스를 받을 때 인간은 잠을 찾고, 자고 싶어 한다. 수면 전문가인
                                    저자가 이 책에서 전하는 메시지는 간단하다. 인간은 잠을 자도록 되어
                                    있...</dd>
                            </dl>
                        </li>
                    </ul>
                    <ul class="book_box">
                        <li> <img src="img/book_re3.jpg" class="book_size">
                            <dl>
                                <dt><a href="#">사울 레이터의 모든 것</a></dt>
                                <dd id="bottom_line">지은이: 사울 레이터 | 출판사 : 윌북 | 발행연도 : 2021</dd>
                                <dd>평범한 일상 속에 삶의 핵심이 들어 있으며 아름다움이 그곳에 있다고 생각했던
                                    사울 레이터는 자유분방하면서도 예술적 영감으로 가득했던 뉴욕의 순간들을 날카롭고
                                    따스한 눈길로 캐치해냈고, 뒤늦게 평단의 주목을 받아 60년이 지나도 시간의 흐름과
                                    무관하게 독일, 미국, 일본, 영국, 프랑스 등 국경과 세대를 초월하여 대중들의 시선을 사로잡고 있다.
                                    스튜디오보다 거리, 유명인보다 행인, 연출된 장면보다 평범한 일상, 빛보다 비를 더 사랑하며 “나에게 ...</dd>
                            </dl>
                        </li>
                    </ul>
                    <ul class="book_box">
                        <li> <img src="img/book_re4.jpg" class="book_size">
                            <dl>
                                <dt><a href="#">불편한 편의점</a></dt>
                                <dd id="bottom_line">작가:김호연 | 출판사 : 나무옆의자 | 발행연도 : 2021</dd>
                                <dd>현실감 넘치는 캐릭터와 그들 간의 상호작용을 점입가경으로 형상화하는 데
                                    일가견이 있는 작가의 작품답게 이 소설에서도 독특한 개성과 사연을 지닌 인물들이
                                    차례로 등장해 서로 티격태격하며 별난 관계를 형성해간다. 고등학교에서 역사를
                                    가르치다 정년퇴임하여 매사에 교사 본능이 발동하는 편의점 사장 염 여사를 필두로
                                    20대 취준생 알바 시현, 50대 생계형 알바 오 여사, 매일 밤 야외 테이블에서
                                    참참참(참깨 ...</dd>
                            </dl>
                        </li>
                    </ul>
                    <ul class="book_box">
                        <li> <img src="img/book_re4.jpg" class="book_size">
                            <dl>
                                <dt><a href="#">불편한 편의점</a></dt>
                                <dd id="bottom_line">작가:김호연 | 출판사 : 나무옆의자 | 발행연도 : 2021</dd>
                                <dd>현실감 넘치는 캐릭터와 그들 간의 상호작용을 점입가경으로 형상화하는 데
                                    일가견이 있는 작가의 작품답게 이 소설에서도 독특한 개성과 사연을 지닌 인물들이
                                    차례로 등장해 서로 티격태격하며 별난 관계를 형성해간다. 고등학교에서 역사를
                                    가르치다 정년퇴임하여 매사에 교사 본능이 발동하는 편의점 사장 염 여사를 필두로
                                    20대 취준생 알바 시현, 50대 생계형 알바 오 여사, 매일 밤 야외 테이블에서
                                    참참참(참깨 ...</dd>
                            </dl>
                        </li>
                    </ul>
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
                        <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>