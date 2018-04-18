// TIME AND DATE
function timeDateNow(timeOrDate){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var hour = today.getHours();
	var min = today.getMinutes() + 30;
	var ampm = "AM";
	
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	if(hour>12){
		ampm = "PM"
	}
	if(min<10){
		min='0'+min;
	}
	
	var todayDate = mm+'/'+dd+'/'+yyyy;
	var todayTime = hour+':'+min+' '+ampm;
	
	if(timeOrDate == "time"){
		return todayTime;
	}
	else if(timeOrDate == "date"){
		return todayDate;
	}
}


// SHOW PAYMENT
function showPayment(){
	$(".orderDeliveryInfo").css("display", "none");
	$(".orderCartInfo").css("display", "none");
	$(".orderPaymentInfo").css("display", "block");
}


// COLLECTECTING DELIVERY PICK UP INFO
function collectPickDeliveryInfo(orderType){
	var checkEmptyTime = "";
	var checkEmptyDate = "";
	 var delivery = {};
	 var pickUp = {};
	var detailInfoDelPick = "";
	
	
	if(orderType == "PickUp"){
		 $('.delivery').each(function () {
			 $('.delivery').val('');
		 });
		 checkEmptyTime =  $('.timepickerforPickUp').val();
		 checkEmptyDate = $('.datepickerforPickUp').val();
		 
		 pickUp.pickUpDate = checkEmptyTime;
		 pickUp.pickUpTime = checkEmptyDate;
		 detailInfoDelPick = JSON.stringify(pickUp);
	}
	else if(orderType == "Delivery"){
		 $('.pickUp').each(function () {
			 $('.pickUp').val('');
		 });
		 checkEmptyTime =  $('.timepickerfordelivery').val();
		 checkEmptyDate = $('.datepickerfordelivery').val();
		 
		 delivery.recieverCustName = $("#recieverCustName").val();
		 delivery.deliveryTime = checkEmptyTime;
		 delivery.deliveryDate = checkEmptyDate;
		 delivery.houseNumber = $("#houseNumber").val();
		 delivery.refMobile = $("#refMobile").val();
		 delivery.deliveryAddress = $("#deliveryAddress").val();
		 detailInfoDelPick = JSON.stringify(delivery);
	}
	
	$("#orderType").val(orderType);
	$("#tempStringForDeliveryOpt").val(detailInfoDelPick);
	
	if(checkEmptyTime.trim() == "" || checkEmptyDate.trim() == ""){
		$("#alertMsg").css("color", "red");
		$("#alertMsg").html("Please Select time for " + orderType + ".");
	}
	else if($("#recieverCustName").val().trim() == "" || $("#deliveryAddress").val().trim() == "" || $("#refMobile").val().trim() == ""){
		$("#alertMsg").css("color", "red");
		$("#alertMsg").html("Please fill fileds for " + orderType + ".");
	}
	else{
		$("#alertMsg").css("color", "#999");
		$("#alertMsg").html("Please fill these to get your Order!");
		showPayment();
	}
}


//CONTROL TOGGLE SWTICH
$("#pickupNow").change(function(){
	
	if($("#pickupNow").prop('checked') == true){
		$(".timepickerforPickUp").val(timeDateNow("time"));
		$(".datepickerforPickUp").attr("type", "text");
		$(".datepickerforPickUp").val(timeDateNow("date"));
	}
	if($("#pickupLater").prop('checked') == true){
		$("#pickupLater").bootstrapToggle("off");
	}
});

$("#pickupLater").change(function(){
		$(".datepickerforPickUp").attr("type", "date");
		$(".timepickerforPickUp").val("");
		$(".datepickerforPickUp").val("");
		if($("#pickupNow").prop('checked') == true){
			$("#pickupNow").bootstrapToggle("off");
	}
	});

// DELIVERY
$("#deliverNow").change(function(){

	if($("#deliverNow").prop('checked') == true){
		$(".timepickerfordelivery").val(timeDateNow("time"));
		$(".datepickerfordelivery").attr("type", "text");
		$(".datepickerfordelivery").val(timeDateNow("date"));
	}
	if($("#deliverLater").prop('checked') == true){
		$("#deliverLater").bootstrapToggle("off");
	}
});

$("#deliverLater").change(function(){
		$(".datepickerfordelivery").attr("type", "date");
		$(".timepickerfordelivery").val("");
	$(".datepickerfordelivery").val("");
		if($("#deliverNow").prop('checked') == true){
		$("#deliverNow").bootstrapToggle("off");
	}
});