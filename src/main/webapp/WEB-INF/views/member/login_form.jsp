<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<title>진리도서관 :: 로그인</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_form.css">
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
</head>
<body>
    <div id="all">
        <header>
            <div class="box"> 
              <nav id="menu">
                <ul id="top_menu">
                  <li>로그인</li><li>|</li>
                  <li>로그아웃</li><li>|</li>
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
                    <li id="strong">나만의 도서관</li>
                    <li><a href="#">도서 대출/반납/예약</a></li>
                    <li><a href="#">희망도서 신청</a></li>
                    <li><a href="#">나만의 한줄평</a></li>
                    <li><a href="#">도서관 NPC 테스트</a></li>
                </ul>
            </aside>
            <div class="regi">
                <div class="wrap wd668">
                    <div class="container">
                        <div class="form_txtInput">
                            <h2 class="sub_tit_txt">로그인</h2>
                            <p class="exTxt">로그인을 하시면 더 많은 도서관 서비스를 이용할 수 있습니다.</p>
                            <div class="join_form">
                            	<form id="loginform">
                                <table>
                                    <colgroup>
                                        <col width="30%" />
                                        <col width="auto" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><span>아이디</span></th>
                                            <td><input type="text" placeholder="ID 를 입력하세요." name="id"></td>
                                        </tr>
                                        <tr>
                                            <th><span>비밀번호</span></th>
                                            <td><input type="password" placeholder="비밀번호를 입력해주세요." name="pwd"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                </form>
                                <div class="btn_wrap">
                                    <a href="javascript:send(document.getElementById('loginform'));">로그인</a>
                                </div>
                                
                            </div> <!-- form_txtInput E -->
                        </div><!-- content E-->
                    </div> <!-- container E -->
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
                            <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
                        </ul>
                    </div>
                </div>
            </footer>
        </div>
</body>
</html>