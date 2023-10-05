<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>
.main__table {
	min-width: 0px;
}

.theater-room-name {
	display: flex;
	font-size: 15pt;
	color: white;
}

.room-container {
	margin-bottom: 50px;
}
</style>

<body>

	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/scheduling.js"></script>

	<main class="main">
		<!-- main title -->
		<div class="col-12">
			<div class="main__title">
				<h2>상영 스케줄 관리</h2>

				<div class="main__title-wrap">
					<!-- filter sort -->
					<input id="todayDateId" type="date" name="schedule-date"
						value="${todayDate}" style="margin-right: 50px; width: 200px;" />
					<div class="filter" id="filter__sort">
						<span class="filter__item-label">조회</span>

						<div class="filter__item-btn dropdown-toggle" role="navigation"
							id="filter-sort" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<input id="selected-room-id" type="button" value="${theaterName}">
							<span></span>
						</div>

						<ul class="filter__item-menu dropdown-menu scrollbar-dropdown"
							aria-labelledby="filter-sort">
							<li class="filter-li-room">${theaterName}<input
								type="hidden" name="schedule-room-id" value="all"></li>
							<c:forEach var="room" items="${roomList}">
								<li class="filter-li-room">${room.THEATER_ROOM_NAME}<input
									type="hidden" name="schedule-room-id"
									value="${room.THEATER_ROOM_ID}"></li>
							</c:forEach>
						</ul>


					</div>

					<!-- end filter sort -->
				</div>
			</div>


		</div>
		<!-- end main title -->
		<c:forEach var="room" items="${roomList}">
			<div class="col-7 room-container"
				id="theaterRoom-${room.THEATER_ROOM_ID}">
				<div class="theater-room-name"
					id="theaterRoom-${room.THEATER_ROOM_NAME}">
					${room.THEATER_ROOM_NAME} <a href="#modal-status"
						class="main__table-btn main__table-btn--banned open-modal"> <i
						class="icon ion-ios-film feature__icon"></i>
					</a>
				</div>
				<table class="main__table">
					<thead>
						<tr>
							<th>상영 순서</th>
							<th>영화 제목</th>
							<th>좌석 수</th>
							<th>상영 시간</th>
						</tr>
					</thead>

					<tbody class="tbody-schedule">



					</tbody>

				</table>
			</div>
		</c:forEach>



		<!-- modal add -->
		<div id="modal-status" class="zoom-anim-dialog mfp-hide modal"
			style="width: 1000px; max-width: 1500px; height: 600px">
			<h6 class="modal__title">스케줄 추가</h6>
			<div class="col-12" style="height: 80%; display: flex;">
				<div class="dashbox" style="height: 100%;">
					<div class="dashbox__title">
						<h3>
							<i class="icon ion-ios-trophy"></i> 전체 영화 목록
						</h3>

						<input type="text" placeholder="영화 검색" style="width: 50%">
					</div>

<div style="width:100%; height:200px; overflow:auto">
					<table class="main__table main__table--dash">
						<thead>
							<tr>
								<th>영화코드</th>
								<th>영화제목</th>
							</tr>
						</thead>
						<tbody id="movieListAllTable">

							<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
														<tr style="color: white;">
								<td>20233014</td>
								<td><a href="#">타겟</a></td>
							</tr>
							<tr style="color: white;">
								<td>20233115</td>
								<td><a href="#">에릭 클랩튼: 어크로스 24 나이츠</a></td>
							</tr>
							
						</tbody>
					</table>
					</div>
				</div>
				<div class="col-6">
					<input type="time" />
				</div>
			</div>



			<div class="modal__btns">
				<button id="change-status-modal-btn"
					class="modal__btn modal__btn--apply" type="button">확인</button>
				<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
			</div>
		</div>
		<!-- end modal add -->

		<!-- modal delete -->
		<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
			<h6 class="modal__title">스케줄 삭제</h6>

			<p class="modal__text">정말로 삭제하시겠습니까?</p>

			<div class="modal__btns">
				<button id="delete-room-modal-btn"
					class="modal__btn modal__btn--apply" type="button">삭제</button>
				<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
			</div>
		</div>
		<!-- end modal delete -->

	</main>
</body>

<style>
#theater-schedule-table {
	background: gray;
	text-align: center;
	border: 1px solid white;
	margin-bottom: 5px;
}

#theater-schedule-table tr {
	border: 0.5px solid b
}

#theater-schedule-table th {
	width: 200px;
}

#theater-schedule-table th:first-child {
	width: 50px;
}

#theater-schedule-table tr>td {
	height: 100px;
}
</style>
</html>