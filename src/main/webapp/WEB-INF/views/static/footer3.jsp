<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관운영조례</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/footer3.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

<script>
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
			});
</script>
</head>
<body>
	<div id="all">
		<header>
			<div class="box">
				<nav id="menu">
					<ul id="top_menu">
						<c:choose>
							<c:when test="${empty user}">
								<li><a href="login_form.do">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li>|</li>
						<li><a href="checkout.do">마이페이지</a></li>
					</ul>
				</nav>
				<div id="logo">
					<a href="main.do"><img
						src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
				</div>
			</div>
		</header>
		<div id="sticky">
			<section class="navigation box">
				<div class="nav_container">
					<nav>
						<ul>
							<li><a href="search.do" class="title">자료검색</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="search.do">통합검색</a></li>
										<li><a href="recommend.do">추천도서</a></li>
										<li><a href="request.do">희망도서신청</a></li>
									</div>
								</ul></li>
							<li><a href="library_guide.do" class="title">도서관소개</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="library_guide.do">도서관 안내</a></li>
										<li><a href="checkout_guide.do">대출반납안내</a></li>
										<li><a href="map.do">찾아오시는길</a></li>
										<li><a href="membership.do">회원증 발급</a></li>
									</div>
								</ul></li>
							<li><a href="notice_list.do" class="title">열린공간</a>
								<ul class="nav_dropdown">
									<div class="menu_bd">
										<li><a href="notice_list.do">공지사항</a></li>
										<li><a href="often.do">자주하는질문</a></li>
										<li><a href="qna_list.do">Q&A 게시판</a></li>
										<li><a href="eventlist.do">행사안내</a></li>
									</div>
								</ul></li>
							<li><a href="checkout.do" class="title">나만의도서관</a>
								<ul class="nav_dropdown">
									<div>
										<li><a href="checkout.do">도서대출현황</a></li>
										<li><a href="wish.do">관심도서목록</a></li>
										<li><a href="review.do">나만의한줄평</a></li>
										<li><a href="mbti.do">동화 MBTI 테스트</a></li>
									</div>
								</ul></li>
						</ul>
					</nav>
				</div>
			</section>
		</div>












		<div class="box">

			<h1>제정 2007.07.19 조례 제695호</h1>

			<ol>
				<li>
					<h3>제1장 총 칙</h3>
					<h5>제1조 (목적)</h5>
					<p>이 조례는 「도서관법」 제27조 및 제29조에 따라 도서 및 각종 자료의 수집·보존·열람·대출과 부속시설을
						공중의 이용에 제공하고, 다양한 문화프로그램을 활성화함으로써 지역문화예술진흥과 지역사회정보화, 평생교육에 이바지하기
						위한 서울특별시 영등포구립도서관(이하 “도서관”이라 한다) 설치 및 운영에 필요한 사항을 규정함을 목적으로 한다.</p>
				</li>
				<li>
					<h5>제2조 (설치)</h5>
					<p>이 조례에 따라 설치·운영하는 도서관은 서울특별시진리구(이하 “구”라 한다) 관할구역 안에 두며, 명칭 및
						위치는 별표 1과 같다.</p>
				</li>
				<li>
					<h5>제3조 (정의)</h5>
					<p>이 조례에서 사용하는 용어의 뜻은 다음과 같다.</p>
					<ol>
						<li>“도서관”이란 도서관자료를 수집·정리·분석·보존하여 공중에게 제공하여
							정보이용·조사·연구·학습·교양·평생교육 등에 이바지하는 시설을 말한다.</li>
						<li>“도서관자료”(이하 “자료”라 한다)란 도서관이 수집·정리·보존하는 자료로서 인쇄자료, 필사자료,
							시청각자료, 마이크로형태자료, 전자자료 그 밖에 장애인을 위한 특수자료 등 지식정보자원 전달을 목적으로 정보가 축적된
							모든 매체를 말한다.</li>
						<li>“대출자료”란 이용자가 도서관 밖으로 대출할 수 있는 자료를 말한다.</li>
						<li>“수수료”란 회원증 발급과 도서관에 비치된 자료나 정보를 복사하거나 인쇄하기 위하여 시설장비를 사용하는
							자에게 징수하는 비용을 말한다.</li>
						<li>“사용료”란 도서관의 시설을 사용하려는 자에게 징수하는 비용을 말한다.</li>
						<li>“수강료”란 도서관에서 교육·문화교실 등의 강좌를 수강하려고 신청하는 자에게 징수하는 비용을 말한다.</li>
						<li>“수탁자”란 도서관 운영 및 시설물 관리의 전부 또는 일부를 위탁받은 법인이나 단체를 말한다.</li>
					</ol>
				</li>
				<li>
					<h5>제4조 (기능)</h5>
					<p>도서관은 다음 각 호의 기능을 수행한다.</p>
					<ol>
						<li>자료의 수집·정리·보존 및 공중에 이용제공</li>
						<li>행정 및 사회 각 분야에 대하여 실생활에 필요한 자료와 정보의 제공</li>
						<li>강연회·전시회·독서회·문화행사 및 평생교육관련 행사의 주최 또는 장려</li>
						<li>다른 도서관 등 자료에 관한 조사·연구</li>
						<li>그 밖에 공공도서관 및 지역문화 진흥기관으로서의 기능수행에 필요한 업무</li>
					</ol>
				</li>
				<li>
					<h3>제2장 운영 및 위탁</h3>
					<h5>제5조 (운영 및 관리)</h5>
					<p>① 도서관의 운영 및 관리는 서울특별시 영등포구청장(이하 “구청장”이라 한다)이 한다. 다만, 구청장이
						필요하다고 인정하면 도서관 운영과 시설물 관리의 전부 또는 일부를 법인이나 단체에게 위탁할 수 있다.</p>
					<p>② 제1항에 따라 위탁하면 도서관의 운영·관리에 필요한 운영비는 예산의 범위 안에서 지원할 수 있다.</p>
				</li>
				<li>
					<h5>제6조 (조직 및 인력)</h5>
					<p>① 도서관에는 도서관장(이하 “관장”이라 한다)과 소속 직원을 둔다.</p>
					<p>② 관장은 사서직으로 보임하되 구청장이 임명하고, 위탁운영의 경우에 수탁자는 구청장의 승인을 받아 관장을
						임명하여야 한다.</p>
					<p>③ 관장은 도서관의 업무를 총괄하고, 소속 직원을 지휘·감독한다.</p>
				</li>
				<li>
					<h5>제7조 (수탁자의 선정)</h5>
					<p>① 수탁자의 선정은 서울특별시영등포구립도서관수탁자선정심의위원회(이하 “심의위원회”라 한다)의 심의를 거쳐
						결정한다. 다만, 구청장이「서울특별시 영등포구 도시시설관리공단 설치조례」제24조에 따라 시설관리공단에 도서관의 운영을
						대행하게 하면 그러하지 아니하다.</p>
					<p>② 심의위원회는 위원장 1명을 포함하여 7명 이내의 위원으로 구성하되 위원장은 부구청장으로 하고, 위원은
						관계공무원 및 해당분야에 학식과 경험이 있는 자로 위촉하며, 심의가 끝나면 자동 해산한다.</p>
					<p>③ 구청장은 수탁자를 선정한 후 선정결과를 신청자에게 통지하여야 한다.</p>
					<p>④ 심의위원회에 출석한 위원에게는 예산의 범위 안에서 수당과 여비를 지급할 수 있다.</p>
				</li>
				<li>
					<h5>제8조 (위탁기간)</h5>
					<p>도서관의 운영을 위탁하면 그 위탁기간은 3년을 원칙으로 하되, 3년을 단위로 그 기간을 연장할 수 있다.</p>
				</li>
				<li>
					<h5>제9조 (위탁의 철회)</h5>
					<p>① 구청장은 수탁자가 다음 각 호의 어느 하나에 해당하면 그 위탁계약을 철회할 수 있다.
					<ol>
						<li>수탁자가 본연의 의무를 이행하지 아니할 때</li>
						<li>수탁자가 수탁사무를 수행할 능력이 없다고 판단될 때</li>
						<li>수탁자가 관리·운영협약 조건을 위반한 때</li>
						<li>그 밖에 공익상 위탁을 계속할 수 없는 사유가 발생한 때</li>
					</ol>
					</p>
					<p>② 구청장이 제1항에 따라 도서관의 위탁계약을 철회하려면 미리 수탁자에게 의견진술의 기회를 주어야 하며, 그
						사유와 철회 일자를 철회 예정일 90일 전까지 수탁자에게 서면으로 통지하여야 한다.</p>
					<p>③ 구청장은 제1항에 따라 위탁계약을 철회할 경우에는 철회 예정일 30일전까지 수탁자를 선정하여야 한다.</p>
				</li>
				<li>
					<h5>제10조 (지도·감독)</h5>
					<p>① 구청장은 위탁사무를 지도·감독하여야 하며, 관계공무원으로 하여금 시설의 운영사항을 조사하게 하거나 장부와
						그 밖의 서류 등을 검사하게 할 수 있다. 이 경우 수탁자는 조사 및 검사에 적극 협조하여야 한다.</p>
					<p>② 구청장은 제1항의 조사 또는 검사결과 시정할 사항이 있으면 시정지시 등 필요한 조치를 명할 수 있다.</p>
				</li>
				<li>
					<h3>제3장 운영위원회</h3>
					<h5>제11조 (운영위원회 구성)</h5>
					<p>① 도서관의 효율적인 운영을 위하여 도서관운영위원회(이하 “운영위원회”라 한다)를 둔다.</p>
					<p>② 운영위원회는 위원장을 포함한 10명 이상 15명 이하의 위원으로 구성하며, 위촉위원의 임기는 2년으로
						하되 연임할 수 있다.</p>
					<p>③ 위원은 관장과 문화계·교육계 인사 및 지역주민대표 등 도서관 운영에 관한 전문지식과 경험을 갖춘 자 중
						관장이 위촉하는 자로 하며, 위원장과 부위원장은 위원 중에서 호선한다.</p>
					<p>④ 위원장은 운영위원회를 대표하고 회무를 총괄한다.</p>
					<p>⑤ 부위원장은 위원장을 보좌하며 위원장이 부득이한 사정으로 직무를 수행할 수 없는 경우에 그 직무를
						대행한다.</p>
					<p>⑥ 운영위원회의 사무처리를 위하여 간사 1명을 두되, 간사는 위원장이 선임한다.</p>
				</li>
				<li>
					<h5>제12조 (운영위원회 기능)</h5>
					<p>운영위원회는 다음 각 호의 사항을 심의한다.</p>
					<ol>
						<li>도서관의 운영과 발전을 위한 기본방침에 관한 사항</li>
						<li>자료의 수집·열람 및 대출 등 구민 편익증진에 관한 사항</li>
						<li>지역 문화사업 및 평생교육의 지원에 관한 사항</li>
						<li>각종 문화시설과 자료교환 및 업무협력에 관한 사항</li>
						<li>자료의 선정에 관한 사항</li>
						<li>그 밖의 도서관 관리 및 운영지원에 관한 사항 등</li>
					</ol>
				</li>
				<li>
					<h5>제13조 (회의 및 수당)</h5>
					<p>① 운영위원회 정기회의는 연 1회 개최하며, 임시회의는 위원장이 필요하다고 인정할 때에 수시로 개최한다.</p>
					<p>② 회의는 재적위원 과반수의 출석으로 개회하고 출석위원 과반수의 찬성으로 의결한다.</p>
					<p>③ 회의에 출석한 위원에게는 도서관 운영예산의 범위 안에서 회의참석 수당을 지급할 수 있다.</p>
				</li>
				<li>
					<h5>제14조 (위원의 해촉)</h5>
					<p>운영위원회의 위원이 다음 각 호의 어느 하나에 해당하는 사유가 있으면 임기 중이라도 해촉할 수 있다.</p>
					<ol>
						<li>질병으로 장기 치료 또는 요양 중이거나 해외에 체류하는 경우</li>
						<li>운영위원회 회의에 장기불참 등 직무를 수행하기가 부적당하다고 판단될 경우</li>
						<li>본인의 개인적 사유로 해촉을 희망하는 경우</li>
					</ol>
				</li>
				<li>
					<h3>제4장 도서관 이용</h3>
					<h5>제15조 (시설사용 등)</h5>
					<p>① 도서관 시설의 사용, 도서의 열람 및 대출 등은 관장의 허가를 받아야 하며, 사용가능한 시설의 사용허가
						또한 같다.</p>
					<p>② 제1항의 도서관 부속시설을 사용하려면 그 사용내역 등을 명시하여야 한다.</p>
				</li>
				<li>
					<h5>제16조 (사용허가의 취소 및 정지)</h5>
					<p>① 관장은 다음 각 호의 어느 하나에 해당하면 부속시설의 사용허가를 취소할 수 있다.
					<ol>
						<li>공공질서와 미풍양속을 저해한 때</li>
						<li>사용허가의 조건을 위반한 때</li>
						<li>사용료를 기일 내에 납부하지 아니한 때</li>
					</ol>
					</p>
					<p>② 관장은 다음 각 호의 어느 하나에 해당하면 부속시설의 사용을 일시 정지할 수 있다.
					<ol>
						<li>도서관 시설의 유지 관리에 지장이 있다고 판단될 때</li>
						<li>도서관의 질서유지가 심히 어려울 때</li>
					</ol>
					</p>
				</li>
				<li>
					<h5>제17조 (사용료 등 징수)</h5>
					<p>① 도서관 부속시설의 사용료 및 이용 수수료는 별표 2 에서 정하는 바에 따른다. 다만, 사용료 등 징수
						예외로 시설의 사용료의 전부 또는 일부를 감면할 수 있다.</p>
					<p>② 제1항에 따른 도서관 부속시설의 사용료 등의 감면범위는 다음과 같다.
					<ol>
						<li>국가 또는 지방자치단체가 주최하는 행사는 전액 감면</li>
						<li>비영리를 목적으로 국가 또는 지방자치단체가 후원하는 행사는 100분의 50을 감면</li>
					</ol>
					</p>
				</li>
				<li>
					<h5>제18조 (양도금지)</h5>
					<p>제15조에 따라 시설의 사용허가를 받은 자는 사용권을 제3자에게 양도나 대여할 수 없다.</p>
				</li>
				<li>
					<h5>제19조 (대출)</h5>
					<p>① 관장은 다음 각 호의 어느 하나에 해당하는 자에게 자료를 대출할 수 있다.
					<ol>
						<li>도서관에 회원으로 등록된 자</li>
						<li>공무수행 등 공적인 연구목적으로 당해 기관장이 발급한 신분증 소지자</li>
						<li>그 밖에 관장이 인정하는 자</li>
					</ol>
					</p>
					<p>② 희귀자료·귀중자료·고서 등의 자료와 그 밖에 관장이 금지할 필요가 있다고 인정하면 자료의 대출을 제한할
						수 있다.</p>
					<p>③ 대출자료의 대상·권수 및 대출기간·반납·대출정지 등은 관장이 정한다.</p>
				</li>
				<li>
					<h5>제20조 (변상책임)</h5>
					<p>① 자료를 잃어버리거나 훼손하면 같은 자료로 변상하고, 같은 자료로 변상이 불가능하면 시가에 상당하는
						금액으로 변상하여야 한다.</p>
					<p>② 도서관의 비품 및 시설물을 훼손하거나 분실하면 제1항과 같다.</p>
					<p>③ 제1항 및 제2항에 불구하고 천재지변이나 불가피한 사유가 있으면 그러하지 아니하다.</p>
				</li>
				<li>
					<h5>제21조 (입장의 제한)</h5>
					<p>관장은 도서관의 안전과 질서를 저해할 수 있다고 판단되는 자에게 입장을 제한하거나 퇴장을 명할 수 있다.</p>
				</li>
				<li>
					<h3>제5장 자료관리</h3>
					<h5>제22조 (기증자료)</h5>
					<p>① 도서관에 기증된 자료는 선별하여 자료부에 등재한 후 열람하게 하여야 한다.</p>
					<p>② 관장은 기증받은 자료가 도서관 장서로서 적합하지 않다고 판단되면 마을문고 및 유관단체 등에 재 기증
						처리할 수 있다.</p>
				</li>
				<li>
					<h5>제23조 (위탁자료)</h5>
					<p>① 공중의 열람과 이용을 목적으로 도서관에 자료를 위탁하려는 자는 위탁자료 품목을 작성하여 관장의 허가를
						받은 후 위탁할 수 있다.</p>
					<p>② 위탁자료는 도서관 소장자료와 동일하게 취급·관리하되, 위탁자의 청구가 있거나 도서관의 형편에 따라 이를
						위탁자에게 반환할 수 있다.</p>
				</li>
				<li>
					<h5>제24조 (행정자료)</h5>
					<p>구본청, 구의회, 보건소의 물품출납원은 각종 간행물 등 행정 자료 발간 시 1부를 도서관에 송부하여야 한다.</p>
				</li>
				<li>
					<h5>제25조 (자료의 교환·이관·폐기 및 제적)</h5>
					<p>① 자료의 효율적 이용을 위하여 다른 도서관 등 문화시설과 자료를 상호 교환 및 이관할 수 있고, 이용가치가
						없거나 오손된 자료는 폐기하거나 제적할 수 있다.</p>
					<p>② 자료의 폐기 또는 제적의 범위는 연간 전체 보유 장서의 100분의 5를 초과 할 수 없다. 다만,
						천재지변이나 그 밖에 이에 준하는 사태로 손실하는 경우에는 그러하지 아니하다.</p>
				</li>
				<li>
					<h3>제6장 문화사업</h3>
					<h5>제26조 (문화시설과의 협력)</h5>
					<p>도서관은 그 목적을 달성하기 위하여 박물관·미술관·문화원·문고 등 각종 문화시설과 협력하여야 한다.</p>
				</li>
				<li>
					<h5>제27조 (문화강좌 개설 등)</h5>
					<p>관장은 독서진흥과 각 분야의 지식·정보제공 및 지역문화 창달을 위하여 문화강좌 개설 등 필요한 문화사업을 할
						수 있다.</p>
				</li>
				<li>
					<h5>제28조 (시행규칙)</h5>
					<p>이 조례 시행에 필요한 사항은 규칙으로 정한다.</p>
				</li>
				<li style="height: 80px;">
					<h3>부 칙</h3>
					<p>이 조례는 공포한 날부터 시행한다.</p>
				</li>
			</ol>
		</div>
		<footer>
			<div class="box">
				<nav id="bottom_menu">
					<ul>
						<li><a href="footer1.do">이용약관</a></li>
						<li><a href="footer2.do">개인정보처리방침</a></li>
						<li><a href="footer3.do">도서관운영조례</a></li>
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