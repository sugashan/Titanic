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

//CLEAR FIELDS
function resetCustom(){
	mealId = "";
	price = 0;
	totalPrice = 0;
	mealName = "";
	mealImage = "";
	mealOrder = {};
	foodCart = [];
	$("#addedOrderTableBody  > tbody").html("");
	$(".orderCartInfo").css("display", "block");
	$(".orderPaymentInfo").css("display", "none");
	
	 $('.form-control').each(function () {
		 $('.form-control').val('');
	 });
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