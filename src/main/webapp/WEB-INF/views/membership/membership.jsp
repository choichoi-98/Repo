<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>



<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/membership.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="혜택 메인 페이지로 이동">혜택</a> 
					<a href="#" title="멤버십 안내 페이지로 이동">무비플러스 멤버십</a> 
					<a href="#" title="멤버십 안내 페이지로 이동">멤버십 안내</a>
				</div>
			</div>
		</div>
		<!-- contents -->
		<div id="contents">
			<div class="inner-wrap">
				<h2 class="tit">무비플러스 멤버십</h2>
				<div class="tab-list">
					<ul id="membership-tab-ul">
						<li class="on"><a
							href="/movieplus/benefit/membership/"
							title="멤버십 안내 탭으로 이동">멤버십 안내</a></li>
						<li><a href="/movieplus/benefit/viplounge/"
							title="VIP LOUNGE 탭으로 이동">VIP LOUNGE</a></li>
					</ul>
				</div>

				<div class="membershipCard">
					<div class="tt" style="color: #792828;">
						MOVIEPLUS<span>MEMBERSHIP</span>
					</div>
					<div class="tx" style="color: black; margin-bottom: 100px">무비플러스 멤버십 회원에게만 제공되는 혜택</div>
				</div>

				<h3 class="tit3" style="color: #792828;">무비플러스 멤버십 혜택</h3>
				<div class="membershipBenefit" id="membershipBenefit">
					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img01.png"
							alt="포인트 적립">
						<div class="tit">포인트 적립</div>
						<div class="txt">
							티켓, 매점 이용 시 등급에 따라<br>5 ~ 10% 포인트 적립!
						</div>
						<a href="#" class="button purple focus-btn"
							data-target="#pointSave" title="포인트 적립 상세보기">자세히보기</a>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img02.png"
							alt="포인트 선물">
						<div class="tit">포인트 선물</div>
						<div class="txt">
							사랑하는 가족, 친구에게 포인트를 선물하세요<br>포인트 선물은 신포인트만 가능해요<br>* 상세
							내용은 모바일앱에서 확인해 주세요!
						</div>
					</div>
					<div class="item">
						<img
							src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img03.png"
							alt="포인트 사용">
						<div class="tit">포인트 사용</div>
						<div class="txt">
							원하는 영화도 보고<br>팝콘도 구매할 수 있는 포인트!
						</div>
						<a href="#" class="button purple focus-btn"
							data-target="#pointUse" title="포인트 사용 상세보기">자세히보기</a>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img04.png"
							alt="생일 축하쿠폰">
						<div class="tit">생일 축하쿠폰</div>
						<div class="txt">
							회원이라면 누구나<br>생일 축하 쿠폰을 드려요
						</div>
						<a href="#" class="button purple focus-btn"
							data-target="#birthDayCp" title="생일 축하 쿠폰 상세보기">자세히보기</a>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img05.png"
							alt="VIP LOUNGE">
						<div class="tit">VIP LOUNGE</div>
						<div class="txt">
							VIP 회원을 위한<br>더 특별한 추가혜택!
						</div>
						<a href="#"
							class="button purple focus-btn" data-target="#vipLounge"
							title="VIP LOUNGE 상세보기">VIP LOUNGE 안내</a>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/image/membership/ico_benefit_img06.png"
							alt="스페셜 멤버십">
						<div class="tit">스페셜 멤버십</div>
						<div class="txt">
							멤버십 혜택에 추가로<br>스페셜 멤버십 혜택까지!
						</div>
						<a href="#"
							class="button purple focus-btn" title="스페셜 멤버십 상세보기">스페셜멤버십 안내</a>
					</div>
				</div>

				<div class="pointUse" id="pointUse">
					<h3 class="tit3">포인트 사용</h3>
					<table>
						<caption>포인트 사용</caption>
						<colgroup>
							<col style="width: 250px;">
							<col style="width: 250px;">
							<col style="width:;">
						</colgroup>
						<thead>
							<tr>
								<th>회원상품</th>
								<th>구분</th>
								<th>포인트 사용 기준</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">영화</td>
								<td>사용 가능 요일</td>
								<td>월 - 일 (요일 무관)</td>
							</tr>
							<tr>
								<td class="fl">차감 포인트</td>
								<td>티켓 정가 100% 필요</td>
							</tr>

							<tr>
								<td rowspan="2">매점</td>
								<td>사용 가능 상품</td>
								<td>매점 판매 상품 (일부 상품 제외)</td>
							</tr>
							<tr>
								<td class="fl">차감 포인트</td>
								<td>보유 포인트 내, 최소 1,000 포인트 부터 10 포인트 단위 사용 가능 (키오스크, 모바일
									오더)<br>※ 현장 직원 결제 시 500 포인트 단위 사용 가능
								</td>
							</tr>

							<tr>
								<td>포토카드</td>
								<td>차감 포인트</td>
								<td>장당 1,000 포인트</td>
							</tr>

							<tr>
								<td>온라인 스토어</td>
								<td>차감 포인트</td>
								<td>상품별 차감 기준 상이 / 일부 상품 제외</td>
							</tr>
						</tbody>
					</table>


					<h4 class="tit4">포인트 사용</h4>
					<dl class="dotListv2">
						<dt>
							적립된 포인트는 사용 가능한 보유포인트 내에서 <span class="fc_02">영화, 포토카드</span> 상품
							구매 시 <span class="fc_02">상품 정가 전액을 기준</span>으로 포인트를 차감하여 사용 가능하며,

							매점 상품 구매 시 <span class="fc_02">1,000포인트</span> 이상 부터 10P단위로 포인트를
							차감하여 사용 가능합니다. (일부 상품 포인트 사용 제외 될 수 있으며 자세한 사항은 하기 내용 확인 바랍니다.)
						</dt>
						<dt>영화 티켓 구매 시</dt>
						<dd>- 포인트는 티켓가 전액 차감되며 현금 또는 신용카드 등 다른 결제 수단과 합산하여 사용할 수
							없습니다.</dd>
						<dd>- 예 : 13,000원 티켓 구매 시, 13,000 포인트 필요 (전액 차감)</dd>
						<dd>- 할인 쿠폰, 제휴 할인, 제휴포인트 결제 등 할인 적용 시 멤버십 포인트 사용 불가 합니다.(중복
							사용 불가)</dd>
						<dt>매점 상품 구매시</dt>
						<dd>- 최소 1,000 포인트 부터 10포인트 단위 (키오스크, 모바일오더) 또는 500포인트 단위 (현장
							직원 결제 시)로 사용 가능합니다.</dd>
						<dd>- 포인트 사용 후 남은 금액에 대하여 현금 또는 신용카드 등으로 결제 가능합니다.</dd>
						<dd>- 매점 할인 쿠폰 적용 후 멤버십 포인트 사용 가능합니다.(일부 상품 제외)</dd>
						<dd>- 모바일 상품권, 스토어 교환권 등 이용 시 멤버십 포인트 사용 불가 합니다.</dd>
						<dt>오프라인에서 포인트 사용 시, 멤버십 카드 또는 무비플러스 앱을 반드시 제시해야하며, 개인별로 설정된
							포인트 비밀 번호 인증이 필요 합니다.</dt>
						<dt>특별콘텐트 (오페라, 팝콘클래식, 기획전, GV, 라이브중계 등) 및 일부 영화는 포인트 사용 관람이
							불가합니다.</dt>
						<dt>매점 상품 중 프로모션 상품, 특가 상품 및 일부 품목은 포인트 사용이 제한될 수 있으며, 극장에 따라
							사용 가능 상품이 상이할 수 있습니다.</dt>
						<dt>“더 부티크 프라이빗” 관람 시 포인트 사용이 불가합니다.</dt>
					</dl>


					<h4 class="tit4">포인트 사용 제외 극장</h4>
					<dl class="dotListv2">
						<dt>일부 극장의 경우 매점에서 포인트 사용이 불가합니다.</dt>
						<dd>- 사용 제외 극장 : 경산하양, 공주, 김천, 남춘천, 북대구(칠곡), 속초, 순천, 아트나인,
							안산중앙, 원주, 인천논현, 진주(중안, 진천, 첨단, 청주사창, 파주금촌</dd>
					</dl>

					<h3 class="tit3" id="birthDayCp">생일 축하 쿠폰</h3>
					<dl class="dotListv2">
						<dt>생일 쿠폰은  회원에게만 제공됩니다.</dt>
						<dt>생일 쿠폰은 1년에 1회 지급되며, 한 번 발급되면 추가 발급되지 않습니다.</dt>
						<dt>생일 쿠폰은 회원정보에 등록된 생일을 기준으로 발급됩니다.</dt>
						<dd>- 생일 2주전 쿠폰이 발행되며, 유효기간은 발행일로부터 4주입니다. (예 : 3월 16일 생일인 경우
							3월 2일 발급, 3월 30일까지 사용 가능)</dd>
						<dt>발행된 쿠폰은 로그인 후 ‘나의 무비플러스 &gt; 쿠폰’에서 확인 가능합니다.</dt>
						<dt>쿠폰 발급일 기준, 정상 회원에게만 제공됩니다. (쿠폰 발급일 이후 가입, 휴면 회원 상태 고객 등
							제외)</dt>
						<dt>쿠폰 내용, 지급 일정, 사용 방법 등은 내부 사정에 따라 변경될 수 있습니다.</dt>
					</dl>

					<h3 class="tit3">멤버십카드</h3>
					<dl class="dotListv2">
						<dt>극장 이용 시 멤버십 카드를 꼭 제시해주세요!</dt>
						<dt>무비플러스 회원가입 시 모바일 카드가 자동 발급됩니다.</dt>
						<dt>플라스틱 카드 수령을 원하시는 분은 무비플러스 현장 매표소에서 받으실 수 있습니다.</dt>
						<dt>플라스틱 카드를 수령하신 경우 홈페이지 ‘나의 무비플러스 &gt; 멤버십 포인트 &gt; 멤버십
							카드관리’에서 등록 후 이용하실 수 있습니다.</dt>
					</dl>

					<h3 class="tit3" id="pointSave">포인트 적립</h3>
					<h4 class="tit4">포인트 기본 적립</h4>
					<dl class="dotListv2">
						<dt>영화 티켓 구매 시 유료 결제 금액의 5~10% 적립</dt>
						<dd class="fc_01">- 일반회원 : 5% 적립</dd>
						<dd class="fc_01">- VIP회원 : 10% 적립 (단, VIP 선정 기준은 5%만 반영)</dd>
						<dt>매점 유료 결제 금액의 2% 적립</dt>
						<dt>결제가 완료된 후 적립 예정 포인트로 적립되며 영화의 경우 상영일 익일, 매점의 경우 구매일 익일 사용
							가능한 포인트(가용 포인트) 로 전환됩니다.</dt>
						<dt>회원이 로그인 후 온라인 서비스를 이용 하거나 현장 매표소, 키오스크에서 멤버십 카드 제시 또는
							회원임을 확인 할 수 있는 정보를 제공하여야 포인트가 적립됩니다.</dt>
						<dt>무비플러스 및 제휴사 할인, 포인트 결제 등을 통해 할인 받은 금액을 제외한 실제 고객님께서 현금,
							신용카드 등으로 유료 결제한 금액 기준으로 적립됩니다.</dt>
						<dt>일부 영화, 상품, 극장, 결제 수단의 경우 적립이 되지 않거나 별도의 적립률이 적용될 수 있으며 상세
							내용은 해당 상품, 극장 등에 별도 공지합니다.</dt>
						<dt>VIP 선정 시 기준이 되는 포인트입니다.</dt>
						<dt>포인트 적립은 티켓에 노출된 영화 시작 시간 이전까지만 가능하며, 영화 상영 및 매점 상품 구매 이후
							사후 적립은 불가능합니다.</dt>
					</dl>

					<h4 class="tit4">포인트 적립 제외 극장</h4>
					<dl class="dotListv2">
						<dt>일부 극장의 경우 매점 구매 시 포인트 적립이 불가합니다.</dt>
						<dd class="fc_01">- 매점 적립 제외 극장: 경산하양, 공주, 김천, 남춘천, 북대구(칠곡),
							속초, 순천, 아트나인, 안산중앙, 원주, 인천논현, 진주(중안), 진천, 첨단, 청주사창, 파주금촌</dd>
						<dt>더 부티크 프라이빗 관람 시 포인트 적립이 불가합니다.</dt>
					</dl>


					<h4 class="tit4">기타 적립 안내</h4>
					<dl class="dotListv2">
						<dt>단체 영화 관람 및 매점 구매를 통해 가격 할인을 받은 경우 포인트는 적립되지 않습니다.</dt>
						<dt>무비플러스에서 발행된 관람권은 영화 가격과 무관하게 관람권이 판매된 가격 기준으로 포인트가 적립됩니다.</dt>
						<dt>모바일 쿠폰(기프티콘, 쇼 등)으로 결제된 티켓은 포인트 적립이 제외됩니다.</dt>
						<dt>위탁예매사(인터파크, YES24 등)을 통한 티켓 예매 시 회원정보가 동일할 경우 포인트가 적립됩니다.</dt>
					</dl>

					<h3 class="tit3">유효기간 및 소멸</h3>
					<h4 class="tit4">포인트 유효기간</h4>
					<dl class="dotListv2">
						<dt>기본 적립 포인트 : 적립일로부터 24개월이 지난 해당월 말일 (티켓 및 매점 유료 구매 시)</dt>
						<dt>선물 받은 포인트 : 선물 받은 날로부터 3개월이 지난 해당월 말일</dt>
						<dt>이벤트 적립 포인트 : 이벤트 마다 유효기간이 상이(개별 확인 필요)</dt>
					</dl>

					<h4 class="tit4">포인트 소멸</h4>
					<dl class="dotListv2">
						<dt>유효기간이 경과된 포인트는 매월 말일 영업 종료 후 포인트가 자동 소멸되며 포인트 사용 취소시 복구되지
							않습니다</dt>
						<dt>소멸 기준은 잔여 가용 포인트 중 유효기간이 가장 짧은 포인트부터 소멸되며, 소멸된 포인트는 복구되지
							않습니다.</dt>
						<dt>보유 포인트의 소멸 예정일이 도래할 경우, 포인트 소멸과 관련된 내용을 최소 15일 전에 문자 또는
							이메일 등으로 고지합니다.</dt>
						<dt>또한, 홈페이지 및 모바일 웹/앱 로그인 시 소멸 예정 포인트를 확인하실 수 있습니다.</dt>
					</dl>
				</div>
				<!-- ---------------------------------------------------------------- -->
			</div>
		</div>
		<!--// contents -->
		<!-- ------------------------------------------------  -->
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
	
</body>

<style>
.tit3 {
	color: #792828
}
</style>
</html>