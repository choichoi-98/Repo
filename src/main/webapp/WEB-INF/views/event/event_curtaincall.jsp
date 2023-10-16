<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />


	<!-- container -->
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> 
					<a href="https://www.megabox.co.kr/event"	title="이벤트 메인 페이지로 이동">이벤트</a> 
						<a href="#" title="진행중 이벤트 페이지로 이동">진행중 이벤트</a>
				</div>


			</div>
		</div>

	  	<div id="contents">
		<div class="inner-wrap">
				<h2 class="tit">진행중인 이벤트</h2>
				<div class="tab-list fixed">
					<ul>
						<!-- li class="on" id="eventTab_"><a href="javascript:fn_chgEventTab('')">전체</a></li-->
						<li class="" id="eventTab_"><a href="javascript:fn_eventTabMove(&#39;&#39;)" title="전체">전체</a></li>
						
							<!--  li id="eventTab_CED01"><a href="javascript:fn_chgEventTab('CED01')">영화</a></li-->
							<li id="eventTab_CED01" class=""><a href="javascript:fn_eventTabMove(&#39;CED01&#39;)" title="영화 탭으로 이동">영화</a></li>
						
							<!--  li id="eventTab_CED02"><a href="javascript:fn_chgEventTab('CED02')">극장</a></li-->
							<li id="eventTab_CED02" class=""><a href="javascript:fn_eventTabMove(&#39;CED02&#39;)" title="극장 탭으로 이동">극장</a></li>
						
							<!--  li id="eventTab_CED05"><a href="javascript:fn_chgEventTab('CED05')">제휴/할인</a></li-->
							<li id="eventTab_CED05" class=""><a href="javascript:fn_eventTabMove(&#39;CED05&#39;)" title="제휴/할인 탭으로 이동">제휴/할인</a></li>
						
							<!--  li id="eventTab_CED04"><a href="javascript:fn_chgEventTab('CED04')">시사회/무대인사</a></li-->
							<li id="eventTab_CED04" class="on"><a href="javascript:fn_eventTabMove(&#39;CED04&#39;)" title="시사회/무대인사 탭으로 이동">시사회/무대인사</a></li>
						
							<!--  li id="eventTab_CED03"><a href="javascript:fn_chgEventTab('CED03')">재개봉</a></li-->
							<li id="eventTab_CED03" class=""><a href="javascript:fn_eventTabMove(&#39;CED03&#39;)" title="재개봉 탭으로 이동">재개봉</a></li>
						
					</ul>
				</div>

				<div id="toptablist" class="toptablist display-none">
				</div>











			
			
		</div>

		
			<div id="divTopArea" class="event-slider" style="display: none;">
				<div class="inner-wrap">

					<p class="name">추천 이벤트</p>

					<div class="event-pagination swiper-pagination-bullets"></div>

					<div class="event-count">
						<span title="현재 페이지" class="active">0</span> /
						<span title="전체 페이지" class="total">0</span>
					</div>

					<div class="event-util">
						<button type="button" class="event-prev" tabindex="0" role="button" aria-label="Previous slide" style="display: none;">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0" role="button" aria-label="Next slide" style="display: none;">다음 이벤트 보기</button>
						<button type="button" class="pause on">일시정지</button>
						<button type="button" class="play">자동재생</button>
					</div>

					<div class="event-control">
						<button type="button" class="event-prev" tabindex="0" role="button" aria-label="Previous slide" style="display: none;">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0" role="button" aria-label="Next slide" style="display: none;">다음 이벤트 보기</button>
					</div>
				</div>

				<div class="event-swiper swiper-container-initialized swiper-container-horizontal">
					<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
						<!-- 반복 -->
						
					</div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
			</div>
		

		<div id="boardSearch" class="inner-wrap" style="">
			

			
				<div class="board-list-util mt40">
			

				<p class="result-count"><strong>전체 <b>4</b>건</strong></p>

				<div class="board-search">
					<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
					<button type="button" class="btn-search-input">검색</button>
				</div>
			</div>
		</div>

		<div id="event-list-wrap">


	<div class="inner-wrap">
		

			<div class="event-list ">
          
			
                <input type="hidden" id="totCount" name="totCount" value="4">
				<ul>
				
					<li>
						<a href="https://www.megabox.co.kr/event/curtaincall#" data-no="14248" data-netfunnel="N" class="eventBtn" title="&lt;화란&gt; 개봉주 무대인사 상세보기">
							

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> <img src="./eventtab_files/YX9pCGwSR3XIT8W5U7JF0ketc3YPuUav.jpg" alt="&lt;화란&gt; 개봉주 무대인사" onerror="noImg(this);"></p>

							<p class="tit">
								&lt;화란&gt; 개봉주 무대인사
							</p>

							<p class="date">
								2023.10.14 ~ 2023.10.15
							</p>
						</a>
                
					</li>

				
					<li>
						<a href="https://www.megabox.co.kr/event/curtaincall#" data-no="14170" data-netfunnel="N" class="eventBtn" title="&lt;30일&gt; 2주차 무대인사 상세보기">
							

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> <img src="./eventtab_files/Je1xxOx0rnPcpShyrOgQvbmczlwVKnE8.jpg" alt="&lt;30일&gt; 2주차 무대인사" onerror="noImg(this);"></p>

							<p class="tit">
								&lt;30일&gt; 2주차 무대인사
							</p>

							<p class="date">
								2023.10.14 ~ 2023.10.15
							</p>
						</a>
                
					</li>

				
					<li>
						<a href="https://www.megabox.co.kr/event/curtaincall#" data-no="14200" data-netfunnel="N" class="eventBtn" title="&lt;퍼피 구조대: 더 마이티 무비&gt; 코스튬 무대인사 상세보기">
							

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> <img src="./eventtab_files/yegomYF0LoTGFjRbI4pZLfGcGm969osC.jpg" alt="&lt;퍼피 구조대: 더 마이티 무비&gt; 코스튬 무대인사" onerror="noImg(this);"></p>

							<p class="tit">
								&lt;퍼피 구조대: 더 마이티 무비&gt; 코스튬 무대인사
							</p>

							<p class="date">
								2023.10.07 ~ 2023.10.15
							</p>
						</a>
                
					</li>

				
					<li>
						<a href="https://www.megabox.co.kr/event/curtaincall#" data-no="14162" data-netfunnel="N" class="eventBtn" title="&lt;익스펜더블4&gt; 무비플러스 회원 시사회 상세보기">
							

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> <img src="./eventtab_files/RLDbVyII0mo0Ec29W92eiMhj2wNjXVxG.jpg" alt="&lt;익스펜더블4&gt; 무비플러스 회원 시사회" onerror="noImg(this);"></p>

							<p class="tit">
								&lt;익스펜더블4&gt; 무비플러스 회원 시사회
							</p>

							<p class="date">
								2023.09.26 ~ 2023.10.15
							</p>
						</a>
                
					</li>

				
				</ul>
			
          
			</div>
		
		
		</div>
	</div>
	</div>

	</div>	<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>