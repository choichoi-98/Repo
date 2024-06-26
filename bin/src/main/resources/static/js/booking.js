$(document).ready(function(){
	var selectCnt = 0;
	var checkCnt=0;

	function seat_alert() {
		$('.seat-count-before').css('display', 'none');
	}

	$('.seat-count').click(function() {
		seat_alert();
	})

	$('.seat-count-before').click(function() {
		seat_alert();	
	})

	$('.count > button.up').click(function() {
		var $count = $(this).prev().find('button');
		var currentValue = $count.text();

		if(checkCnt >= 8){
			return;
		}
		if(currentValue >= 8) {
			return;
		}

		currentValue++;	
		checkCnt++;
		$count.text(currentValue);

		addDashboardSeat();
		getPrice();
		checkSelectCnt();
	})

	$('.count > button.down').click(function() {
		var $count = $(this).next().find('button');
		var currentValue = $count.text();

		if(currentValue <= 0) {
			return;
		}

		currentValue--;
		checkCnt--;
		$count.text(currentValue);	

		if(selectCnt > checkCnt){
			reset();
		}
		deleteDashboardSeat();
		getPrice();
		checkSelectCnt();
	})

	$('.common').mouseenter(function () { 
		if(checkCnt > 0 && checkCnt-selectCnt > 0){
			$(this).addClass('on');
		}

		if(checkCnt-selectCnt >= 2){ // 4명 이상 선택된거 정리
			if(Number($(this).attr('blockLength')) - Number($(this).attr('blockIndex')) == 0){
				$(this).addClass('on').prev().addClass('on');
			}else {
				$(this).addClass('on').next().addClass('on');
			}
			
		}

	});
	$('.common').mouseleave(function () { 
		if(!$(this).hasClass('choice')){
		  $(this).removeClass('on');
		}

		if(checkCnt-selectCnt >= 2){
			if(Number($(this).attr('blockLength')) - Number($(this).attr('blockIndex')) == 0){
				$(this).removeClass('on').prev().removeClass('on');
			}else {
				$(this).removeClass('on').next().removeClass('on');
			}
			
		}

		
	});


	$('.common').click(function() {
		if($(this).hasClass('impossible')){
			return false;
		}

		if(checkCnt ==0 || selectCnt>=checkCnt || $(this).hasClass('choice')){
			return false;
		}

		if(checkCnt-selectCnt >= 2){ // 2명 이상 선택
			if(Number($(this).attr('blockLength') == 1)){ 
				selectCnt++;
				$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).attr('data-seat-num'));
	
				$(this).addClass("choice");

				checkSelectCnt();
				return;
			}

			if(Number($(this).attr('blockLength')) - Number($(this).attr('blockIndex')) == 0){ //우측끝값
				selectCnt = selectCnt + 2;
				$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).attr('data-seat-num'));
				$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).prev().attr('data-seat-num'));

				$(this).addClass("choice").prev().addClass("choice");

			}else {
				selectCnt = selectCnt + 2;
				$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).attr('data-seat-num'));
				$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).next().attr('data-seat-num'));

				$(this).addClass("choice").next().addClass("choice");
			}

			
		
		}else{ // 1명 선택
			selectCnt++;

			$('#dashboard-seat > .possible').eq(0).attr('class','seat choice').text($(this).attr('data-seat-num'));
	
			$(this).addClass("choice");
		}
		
		if(checkCnt!=0 && selectCnt==checkCnt){
			$('#pageNext').attr('class', 'button active');
		}else {
			$('#pageNext').attr('class', 'button disabled');
		}

		checkSelectCnt();

	})

	$('#reset-seat-select').click(function() {
		reset()

	})

	$('#pageNext').click(function() {
		var scheduleId = $('#hidden-scheduleId').val();
		var price = $('.money').find('em').text();
		var seats = '';

		$('#dashboard-seat > .choice').each(function(index, item){
			seats += '&seat=' + $(this).text();
		})


		location.href = '/movieplus/booking/cart?scheduleId='+scheduleId+'&price='+price+seats;
	})


	function addDashboardSeat(){
		$('#dashboard-seat > .seat').eq(checkCnt-1).attr('class', 'seat possible')
	}

	function deleteDashboardSeat(){
		$('#dashboard-seat > .seat').eq(checkCnt).attr('class', 'seat all')
	}

	function getPrice(){
		var type = $('#jojosimya').val();
		var childPrice;
		var adultPrice;

		switch(type){
			case 'normal':
				childPrice = 13000;
				adultPrice = 15000;
				break;
			case 'jojo':
				childPrice = 10000;
				adultPrice = 12000;
				break;
			case 'simya':
				childPrice = 11000;
				adultPrice = 13000;
				break;
		}

		var adultTotal = Number($('#adult-btn').text()) * adultPrice;
		var childTotal = Number($('#child-btn').text()) * childPrice;

		$('.money').find('em').text(adultTotal+childTotal);
	}

	function reset(){
		selectCnt = 0;
		checkCnt = 0;
		$('#adult-btn').text('0');
		$('#child-btn').text('0');
		$('#dashboard-seat > .seat').attr('class', 'seat all').text('-');
		$('.money').find('em').text('0');
		$('.common').attr('class','jq-tooltip seat-condition standard common');
		$('#pageNext').attr('class', 'button disabled');
	}

	function checkSelectCnt(){
		if(checkCnt-selectCnt==1){
			$('.common[selectiontype="non-solo"]:not(.choice)').addClass('impossible view');
		}else{
			$('.common[selectiontype="non-solo"]').removeClass('impossible view');
		}
	}


});
