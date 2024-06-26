<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
<div style="display:none;"><a id="loginPupupATag" href="https://megabox.co.kr/support/inquiry#layer_login_select" class="button active btn-modal-open" w-data="850" h-data="484"></a></div>

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span>
					<a href="https://megabox.co.kr/support" title="고객센터 페이지로 이동">고객센터</a>
					<a href="https://megabox.co.kr/support/inquiry" title="1:1 문의 페이지로 이동">1:1 문의</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div class="lnb-area addchat">
				<nav id="lnb" class="ty2">
					<p class="tit"><a href="https://megabox.co.kr/support" title="고객센터">고객센터</a></p>
					<ul>
						<li><a href="https://megabox.co.kr/support" title="고객센터 홈">고객센터 홈</a></li>
						<li><a href="https://megabox.co.kr/support/faq" title="자주 묻는 질문">자주 묻는 질문</a></li>
						<li><a href="https://megabox.co.kr/support/notice" title="공지사항">공지사항</a></li>
						<li class="on"><a href="https://megabox.co.kr/support/inquiry" title="1:1문의">1:1문의</a></li>
						<li><a href="https://megabox.co.kr/support/rent" title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
						<li><a href="https://megabox.co.kr/support/lost" title="분실물 문의">분실물 문의</a></li>
					</ul>

					<!-- 고객센터 메뉴일때만 출력 -->
					<div class="left-customer-info">
						<p class="tit">
							메가박스 고객센터
							<span>Dream center</span>
						</p>
						<p class="time"><i class="iconset ico-clock"></i> 10:00~19:00</p>
					</div>
				</nav>
			</div>

			<div id="contents">
				<h2 class="tit">1:1 문의</h2>
				<div class="mypage-infomation mb30">
					<ul class="dot-list">
						<li><span style="font-weight: bold;">고객님의 문의에 답변하는 직원은 <span style="color: #EB323A;">고객 여러분의 가족 중 한 사람일 수 있습니다.</span></span><br>
							고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
							관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br>
						</li>
						<li>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다. </li>
					</ul>
						<div class="btn-group right">
							<a href="http://localhost:9000/movieplus/customer_service/myinjury" class="button purple" id="myQnaBtn" title="나의 문의내역 페이지로 이동">나의 문의내역</a><!-- btn-layer-open -->
						</div>
				</div>

				<div class="agree-box">
					<dl>
						<dt>
							<span class="bg-chk mr10">
								<input type="checkbox" id="chk" required>
								<label for="chk"><strong>개인정보 수집에 대한 동의</strong></label>
							</span>

							<span class="font-orange">[필수]</span>
						</dt>
						<dd style="font-size:13px;">
							귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집·이용에 대한 본인동의가 필요한 항목입니다.<br><br>

							[개인정보의 수집 및 이용목적]<br>
							회사는 1:1 문의 내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br><br>

							[필수 수집하는 개인정보의 항목]<br>
							이름, 휴대전화, 이메일, 문의내용<br><br>

							[개인정보의 보유기간 및 이용기간]<br>
							<span class="ismsimp">문의 접수 ~ 처리 완료 후 3년<br>
							(단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
							자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.</span>
						</dd>
					</dl>
				</div>

				<p class="reset mt10">* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다</p>

				<p class="reset mt30 a-r font-orange">* 필수</p>

				<!-- 폼 시작 시점 JS 작성포함-->
				<script>
					function enableRegionSelect(){
						document.getElementById("regionSelect").removeAttribute("disabled");
					}
					function enableTheaterSelect(){
						document.getElementById("theaterSelect").removeAttribute("disabled");
					}
					function disableRegionSelect(){
						document.getElementById("regionSelect").setAttribute("disabled", "disabled");
						document.getElementById("theaterSelect").setAttribute("disabled", "disabled");
					}
				</script>
				<form name="regFrm" method="post" action="oneonone_process">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="table-wrap mt10">
						<table class="board-form va-m">
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="ask-select">문의선택</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<input type="radio" name="CUSTOMER_SELECT_WHERE" id="고객센터문의" value="고객센터문의" onclick="disableRegionSelect();"> 
										<label>&nbsp;고객센터문의&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<input type="radio" name="CUSTOMER_SELECT_WHERE" id="극장별문의" value="극장별문의" onclick="enableRegionSelect();"> 
										<label>극장별문의&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<select name="CUSTOMER_SELECT_REGION" id="regionSelect" size="1" style="width:90px; height:35px; border-radius:5px;" disabled onclick="enableTheaterSelect();">
    										<option value="" disabled selected>지역선택</option>
    										<c:forEach var="loc" items="${locationList}">
												<option value="${loc.value}">${loc.value}</option>
											</c:forEach>
										</select>&nbsp;&nbsp;
										<select name="CUSTOMER_SELECT_CENEMA" id="theaterSelect" size="1" style="width:90px; height:35px; border-radius:5px;" disabled>
    										<option value="" disabled selected>극장선택</option>
    										<!-- ajax -->
    										<script>
    										$(document).ready(function(){
    								 			
    										})
    										</script>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ask-type">문의유형</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<select name="CUSTOMER_TYPE" size="1" style="width:120px; height:35px; border-radius:5px;" required>
    										<option value="" disabled selected>문의유형 선택</option>
   											<option value="예매 문의">예매 문의</option>
   											<option value="포인트 문의">포인트 문의</option>
   											<option value="이벤트 문의">이벤트 문의</option>
   											<option value="일반 문의">일반 문의</option>
										</select>
								</tr>
								<tr>
									<th scope="row"><label for="name">이름</label> <em class="font-orange">*</em></th>
									<td>
												<input type="text" id="name" name="CUSTOMER_NAME" class="input-text w150px" value="" maxlength="30" required>
									</td>
									<th scope="row"><label for="qnaRpstEmail">이메일</label> <em class="font-orange">*</em></th>
									<td>
											 	<input type="text" name="CUSTOMER_EMAIL" id="qnaRpstEmail" class="input-text" value="" maxlength="50" required>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="hpNum1">휴대전화</label> <em class="font-orange">*</em></th>
									<td colspan="3">
												<input type="text" name="CUSTOMER_PHONNUM1" id="hpNum1" class="input-text w60px numType" maxlength="3" title="핸드폰번호 첫자리 입력" required>
												<span>-</span>
												<input type="text" name="CUSTOMER_PHONNUM2" id="hpNum2" class="input-text w70px numType" maxlength="4" title="핸드폰번호 중간자리 입력" required>
												<span>-</span>
												<input type="text" name="CUSTOMER_PHONNUM3" id="hpNum3" class="input-text w70px numType" maxlength="4" title="핸드폰번호 마지막자리 입력" required>
												<div id="qnaMblpNo-error-text" class="alert"></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="qnaCustInqTitle">제목</label> <em class="font-orange">*</em></th>
									<td colspan="3"><input type="text" name="CUSTOMER_TITLE" id="qnaCustInqTitle" class="input-text" maxlength="100" required></td>
								</tr>
								<tr>
									<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
									<td colspan="3">
										<div class="textarea">
											<div id="textarea-notice" style="color: #999999; margin-left: 10px;">
												<!-- <ul>- 문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.</ul>
												<ul style="font-weight: bold"> - 비회원 문의시 이메일로 답변내용이 발송되오니 정확하게 작성부탁드립니다.</ul>
												<ul> - 회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다.</ul> -->
											</div>
											<textarea id="textarea" placeholder="문의 내용을 작성해주세요 &#10;답변은 메일로도 전달됩니다. 메일주소를 확인해주세요." name="CUSTOMER_CONTENT" rows="5" cols="30" title="내용입력" class="input-textarea" required></textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span> / 2000
												</p>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn-group pt40">
						<button type="submit" class="button purple large">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--// container -->


<div class="quick-area">
	<a href="https://megabox.co.kr/support/inquiry" class="btn-go-top" title="top">top</a>
</div>

    <form id="mainForm">
    </form>

<div class="normalStyle" style="display:none;position:fixed;top:0;left:0;background:#000;opacity:0.7;text-indent:-9999px;width:100%;height:100%;z-index:100;">닫기</div><div class="alertStyle" style="display:none;position:fixed;top:0px;left:0px;background:#000;opacity:0.7;width:100%;height:100%;z-index:5005;"></div></body></html>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>