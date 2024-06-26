<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html>
<!--<![endif]-->
<head>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 탭 클릭 시 이벤트 처리 -->
<script src="static/store_tabs.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- container -->
	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="https://www.megabox.co.kr/store"
						title="스토어">스토어</a>
				</div>
			</div>
		</div>
		<!-- <div id="storeMainList"> -->
		<!-- contents -->
		<div id="contents" class="">
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<h2 class="tit">스토어</h2>
				<div class="tab-list fixed">
					<ul>
						<li id="storeTab_CPC02" class="on"><a
							href="/movieplus/store" title="메가티켓 탭으로 이동">영화 티켓</a></li>
						<li id="storeTab_CPC05" class=""><a
							href="/movieplus/store/cp05" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
						<li id="storeTab_CPC09" class=""><a
							href="/movieplus/store/cp09" title="금액권 탭으로 이동">금액권</a></li>
						<li id="storeTab_CPC07" class=""><a
							href="/movieplus/store/cp07" title="포인트몰 탭으로 이동"> <span
								class="pointmall">포인트몰</span>
						</a></li>
					</ul>
				</div>

				<!-- 카테고리 별 상품 -->
				<div id="divCategoryPrdtArea_CPC02" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<c:forEach var="i" items="${ticketlist}">
						<ul class="list">
							<li class="">
								<a href="store/item?ITEM_CODE=${i.ITEM_CODE}">
									<div class="soldout">SOLD OUT</div>
									<div class="label event">EVENT</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/akIeaYOCBjFLqxbO6lt4VOcAJ4YttCvM_280.jpg"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">${i.ITEM_NAME}</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">ticket</p>
										</div>

										<div class="price">
											<p class="original">${i.ITEM_PRICE + 4500}</p>
											<p class="sale">
												<em>${i.ITEM_PRICE}</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
								</a>
							</li>
						</ul>
						</c:forEach>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC05" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC09" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC07" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<!--// 카테고리 별 상품 -->
			</div>
			<!--// inner-wrap -->
		</div>
		<!--// contents -->
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>