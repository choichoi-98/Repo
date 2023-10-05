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
	<script src="${pageContext.request.contextPath}/resources/js/scheduling.js"></script>

	<main class="main">
		<!-- main title -->	
		<div class="col-12">
			<div class="main__title">
				<h2>상영 스케줄 관리</h2>
				
				<div class="main__title-wrap">
					<!-- filter sort -->
					<input id="todayDateId" type="date" name="schedule-date" value="${todayDate}" style="margin-right:50px; width:200px;" />
					<div class="filter" id="filter__sort">
						<span class="filter__item-label">조회</span>

						<div class="filter__item-btn dropdown-toggle" role="navigation"
							id="filter-sort" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<input type="button" value="${theaterName}"> <span></span>
						</div>

						<ul id="selected-room-id" class="filter__item-menu dropdown-menu scrollbar-dropdown"
							aria-labelledby="filter-sort">
							<li>${theaterName}<input type="hidden" name="schedule-room-id" value="all"></li>
							<c:forEach var="room" items="${roomList}">
								<li>${room.THEATER_ROOM_NAME}<input type="hidden" name="schedule-room-id" value="${room.THEATER_ROOM_ID}"></li>
							</c:forEach>
						</ul>
						
						
					</div>
					<a href="#" class="main__title-link">조회하기</a>
					<!-- end filter sort -->
				</div>
			</div>


		</div>
		<!-- end main title -->
		<c:forEach var="room" items="${roomList}">
			<div class="col-7 room-container" id="theaterRoom-${room.THEATER_ROOM_ID}">
				<div class="theater-room-name">
					${room.THEATER_ROOM_NAME} <a href="#"
						class="main__table-btn main__table-btn--banned"> <i
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

				<tbody>
					


				</tbody>
				
			</table>
			</div>	
		</c:forEach>


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