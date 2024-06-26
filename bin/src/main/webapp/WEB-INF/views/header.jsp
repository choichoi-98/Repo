
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon"
	href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/megabox.min.css"
	media="all">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<style>
#header .ci a {
	background:
		url(${pageContext.request.contextPath}/resources/image/header-logo.png)
		center center no-repeat;
	background-size: cover
}

.modal-layer2 .wrap .layer-header {
	background: #792828;
}

#gnb>ul>li>a:after {
	background: #792828;
}

.modal-layer .wrap .layer-header, .wrap .layer-header {
	background: #792828;
}

button.button.purple {
	background: #792828;
	color: white;
}

button.button.purple:hover {
	background: #792828;
	color: white;
}

#gnb>ul>li:nth-child(1) .gnb-depth2 ul {
	padding-left: 115px;
}

#gnb>ul>li:nth-child(2) .gnb-depth2 ul {
	padding-left: 206px;
}

#gnb>ul>li:nth-child(3) .gnb-depth2 ul {
	padding-left: 333px;
}

#gnb>ul>li:nth-child(5) .gnb-depth2 ul {
	padding-left: 816px;
}

#gnb>ul>li:nth-child(6) .gnb-depth2 ul {
	padding-left: 833px;
}

.button {
	border: 1px solid black;
	color: black;
}
</style>


<section class="alert-popup"
	style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 35%; left: 43%; width: 300px; opacity: 1; display: none;"
	id="login-alert-modal">
	<div class="wrap">
		<header class="layer-header">
			<h3 class="tit">알림</h3>
		</header>
		<div class="layer-con" style="height: 200px">
			<p class="txt-common">
				로그인 후 이용가능한 서비스입니다.<br>로그인 하시겠습니까?
			</p>
			<div class="btn-group">
				<button type="button" class="button lyclose">취소</button>
				<button id="login-alert-modal-ok" type="button"
					class="button purple confirm">확인</button>
			</div>
		</div>
		<button type="button" class="btn-layer-close">레이어 닫기</button>
	</div>
</section>

<div class="bg-modal" style="opacity: 0;"></div>
<!-- 로그인 모달 -->
<section id="layer_login_select" class="modal-layer"
	style="z-index: 5000;">
	<div class="wrap"
		style="width: 850px; height: 484px; margin-left: -425px; margin-top: -242px;">
		<header class="layer-header" header.js>
			<h3 class="tit">로그인</h3>
		</header>

		<div class="layer-con" style="height: 439px;">
			<!-- tab-cont-wrap -->
			<div class="tab-cont-wrap">
				<!-- **** tab 회원 로그인 **** -->
				<div id="login_tab_01" class="tab-cont on">

					<div class="login-member col-2 pt00">
						<!-- col-wrap -->
						<div class="col-wrap">
							<div class="col left">
								<div class="login-input-area">
									<form name="loginform"
										action="${pageContext.request.contextPath}/loginProcess"
										method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}"> <input autocomplete="off"
											name="MEMBER_ID" id="LoginId" maxlength="20" type="text"
											placeholder="아이디" title="아이디를 입력하세요"
											class="input-text strTrim">
										<!--아이디-->
										<!--아이디를 입력하세요-->
										<input autocomplete="off" name="MEMBER_PASS" id="LoginPass"
											maxlength="20" type="password" placeholder="비밀번호"
											title="비밀번호를 입력하세요" class="input-text mt15">
										<!--비밀번호-->
										<!--비밀번호를 입력하세요-->
										<div class="alert"></div>

										<!-- chk-util -->
										<div class="chk-util">
											<div class="left">
												<input type="checkbox" name="remember-me"> <label
													for="chkloginSave">로그인 유지하기<!--로그인 유지하기--></label>
											</div>
											<div class="right">
												<!-- <input id="chkIdSave" type="checkbox"> <label for="chkIdSave">아이디 저장아이디 저장</label> -->
											</div>
										</div>
										<!--// chk-util -->

										<!-- 로그인 버튼 -->
										<button id="btnLogin" type="submit"
											class="button purple large btn-login">
											로그인
											<!--로그인-->
										</button>

										<div class="link">
											<a href="${pageContext.request.contextPath}/member/findid"
												title="ID/PW 찾기 선택">ID/PW 찾기<!--ID/PW 찾기--></a> <a
												href="${pageContext.request.contextPath}/member/join"
												title="회원가입 선택">회원가입<!--회원가입--></a>
										</div>

										<div class="sns-login">
											<!-- <a href="javaScript:void(0)" lnkgTy="FACEBOOK" title="페이스북으로 로그인 선택"><img src="../../../static/pc/images/member/ico-facebook.png"  alt="페이스북">페이스북으로 로그인</a>-->
											<a href="#" id="" title="네이버로 로그인 선택"><img
												src="${pageContext.request.contextPath}/resources/image/social_login/ico-naver.png"
												alt="네이버"> <!--네이버--> 네이버로 로그인<!--네이버로 로그인--></a> <a
												href="#" title="카카오톡으로 로그인 선택"><img
												src="${pageContext.request.contextPath}/resources/image/social_login/ico-kakao.png"
												alt="카카오톡"> <!--카카오톡--> 카카오톡으로 로그인<!--카카오톡으로 로그인--></a> <a
												href="#" title="구글로 로그인 선택"><img
												src="${pageContext.request.contextPath}/resources/image/social_login/ico-google.png"
												alt="구글"> 구글로 로그인<!--페이코로 로그인--></a>
										</div>
									</form>
								</div>
							</div>
							<div class="col right">
								<div class="login-ad" id=""
									style="background-color: rgb(111, 111, 111); width: 380px; height: 380px;"></div>
							</div>
						</div>
						<!--// col-wrap -->
					</div>
				</div>
				<!--// tab 회원 로그인 -->

			</div>
			<!--// tab-cont-wrap -->
		</div>


		<button type="button" class="btn-modal-close">
			레이어 닫기
			<!--레이어 닫기-->
		</button>
	</div>
</section>


<!-- 로그인 실패 알림 모달 -->
<div class="alertStyle"
	style="position: fixed; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; width: 100%; height: 100%; z-index: 5005; display: none;"></div>
<section id="loginfailalert" class="alert-popup"
	style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 371px; left: 459.5px; width: 400px; opacity: 0; display: none;">
	<div class="wrap">
		<header class="layer-header">
			<h3 class="tit">알림</h3>
		</header>
		<div class="layer-con" style="height: 250px">
			<p class="txt-common">
				아이디 또는 비밀번호가 맞지 않습니다.<br>로그인 정보를 다시 확인바랍니다.
			</p>
			<div class="btn-group">
				<button type="button" class="button lyclose" style="display: none;"></button>
				<button id="loginfailok" type="button" class="button purple confirm">확인</button>
			</div>
		</div>
		<button type="button" class="btn-layer-close">레이어 닫기</button>
	</div>
</section>




<head>
<header id="header" class="main-header">
	<h1 class="ci">
		<a href="${pageContext.request.contextPath}/main"
			title="MoviePlus 메인으로 가기">MoviePlus</a>
	</h1>

	<div class="util-area">
		<div class="left-link">
			<a href="${pageContext.request.contextPath}/benefit/viplounge"
				title="VIP LOUNGE">VIP LOUNGE</a> <a
				href="${pageContext.request.contextPath}/benefit/membership"
				title="멤버십">멤버십</a> <a
				href="${pageContext.request.contextPath}/customer_service"
				title="고객센터">고객센터</a>
		</div>

		<div class="right-link">
			<!-- 로그인 전 -->
			<sec:authorize access="isAnonymous()">
				<div class="before" style="">
					<a id="header-login-btn" href="#" title="로그인">로그인</a> <a
						href="${pageContext.request.contextPath}/member/join" title="회원가입">회원가입</a>
				</div>
			</sec:authorize>

			<!-- 로그인 후 -->
			<sec:authorize access="isAuthenticated()">

				<div class="after" style="">
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<a href="${pageContext.request.contextPath}/manager" class=""
							title="관리자">관리자 페이지</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="${pageContext.request.contextPath}/admin" class=""
							title="관리자">관리자 페이지</a>
					</sec:authorize>
					<form action="${pageContext.request.contextPath}/member/logout"
						method="post" name="logout" id="logoutform"
						style="display: inline-block; line-height: 1.3; margin-left: 20px;">
						<a href="" class="" id="logout" title="로그아웃">로그아웃</a> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
					</form>
				</div>
			</sec:authorize>
			<a href="${pageContext.request.contextPath}/booking">빠른예매</a>
		</div>
	</div>

	<div class="link-area">
		<a href="#" id="header-sitemap-btn"
			class="header-open-layer btn-layer-sitemap" title="사이트맵">사이트맵</a> <a
			href="#" id="header-search-btn"
			class="header-open-layer btn-layer-search" title="검색">검색</a>
		<!-- target on // X 표시 -->
		<a href="${pageContext.request.contextPath}/booking/timetable"
			class="link-ticket" title="상영시간표">상영시간표</a> <a href="#"
			id="header-my-megabox-btn" class="header-open-layer btn-layer-mymega"
			title="나의 무비플러스">나의 무비플러스</a>
	</div>


	<nav id="gnb" style="background: #792828">
		<ul class="gnb-depth1">
			<li><a href="#" class="gnb-txt-movie" title="영화">영화</a>
				<div class="gnb-depth2">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/movie/movieListPage"
							title="전체영화">전체영화</a></li>
						<li><a
							href="${pageContext.request.contextPath}/moviepost/all"
							title="무비포스트">무비포스트</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="gnb-txt-reserve" title="예매">예매</a>
				<div class="gnb-depth2">
					<ul>
						<li><a href="${pageContext.request.contextPath}/booking/"
							title="빠른예매">빠른예매</a></li>
						<li><a
							href="${pageContext.request.contextPath}/booking/timetable"
							title="상영시간표">상영시간표</a></li>
					</ul>
				</div></li>
			<li><a href="" class="gnb-txt-theater" title="극장">극장</a>
				<div class="gnb-depth2">
					<ul>
						<li><a href="${pageContext.request.contextPath}/theater/"
							title="전체극장">전체극장</a></li>
					</ul>
				</div></li>
			<li><a href="${pageContext.request.contextPath}/event/"
				class="gnb-txt-event" title="이벤트">이벤트</a>
				<div class="gnb-depth2">
					<ul>
						<li><a href="${pageContext.request.contextPath}/event/"
							title="진행중 이벤트">진행중 이벤트</a></li>
						<li><a id=""
							href="${pageContext.request.contextPath}/event/end"
							title="지난 이벤트">지난 이벤트</a></li>
						<li><a href="${pageContext.request.contextPath}/event/winner"
							title="당첨자발표">당첨자발표</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="gnb-txt-store" title="스토어">스토어</a>
				<div class="gnb-depth2">
					<ul>
						<li><a href="${pageContext.request.contextPath}/store"
							title="스토어">스토어</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="gnb-txt-benefit" title="혜택">혜택</a>
				<div class="gnb-depth2">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/benefit/membership"
							title="무비플러스 멤버십">무비플러스 멤버십</a></li>
						<li><a
							href="${pageContext.request.contextPath}/benefit/viplounge"
							title="VIP LOUNGE">VIP LOUNGE</a></li>
					</ul>
				</div></li>
		</ul>
	</nav>

	<div id="layer_sitemap" class="header-layer layer-sitemap">
		<!-- 큰 메뉴바 header-layer layer-sitemap on -->
		<!-- wrap -->
		<div class="wrap">
			<a href="#" class="link-acc" title="사이트맵 레이어 입니다.">사이트맵 레이어 입니다.</a>

			<p class="tit on">SITEMAP</p>

			<div class="list position-1">
				<p class="tit-depth">영화</p>

				<ul class="list-depth">
					<li><a
						href="${pageContext.request.contextPath}/movie/movieListPage"
						title="전체영화">전체영화</a></li>
					<li><a href="${pageContext.request.contextPath}/moviepost/all"
						title="무비포스트">무비포스트</a></li>
				</ul>
			</div>

			<div class="list position-2">
				<p class="tit-depth">예매</p>

				<ul class="list-depth">
					<li><a href="${pageContext.request.contextPath}/booking/"
						title="빠른예매">빠른예매</a></li>
					<li><a
						href="${pageContext.request.contextPath}/booking/timetable"
						title="상영시간표">상영시간표</a></li>
				</ul>
			</div>

			<div class="list position-3">
				<p class="tit-depth">극장</p>

				<ul class="list-depth">
					<li><a href="${pageContext.request.contextPath}/theater/"
						title="전체극장">전체극장</a></li>
				</ul>
			</div>

			<div class="list position-4">
				<p class="tit-depth">이벤트</p>

				<ul class="list-depth">
					<li><a href="${pageContext.request.contextPath}/event/"
						title="진행중 이벤트">진행중 이벤트</a></li>
					<li><a href="${pageContext.request.contextPath}/event/end"
						title="지난 이벤트">지난 이벤트</a></li>
					<li><a href="${pageContext.request.contextPath}/event/winner"
						title="당첨자발표">당첨자발표</a></li>
				</ul>
			</div>

			<div class="list position-5">
				<p class="tit-depth">스토어</p>

				<ul class="list-depth">
					<li><a href="${pageContext.request.contextPath}/store"
						title="메가티켓">메가티켓</a></li>
					<li><a href="${pageContext.request.contextPath}/store_cp05"
						title="팝콘/음료/굿즈">팝콘/음료/금액권</a></li>
					<li><a href="${pageContext.request.contextPath}/store_cp07"
						title="포인트몰">포인트몰</a></li>
				</ul>
			</div>
			<div class="list position-6">
				<p class="tit-depth">나의 무비플러스</p>
				<ul class="list-depth mymage">


					<li><a href="${pageContext.request.contextPath}/member/mypage">나의
							무비플러스 홈</a></li>
					<li><a href="#">예매/구매내역</a></li>
					<li><a href="#">할인/제휴쿠폰</a></li>
					<li><a href="#">멤버십포인트</a></li>
					<li><a href="#">나의 무비스토리</a></li>
					<li><a href="#">나의 이벤트 응모내역</a></li>
					<li><a href="#">나의 문의내역</a></li>
					<li><a href="#">회원정보</a></li>



				</ul>
			</div>

			<div class="list position-7">
				<p class="tit-depth">혜택</p>

				<ul class="list-depth">
					<li><a
						href="${pageContext.request.contextPath}/benefit/membership"
						title="멤버십 안내">멤버십 안내</a></li>
					<li><a
						href="${pageContext.request.contextPath}/benefit/viplounge"
						title="VIP LOUNGE">VIP LOUNGE</a></li>
				</ul>
			</div>

			<div class="list position-8">
				<p class="tit-depth">고객센터</p>

				<ul class="list-depth">
					<li><a
						href="${pageContext.request.contextPath}/customer_service"
						title="고객센터 홈">고객센터 홈</a></li>
					<li><a
						href="${pageContext.request.contextPath}/customer_service/question"
						title="자주묻는질문">자주묻는질문</a></li>
					<li><a href="#" title="1:1문의">1:1문의</a></li>
					<li><a href="#" title="단체/대관문의">단체/대관문의</a></li>
					<li><a
						href="${pageContext.request.contextPath}/customer_service/lostitem"
						title="분실물문의">분실물문의</a></li>
				</ul>
			</div>



			<div class="ir">
				<a href="#" class="layer-close" title="레이어닫기">레이어닫기</a>
			</div>
		</div>
		<!--// wrap -->
	</div>
	<!--// 레이어 : 사이트맵 -->

	<!-- 레이어 : 검색 -->
	<div id="layer_header_search" class="header-layer layer-header-search">
		<!-- "header-layer layer-header-search target on" -->
		<div class="wrap">
			<a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>
			<div class="tab-rank tab-layer">
				<ul>
					<li class="on"><button type="button" class="btn">예매율
							순</button></li>
				</ul>
			</div>

			<div class="rank-cont">
				<p class="img">
					<img src="" alt="1등인 영화 이미지">
				</p>

				<div class="list">
					<ol>
						<li><em>1</em> <a href="#" title="영화1 상세보기">영화1</a></li>
						<li><em>2</em> <a href="#" title="영화2 상세보기">영화2</a></li>
						<li><em>3</em> <a href="#" title="영화3 상세보기">영화3</a></li>
						<li><em>4</em> <a href="#" title="영화4 상세보기">영화4</a></li>
						<li><em>5</em> <a href="#" title="영화5 상세보기">영화5</a></li>
					</ol>
				</div>
			</div>

			<div class="header-search-area">
				<input type="text" id="headerMovieName" title="영화명을 검색해 주세요"
					placeholder="영화를 검색하세요" class="input-text">
				<button type="button" id="btnHeaderSearch" class="btn-search">검색</button>
			</div>
		</div>

	</div>
	<!--// 레이어 : 검색 -->

	<!-- 레이어 : 마이페이지 -->




	<div id="layer_mymega2" class="header-layer layer-mymege2">
		<!-- on -->
		<a href="#" class="ir" title="나의 무비플러스 레이어 입니다.">나의 무비플러스 레이어 입니다.</a>

		<!-- wrap-->
		<div class="wrap" style="display:;">

			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="pinfo" />
				<input type="hidden" id="header-pinfo-memberId"
					value="${pinfo.MEMBER_ID}">
				<div class="login-after" style="display:;">
					<!-- 로그인 이후 -->
					<div class="inner">
						<div class="box">
							<div class="mbimg">
								<!-- ** 멤버십등급 사진 변경하기** -->
								<c:choose>
									<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'Welcome'}">
										<img
											src="${pageContext.request.contextPath}/resources/image/membership/member_WELCOME_2.png"
											alt="프로필 사진">
									</c:when>

									<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'VIP'}">
										<img
											src="${pageContext.request.contextPath}/resources/image/membership/member_VIP_2.png"
											alt="프로필 사진">
									</c:when>
									<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'VVIP'}">
										<img
											src="${pageContext.request.contextPath}/resources/image/membership/member_VVIP_2.png"
											alt="프로필 사진">
									</c:when>
									<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'MVIP'}">
										<img
											src="${pageContext.request.contextPath}/resources/image/membership/member_MVIP_2.png"
											alt="프로필 사진">
									</c:when>
								</c:choose>

							</div>
							<div class="name">
								<span>${pinfo.MEMBER_NAME}</span>님
							</div>

							<a href="${pageContext.request.contextPath}/member/mypage"
								class="linkBtn" title="나의 무비플러스">마이페이지</a>
						</div>

						<div class="box">
							<div class="tit">
								<span>멤버십 등급</span>
							</div>
							<ul class="membership">
								<li class="txt" style="font-size: 15pt; padding-top: 0px">${pinfo.MEMBER_MEMBERSHIP}</li>
							</ul>
						</div>


						<div class="box point">
							<div class="tit">
								<a class="linkA" href="#" title="멤버십 포인트"><span>포인트</span></a>
							</div>
							<div class="count">${pinfo.MEMBER_POINT}</div>
						</div>

						<div class="box coupon">
							<div class="tit">
								<a class="linkA" href="#" title="쿠폰"><span>쿠폰</span></a> <a
									class="linkA" href="#" title="멤버십 포인트"></a>
							</div>

							<div title="쿠폰 수" class="count">0</div>
						</div>

						<div class="box movieTk">
							<div class="tit">
								<a class="linkA" href="#" title="관람권"><span>관람권</span></a> <a
									class="linkA" href="#" title="멤버십 포인트"></a>
							</div>

							<div title="관람권 수" class="count">0</div>
						</div>

						<div class="box reserve">
							<div class="tit">
								<a class="linkA" href="#" title="예매내역"><span>예매</span></a>
							</div>

							<div title="예매 수" class="count">0</div>
						</div>

						<div class="box buy">
							<div class="tit">
								<a class="linkA" href="#" title="구매내역"><span>구매</span></a>
							</div>

							<div class="count">
								<em>0</em><span>건</span>
							</div>
						</div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<div class="login-before" style="">
					<!-- 로그인 전 -->
					<div class="txt">영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!</div>

					<div class="linkBox">
						<a href="#" id="moveLogin" title="로그인" class="btn-modal-open"
							w-data="850" h-data="484">로그인</a> <a
							href="${pageContext.request.contextPath}/member/join"
							class="link" title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a>
					</div>

				</div>
			</sec:authorize>
		</div>
	</div>
</header>
<script>
	var loginfail = "${loginfail}";
	if (loginfail === 'loginFailMsg') {

		$('#layer_login_select').addClass('on');
		$('.bg-modal').css('opacity', '1');
		$('body').addClass('no-scroll');

		/* openAlertPopup(); */
		$('#loginfailalert').css('opacity', '1');
		$('.alertStyle').css('display', 'block');
		$('#loginfailalert').css('display', 'block');
		$('body').addClass('no-scroll');

	}

	if ('${logout}' == 'logout') {
		console.log("logout");
		$("form[name=logout]").submit();
	}
</script>
</head>