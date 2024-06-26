<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
</sec:authorize>
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
<!-- <script src="${pageContext.request.contextPath}/resources/js/store_kakaopay.js"></script> -->
<script>
$(function() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $('#btn-kakaopay').click(function() {
        var totalPrice = $('#totPrdtAmtView').data('price');
        var cartItemNames = $('#totPrdtAmtView').data('name');
		
        $.ajax({
            url: 'kakaopay',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "totalPrice": totalPrice,
            	    "cartItemNames": cartItemNames},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                xhr.setRequestHeader("Accept-Charset", "UTF-8");
            },
            success: function(data) {
                var box = data.next_redirect_pc_url;
                window.open(box);
//              alert("상품: "+ cartItemNames + " 총 가격: " + totalPrice);
            },
            error: function(error) {
                alert(JSON.stringify(error, null, 2));
            }
        });
    });
    
    $(document).on('click', '.delbtn', function(e) {
    	e.preventDefault(); // 기본 동작인 링크 이동을 막기
    	
    	const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const itemCode = row.find('.delbtn').data('code');  // 해당 행의 ITEM_CODE 값을 추출
        alert('itemCode:' + itemCode);
        
        $.ajax({
            url: 'cart',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "itemCode": itemCode},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                alert("삭제 성공, itemCode: " + itemCode);
                window.location.reload();
            },
            error: function(error) {
                alert("삭제 실패, itemCode: " + itemCode);
                window.location.reload();
            }
        });
    });
});

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- container -->
	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="스토어">스토어</a> <a href="#"
						title="결제">결제</a>
				</div>
			</div>
		</div>
		<div id="storePay">
			<!--  ko_KR -->
			<!-- contents -->
			<form name="payForm" id="payForm" method="post">
				<input type="hidden" name="completeYn" id="completeYn" value="">
				<input type="hidden" name="prepareYn" id="prepareYn" value="Y">
				<input type="hidden" name="lastPayMethod" id="lastPayMethod">
				<input type="hidden" name="preDisc" id="preDisc" value=""> <input
					type="hidden" name="discType" id="discType" value="">
			</form>
			<!-- 사파리브라우저에서는 새창으로 target 호출시 method가 POST일경우 세션이 유실됨 -->
			<form name="ifrm" method="GET" target="FD_PAY_FRAME"
				action="https://www.megabox.co.kr/on/oh/ohz/PayStore/applyCreditCard.do">
				<input type="hidden" name="transNo" id="ifrm_transNo"> <input
					type="hidden" name="useAmt" id="ifrm_useAmt"> <input
					type="hidden" name="methodName" id="ifrm_methodName"> <input
					type="hidden" name="selectCard" id="ifrm_selectCard"> <input
					type="hidden" name="pointDmode" id="ifrm_pointDmode">
			</form>

			<!--  <div id="contents" class="location-fixed"> -->
			<div id="contents">
				<div class="inner-wrap">
					<!-- store-payment -->
					<div class="store-payment">
						<h2 class="tit">결제</h2>

						<h3 class="tit">주문상품정보</h3>

						<div class="table-wrap">
							<table class="board-list">
								<caption>주문상품정보 목록 표</caption>
								<colgroup>
									<col style="width: 120px;">
									<col>
									<col style="width: 150px;">
									<col style="width: 80px;">
									<col style="width: 200px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="colgroup" colspan="2">주문상품</th>
										<th scope="col">구매수량</th>
										<th scope="col">총 금액</th>
										<th scope="col">기타</th>
									</tr>
								</thead>

								<tbody>
									<c:set var="cartItemNames" value="" />
									<c:set var="totalPrice" value="0"/>
									<c:forEach var="c" items="${cartlist}" varStatus="loop">
										<c:if test="${pinfo.MEMBER_ID eq c.MEMBER_ID}">
										<tr>
											<td class="a-c">
												<div class="goods-info">
													<p class="img">
														<a href="javascript:fn_storeDetail();" title="일반관람권(2D)">
															<img
															src="./store_pay_MEET PLAY SHARE, 메가박스_files/OzjTPmOIAocfyQnas3x8Vo9JDRRnHeKf_280.png"
															alt="" onerror="noImg(this);">
														</a>
													</p>
												</div>
											</td>
											<th scope="row">
												<div class="goods-info">
													<p class="name">
														<a href="javascript:fn_storeDetail();" title="일반관람권(2D)">${c.ITEM_NAME}</a>
													</p>
													<p class="bundle">${c.ITEM_MENU}</p>
												</div>

												<div class="mt10">
													<span id="acptBrchView" class="font-gblue"></span><em
														id="acptBrchChoiValView"></em>
												</div>
											</th>
											<td><em id="purcQtyView">${c.ITEM_CNT}</em></td>
											<td>
												<div class="goods-info">
													<em id="prdtSumAmtView" class="price">${c.ITEM_PRICE * c.ITEM_CNT}</em>원
												</div>
											</td>
											<td>
											<!-- http://localhost:9000/movieplus/store/cart?ITEM_CODE -->
											<a href="#" 
											   class="a-link delbtn" name="brchList" title="삭제" 
											   data-code="${c.ITEM_CODE}">삭제</a>
											</td>
										</tr>
										<c:choose>
        									<c:when test="${!loop.last}"> <!-- 마지막 요소가 아닐 때만 쉼표 추가 -->
            									<c:set var="cartItemNames" value="${cartItemNames}${c.ITEM_NAME}, " />
        									</c:when>
        									<c:otherwise>
            									<c:set var="cartItemNames" value="${cartItemNames}${c.ITEM_NAME}" />
        									</c:otherwise>
    									</c:choose>
										<c:set var="totalPrice" value="${totalPrice + (c.ITEM_PRICE * c.ITEM_CNT)}"/>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 결제수단 포인트 시작 -->
						<!-- 결제수단 포인트 끝 -->
						<!-- 포인트 영역 -->
						<!-- 포인트 영역 끝 -->
						<h3 class="tit mt40">최종결제</h3>
						<!-- payment-final -->
						<div class="payment-final">
							<div class="calc">
								<div class="cell all">
									<p class="txt">총 상품금액</p>
									<p class="price">
										<em id="totPrdtAmtView" data-price="${totalPrice}"
										data-name="${cartItemNames}">${totalPrice}</em> <span>원</span>
									</p>
								</div>
								
								<i class="iconset ico-circle-minus">빼기</i>
								<div class="cell sale">
									<p class="txt">할인금액</p>
									<p class="price">
										<em id="totDcAmtView">0</em> <span>원</span>
									</p>
								</div>
								
								<i class="iconset ico-circle-equal">등호</i>
								<div class="cell real">
									<p class="txt">최종 결제금액</p>
									<p class="price">
										<em id="lstPayAmtView">${totalPrice}</em> <span>원</span>
									</p>
								</div>
							</div>
							<div class="choice">
								<div class="inbox">
									<p class="txt">결제수단 선택</p>
									<div class="cell">
										<input type="radio" id="radio_choice03" name="radio_choice"
											value="kakaopay" checked> <label for="radio_choice03">카카오페이</label>
									</div>
									<div class="cell">
										<input type="radio" id="radio_choice01" name="radio_choice"
											value="credit"> <label for="radio_choice01">일반
											결제</label>
									</div>
								</div>
							</div>
							<!-- 결제수단 별 알림문구 -->
							<div class="select-mobile-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>결제하신 금액은 익월 휴대폰 요금에 합산되어 청구되며, 휴대폰 결제한도는 통산사별 월 누적 이용
										제한에 따라 적용됩니다.</li>
									<li>매월 말일 23시30분 ~ 익월 00시 10분까지(40분간)는 시스템 점검시간으로 이용이 어려울
										수 있습니다.</li>
									<li>휴대폰 결제와 관련된 추가 안내는 FAQ를 참조해주세요.</li>
								</ul>
							</div>
							<div class="select-toss-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>토스에 등록된 계좌와 신용/체크카드로 쉽고 편리하게 결제하세요.</li>
									<li>토스페이 결제 시 토스에서 제공하는 카드사 별 무이자, 청구할인, 결제 이벤트만 제공됩니다.</li>
								</ul>
							</div>
							<div class="select-kakao-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>즉시할인 신용카드 적용이 불가합니다.</li>
								</ul>
							</div>
							<div class="select-payco-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>즉시할인 신용카드 적용이 불가합니다.</li>
									<li>페이코 포인트 결제 시 결제금액의 1% 추가적립 됩니다.</li>
								</ul>
							</div>
							<div class="select-chai-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>CHAI는 은행 계좌만 등록하면 차이 비밀번호로 안전하게 결제할 수 있는 간편결제 서비스입니다.<br>(은행
										점검시간인 23:30 ~ 00:30에는 이용이 어려울 수 있습니다.)
									</li>
									<li>결제 취소 또는 부분 취소 시 차이머니로 환불됩니다.</li>
									<li>결제 이용 한도는 1회 200만원입니다.</li>
									<li>이벤트를 통해 혜택을 적용 받은 주문의 경우, 즉시 할인 기준 금액에 따라 부분환불이 불가능할
										수도 있습니다.</li>
								</ul>
							</div>
							<div class="select-settlebank-info"
								style="display: none; padding-top: 20px; width: 640px; margin: auto;">
								<ul class="dash-list">
									<li>내통장결제는 본인명의의 계좌를 최초 1회 등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는
										현금결제 서비스 입니다.</li>
									<li>은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</li>
								</ul>
							</div>
						</div>
						<!--// payment-final -->
						<dl class="term-list" id="terms" style="padding-top: 35px;">
							<dt>
								<span class="bg-chk small"> <input type="checkbox"
									id="agree"><label for="agree">결제대행 서비스 약관 필수 동의</label>
								</span>
							</dt>
							<dd class="tit">
								전자금융거래 이용약관
								<!-- 전자금융거래 이용약관 -->
								<a href="javascript:void(0);"
									onclick="detailClick(&#39;one&#39;)">내용보기</a>
							</dd>
							<dd class="tit">
								개인정보 수집 및 이용 안내
								<!-- 개인정보 수집 및 이용 안내 -->
								<a href="javascript:void(0);"
									onclick="detailClick(&#39;two&#39;)">내용보기</a>
							</dd>
							<dd class="tit">
								개인정보 제공 및 위탁 안내
								<!-- 개인정보 제공 및 위탁 안내 -->
								<a href="javascript:void(0);"
									onclick="detailClick(&#39;three&#39;)">내용보기</a>
							</dd>
						</dl>
						<!-- 20220802 페이즈 약관동의 추가 -->
						<!-- 20220802 페이즈 약관동의 추가 end -->
						<div class="btn-group pt40">
							<a href="cp05"
								class="button large w170px" id="btn_store_back" title="취소">취소</a>

							<a href="javascript:void(0);"
								class="button purple large w170px "
								id="btn-kakaopay" title="결제">결제</a>
							<!-- <a
								href="https://www.megabox.co.kr/store#"
								class="button purple large w170px "
								id="btn_store_pay" title="결제" style="display: none;"
								w-data="600" h-data="400">결제</a> -->
							<!--
                <a href="javascript:execStorePayment();" class="button purple large w170px">결제테스트</a>
                <a href="javascript:execStoreCancelPayment();" class="button purple large w170px">결제취소테스트</a>
                <a href="javascript:searchMempPoint();" class="button purple large w170px">멤버십테스트</a>
                 -->
						</div>
					</div>
					<!--// store-payment -->
				</div>
			</div>
			<!--// contents -->
			<!-- 레이어 : 구인증 -->
			<!-- 레이어 : -->
		</div>
	</div>
	<!--// container -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>