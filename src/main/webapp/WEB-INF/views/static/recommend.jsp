<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/static/recommend.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/recommend.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 추천도서</title>
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
                            <li><a href="search.html" class="title">자료검색</a>
                                <ul class="nav_dropdown">
                                    <div class="menu_bd">
                                        <li><a href="search.html">통합검색</a></li>
                                        <li><a href="recommend.html">추천도서</a></li>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="info.html" class="title">도서관소개</a>
                                <ul class="nav_dropdown">
                                    <div class="menu_bd">
                                        <li><a href="info.html">도서관 안내</a></li>
                                        <li><a href="borrow.html">대출반납안내</a></li>
                                        <li><a href="map.html">찾아오시는길</a></li>
                                        <li><a href="join.html">회원증 발급</a></li>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="project.html" class="title">열린공간</a>
                                <ul class="nav_dropdown">
                                    <div class="menu_bd">
                                        <li><a href="project.html">공지사항</a></li>
                                        <li><a href="lost.html">자주하는질문</a></li>
                                        <li><a href="qna.html">Q&A 게시판</a></li>
                                        <li><a href="event.html">행사안내</a></li>
                                    </div>
                                </ul>
                            </li>
                            <li><a href="checkout_return.html" class="title">나만의도서관</a>
                                <ul class="nav_dropdown">
                                    <div>
                                        <li><a href="checkout_return.html">도서대출현황</a></li>
                                        <li><a href="book_request.html">희망도서신청</a></li>
                                        <li><a href="review.html">나만의한줄평</a></li>
                                        <li><a href="mbti.html">도서관NPC테스트</a></li>
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

            <div class="main">
                <h1 style="font-size: 32px;"> 자료검색</h1>
                <div class="loc_history">
                    홈 &nbsp;>&nbsp; 자료검색 &nbsp;> &nbsp; <b> 추천도서 </b>
                </div>
                <div class="container2">

                    <ul class="tabs">
                        <li class="tab-link current" data-tab="tab-1"><a href="#">사서추천도서</a></li>
                        <li class="tab-link" data-tab="tab-2"><a href="#">베스트셀러</a></li>
                        <li class="tab-link" data-tab="tab-3"><a href="#">신간도서</a> </li>
                        
                    </ul>

                    <div id="tab-1" class="tab-content current">
                      
                    </div>
                    <div id="tab-2" class="tab-content">
                        
                    </div>
                    <div id="tab-3" class="tab-content">
                        
                    </div>
                </div><!-- container -->
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
                        <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>