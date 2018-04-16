<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.titanic.other.TitanicMessageConstant" %>
<%@ include file="../../layouts/taglib.jsp" %>
<%@ include file="../common/commonModals.jsp" %>


<style>
.labelPay{
	    background-color: black;
    /* left: -33%; */
    color: white;
    width: 200px;
    text-align: center;
    padding: 5px;
}

.inputPay{
	margin-top: -90px; 
	width: 200px;
	 height: 50px; 
	 text-align: center;
	  margin-left: 33%; 
	  font-size: 40px;
}

</style>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-order" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Orders</h3>
       		 	 <c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="orderTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Customer</th>
							<th>Ordered-On</th>
							<th>Delivery-Type</th>
							<th>To - Deliver - Time</th>
							<th>Status</th>
						</tr>
					</thead>

					<tbody id="order-content-body">
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteOrder/${order.id}/${order.orderType}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> <c:out value="${order.orderCode}"/></td>
								<td><a class="btn" href='<spring:url value="order-detail-payment/${order.id}/${order.orderType}.do" />'><c:out value="${order.customer.user.userName}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail-payment/${order.id}/${order.orderType}.do" />'><c:out value="${order.orderedOn}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail-payment/${order.id}/${order.orderType}.do" />'><c:out value="${order.orderType}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail-payment/${order.id}/${order.orderType}.do" />'><c:out value="${order.expectedDeliverTime}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}/${order.orderType}.do" />'>
								<c:if test="${order.orderStatus eq 'Accepted'}">
									<span style="color:blue"><c:out value="${order.orderStatus}"/></span>
								</c:if>
								<c:if test="${order.orderStatus eq 'Rejected'}">
									<span style="color:red"><c:out value="${order.orderStatus}"/></span>
								</c:if>
								<c:if test="${order.orderStatus eq 'Delivered'}">
									<span style="color:green"><c:out value="${order.orderStatus}"/></span>
								</c:if>
								<c:if test="${order.orderStatus eq 'Paid'}">
									<span style="color:yellow"><c:out value="${order.orderStatus}"/></span>
								</c:if>
								<c:if test="${order.orderStatus eq 'Cancel'}">
									<span style="color:orange"><c:out value="${order.orderStatus}"/></span>
								</c:if>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Customer</th>
							<th>Ordered-On</th>
							<th>Delivery-Type</th>
							<th>To - Deliver - Time</th>
							<th>Status</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- New Order modal -->
  <div class="modal fade" id="add-order" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title" style="text-align: center;"><b>Add New Order</b></h4>
     	 </div>
     	  <form:form modelAttribute="newOrderFromAdmin" enctype="application/x-www-form-urlencoded" method="post" >
     	 <div class="alert alert-info validMsg">Fill All Blanks And Hit Submit.</div>
	        	<div class="modal-body">
					  <!-- ORDER BASIC INFO -->
					  <div class="orderCartInfo" style="display:block;">
					  	   <div class="row">
							    <div class="form-group col-md-12">
							   		<label for="exampleInputEmail1" Class="difColor">Dine-In-Order :</label>
							    	<input type="checkbox" id="checkOrderTypeForDine" class="form-control" data-toggle="toggle" data-style="ios"
												data-on="True" data-off="False" /> 
							    </div>
						  </div>
					  	  <div class="row">
							    <div class="form-group col-md-6">
							   		 <label for="exampleInputEmail1" Class="difColor">Customer Name :</label>
							    	 <form:input path="customer.user.name" cssClass="form-control textFiled custName"/>
							    	  <span style="color:red;"><form:errors path="customer.user.name" type="text"/></span>
							    </div>
							     <div class="form-group col-md-6">
							   		 <label for="exampleInputEmail1" Class="difColor">Customer Mobile :</label>
							    	 <form:input path="customer.user.mobile" cssClass="form-control textFiled custCheckMobile"/>
							    	  <span style="color:red;"><form:errors path="customer.user.mobile" type="number"/></span>
							    </div>
					 	 </div>  
						  <fieldset class=" col-md-12">
									<legend>
										Select Order : <span id="priceTag" style="float: right;"></span>
									</legend>
									<table  class="col-md-12" style="width: 100%; text-allign: center;">
										<thead>
											<tr style="border: 1px solid black">
												<th style="background-color: black; color: white;  width:125px">Name</th>
												<th style="background-color: black; color: white;">Qty</th>
												<th style="background-color: black; color: white;">Unit-Price</th>
												<th style="background-color: black; color: white; width:200px">Custom-Info</th>
												<th style="background-color: black; color: white;"></th>
											</tr>
										</thead>
										<tbody id="orderMealTableBody">
											<c:forEach items="${newOrderFromAdmin.foodOrder}" varStatus="status" var="foodOrder" >
												<tr id ="${status.index}" data-amount-for-row="0">
													<td><form:select path="foodOrder[${status.index}].mealId" class="form-control mealSelect selectboxField" id="mealId${status.index}">
															<c:forEach items="${meals}" var="meal">
																<form:option value="${meal.id}" label="${meal.name}"/>
															</c:forEach>
														 </form:select>
														 <form:input type = "text" path="foodOrder[${status.index}].mealName" id= "mealName${status.index}" hidden="true"/>
													</td>
													<td><form:input type = "number" path="foodOrder[${status.index}].quantity" min="0" class="quantity form-control" value="0" id= "quantity${status.index}" /></td>
													<td><input type = "text" id="unitPrice${status.index}" class="form-control priceSetZero" disabled="disabled" data-price=""/></td>
													<td><form:input type = "text" path="foodOrder[${status.index}].customizedFoodMsg" class="form-control" id="customizedFoodMsg${status.index}"/></td>
													<td><a class="btn text-danger triggerRemove" href='#'> <i class="fa fa-trash-o"></i></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
						    </fieldset>
							 <br/>
					  </div>
					   
					   <!-- PAYMENT INFO -->	
					  <div class="orderPaymentInfo" style="display: none">
							<form:input path="foodOrderString" hidden="hidden"/>
							<fieldset class=" col-md-12">
								<legend>
									Your Order : <span id="priceTag" style="float: right;"></span>
								</legend>
									<div class="row">
										<div class="form-group col-md-12"  style="margin-left: 31%;">
											<label class="labelPay">Total  ( LKR ) </label>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<form:input path="payment.total" class="totalAmount inputPay" type = "number" step="0.01" style=" border: 2px solid black;"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12" style="margin-left: 31%;">
											<label class="labelPay">Given  ( LKR ) </label>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<form:input path="payment.given" class="totalgiven inputPay" type = "number" step="0.01" style=" border: 2px solid black;"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12"  style="margin-left: 31%;">
											<label class="labelPay">Balance ( LKR ) </label>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<input class="balance inputPay" type = "number" step="0.01" style=" border: 2px solid black;"/>
										</div>
									</div>
							</fieldset>
						</div>
					   
					    <!-- ORDER INFO -->
					  	<div class="orderDeliveryInfo" style = "display:none;">
							<ul class="nav nav-pills nav-justified" id="pills-tab-order">
								<li class="active" data-order-type="PickUp"><a data-toggle="pill" href="#pills-Pick" >Pick	up</a></li>
								<li data-order-type="Delivery"><a data-toggle="pill" href="#pills-Delivery" >Delivery</a></li>
							</ul>
							
								<p id="alertMsg" style="text-align: center; font-size: 16px; padding-top: 10px;">Please fill
									these to Order!</p>
							
							<form:input path="orderType" hidden="hidden"/>
							<form:input path="tempStringForDeliveryOpt" hidden="hidden"/>
							
						<div class="tab-content" id="pills-tabContent">
							
							<!--PICK UP PILL -->
							<div class="tab-pane fade in active" id="pills-Pick">
								<br />
									<div class="row">
										<div class="form-group col-md-12">
											<input type="checkbox" id="pickupNow" name="testp[]" class="form-control" data-toggle="toggle" data-style="ios" data-on="True"
												data-off="False" /> 
											<label for="exampleInputEmail1">PickUp Now</label>
											<input type="checkbox" id="pickupLater" name="testp[]"	class="form-control" data-toggle="toggle" data-style="ios"
												data-on="True" data-off="False" /> 
											<label	for="exampleInputEmail1">PickUp Later</label>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Pick Up Time :</label>
											 <input type="text"  id="Time1"
 														placeholder="Time"  
 														class="pickUp timepickerforPickUp form-control timepicker"
  														value="Time" onkeypress="return false;"
  														style="height: 35px;" /> 
										</div>
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Pick Up Date :</label> 
											<input id="datepicker"
  													type="text" class="dateField pickUp datepickerforPickUp form-control"  />  
										</div>
									</div>
									<div style="background-color: aliceblue;">
										<hr />
										<p>
											<b>Note:</b> Time may differ with the outlet selected below.
										</p>
									</div>
									<div class="row" style="padding-top: 15px;">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Branch Outlet :</label> 
											<form:select path="outletBranch" class="form-control selectboxField">
												<form:option value="Nelliyady-Titanic">Nelliyady-Titanic</form:option>
											</form:select>
										</div>
									</div>
							</div>
								
							<!--DELIVERY PILL -->
							<div class="tab-pane fade col-md-12" id="pills-Delivery">
									<br />
									<div class="row">
										<div class="form-group col-md-12">
											<input type="checkbox" id="deliverNow" name="testd[]" class="form-control"	data-toggle="toggle" data-style="ios" data-on="True"
															data-off="False" /> 
											<label for="exampleInputEmail1">Deliver	Now</label> 
												
											<input type="checkbox" id="deliverLater" name="testd[]" class="form-control" data-toggle="toggle" data-style="ios"
															data-on="True" data-off="False" /> 
											<label	for="exampleInputEmail1">Deliver Later</label>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Deliver Time :</label> 
											<input type="text" name="Time2"
	  												placeholder="Time" class="delivery timepicker timepickerfordelivery form-control" 
	 	 											style="height: 35px;"/>  
										</div>
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Deliver Date :</label> 
											<input type="text" id="datepicker2"
	 	 											class="delivery dateField datepickerfordelivery form-control" /> 
										</div>
									</div>
									<div style="background-color: aliceblue;">
										<hr />
										<p>Note: Time may differ with the distance and traffic.</p>
									</div>
									<div class="row" style="padding-top: 15px;">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Customer fullName* :</label>
											<input type="text" id="recieverCustName" class="textFiled delivery form-control custName"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">House Number* :</label> 
											<input type="text" id="houseNumber" class="delivery form-control" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Delivery Address* :</label> 
											<input type="text" id="deliveryAddress" class="textFiled delivery form-control custAddress"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Ref-Mobile Number* :</label>
											<input type="text"	id="refMobile" class="numberFiled delivery form-control custMobile" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				  
				  
			     <div class="modal-footer">
			     	<div class="orderCartInfo">
						<button class="btn btn-success btn-block" onclick="directOrderInfo()"
							type="button" id="directDeliveryBtn">
							<i class="fa fa-cutlery" aria-hidden="true"></i> Continue Order Info
						</button>
					</div>
					<div class="orderDeliveryInfo" style="display: none;">
						<button class="btn btn-success btn-block" onclick="directPayment()"
							type="button" id="directpaymentBtn">
							<i class="fa fa-cutlery" aria-hidden="true"></i> Continue Order
						</button>
					</div>
					<div class="orderPaymentInfo" style="display: none;">
					 	 <div class="form-group col-md-6">
				     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal" onclick="resetField()">
				     	     <i class="fa fa-close"></i> Cancel</button>
					 	  </div>
					    	
					 	<div class="form-group col-md-6">
					     	 <button type="submit"  id="submitBtn" class="btn btn-lg btn-block btn-success">
					        <i class="fa fa-floppy-o"></i> Submit</button>
					  	</div>
					</div>
				</div>
			</form:form>
     	 </div>
    </div>
 </div>

  <!-- ORDER COMMON SCRIPT -->
  <script type="text/javascript" src="<c:url value="/resources/common/js/commonOrderScript.js" />"></script>

  <script type="text/javascript">
  
  var mealString = ${mealString};
  var totalPrice = 0;
  
   // PRINT ORDER TABLE
   function createTable(){
		 $.get('http://localhost:8080/titanic/orders/allOrders.do', 
	             function(data){
			 		console.log(data);
			 		if(data.message == "Success"){
			 			if(data.result != "" || data.result != null){
			 				$.each(data.result, function(i, newOrder){
			 					var htmlStr = "<tr>";
			 					htmlStr += "<td><a class='btn' href='order-detail-payment/"+ newOrder.id + ".do'><i class='fa fa-pencil-square-o'></i></a> <a class='btn text-danger triggerRemove'	href='deleteOrder/" + newOrder.id + ".do' />'> <i class='fa fa-trash-o'></i></a>" + newOrder.orderCode + "</td>";
								htmlStr += "<td><a class='btn' href='order-detail-payment/" + newOrder.id + ".do'>" + newOrder.customer.user.name + "</a></td>";
								htmlStr += "<td><a class='btn' href='order-detail-payment/" + newOrder.id + ".do'>" + newOrder.orderedOn + "</a></td>";
								htmlStr += "<td><a class='btn' href='order-detail-payment/" + newOrder.id + ".do'>" + newOrder.orderType + "</a></td>";
								htmlStr += "<td><a class='btn' href='order-detail-payment/" + newOrder.id + ".do'>" + newOrder.expectedDeliverTime + "</a></td>";
								htmlStr += "<td><a class='btn' href='order-detail-payment/" + newOrder.id + ".do'>" + newOrder.orderStatus + "</a></td>";
								
								console.log(htmlStr);
								$("#order-content-body").prepend(htmlStr);
			 				});
			 			}
			 		}
		  }, 'json');
	}
  

   // CHECK USER FOR MOBILE
	$('.custCheckMobile').on('change', function () {
        $.get('http://localhost:8080/titanic/users/CustomerWithMobile.do?mobile=' +$(this).val(), 
            function(data){
                if(data.message == "success"){
              	  $(".custName").val(data.result.userName);
              	  $(".custAddress").val(data.result.address);
              	  $(".custMobile").val(data.result.mobile);
                }
          }, 'json');
    });
 	
	
	// EVENT CHANGE ON MEAl ORDER
	$(".mealSelect").change(function priceEachMeal(){
		var price = 0;
		var mealId = $(this).val();
		var mealName = $(this).find("option:selected").text();
		var dataId = $(this).closest("tr").attr("id");
		$("#mealName"+dataId).val(mealName);
		$.each(mealString, function(i, meal){
			if(meal.id == mealId){
				price = meal.price;
				$("#unitPrice"+dataId).val("LKR " + price);
				$("#unitPrice"+dataId).attr("data-price" , price);
				calcPriceForRow(dataId, "addNew");
			}
		});
	});
	
	
	// EVENT TO DELETE A ROW
	$(".triggerRemove").on("click", function(){
		var dataId = $(this).closest("tr").attr("id");
		calcPriceForRow(dataId, "deduct");
		document.getElementById("orderMealTableBody").deleteRow(dataId);
	})
	
	
	// QUANTITY FIELD CHANGE
	$(".quantity").change(function(){
		var dataId = $(this).closest("tr").attr("id");
		calcPriceForRow(dataId, "addNew");
	});
	
	
	// FIND TOTAL
	function calcPriceForRow(dataId, methodStr){
		var unitPrice = 0;
		unitPrice = $("#unitPrice"+dataId).attr("data-price");
		var quantity =0;
		quantity = $("#quantity"+dataId).val();
		var rowPrice = 0;
		rowPrice = $("#"+dataId).attr("data-amount-for-row");
		
		if(methodStr == "deduct"){
			totalPrice = totalPrice - rowPrice;
			if( totalPrice < 0){
				totalPrice = 0;
			}
		}
		else if(methodStr == "addNew"){
			if(rowPrice != 0){
				totalPrice = totalPrice - rowPrice;
			}
			rowPrice = quantity * unitPrice;
			totalPrice = totalPrice + rowPrice;
		}
		$("#"+dataId).attr("data-amount-for-row", rowPrice);
		$("#priceTag").html("Total : Rs " + totalPrice.toFixed(2));
	}
	
	
	//DECIDER FOR DIRECTION FURTHER PAYEMNT OR INFO
	function directOrderInfo(){
		
		if($(".custCheckMobile").val().trim() == ""){
			$(".validMsg").removeClass("alert-info").addClass("alert-danger");
			$(".validMsg").html("Enter Mobile Number");
		}
		else if(totalPrice == 0){
			$(".validMsg").removeClass("alert-info").addClass("alert-danger");
			$(".validMsg").html("Order Meals");
		}
		else{
			$(".validMsg").removeClass("alert-danger").addClass("alert-info");
			$(".validMsg").html("Fill All Blanks And Hit Submit.");
			$(".totalAmount").val(totalPrice.toFixed(2));
			if($("#checkOrderTypeForDine").prop('checked') == true){
				$("#orderType").val("Dine-In");
				directPayment();
			}
			else{
				$("#orderType").val();
				directDelivery();
			}
		}
	}
	
	
	// DIRECT TO DELIVERY INFO
	function directDelivery(){
		$(".orderCartInfo").css("display", "none");
		$(".orderDeliveryInfo").css("display", "block");
	}
	
	
	// SHOW PAYMENT
	function showPayment(){
		$(".orderDeliveryInfo").css("display", "none");
		$(".orderCartInfo").css("display", "none");
		$(".orderPaymentInfo").css("display", "block");
	}
	
	
	// DIRECT TO PAYMENT INFO
	function directPayment(){
		var checkEmptyTime = "";
		var checkEmptyDate = "";
		 var delivery = {};
		 var pickUp = {};
		var detailInfoDelPick = "";
		
		if($("#orderType").val().trim() == ""){
			var orderType = $("#pills-tab-order li.active").attr("data-order-type");
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
			else{
				$("#alertMsg").css("color", "#999");
				$("#alertMsg").html("Please fill these to get your Order!");
				showPayment();
			}
		}
		else{
			 $('.delivery').each(function () {
				 $('.delivery').val('');
			 });
			 $('.pickUp').each(function () {
				 $('.pickUp').val('');
			 });
			 showPayment();
		}
	}
	
	
	// CALCULATE BALANCE
	$(".totalgiven").change(function (){
		var balance = 0;
		var given =  $(".totalgiven").val();
		if(totalPrice > given){
			 balance = totalPrice - given;
			 $(".balance").css("border", "2px solid #e81212");
		}
		else if(totalPrice < given){
			 balance = given - totalPrice;
			 $(".balance").css("border" , "2px solid #00a65a");
		}
		$(".balance").val(balance.toFixed(2));
	});
	
	
	// RESET
	function resetField(){
		 $('.form-control').each(function () {
			 $('.form-control').val('');
		 });
		 
		 $(".priceSetZero").each(function(){
			 $(this).closest("tr").attr("data-amount-for-row", 0);
			 $(this).attr("data-price", 0);
		 });
		 
		 totalPrice = 0;
		 $("#priceTag").html("Total : Rs " + totalPrice);
		 $("#checkOrderTypeForDine").bootstrapToggle("off");
		 $(".orderDeliveryInfo").css("display", "none");
		 $(".orderCartInfo").css("display", "block");
		 $(".orderPaymentInfo").css("display", "none");
	}
	
	
	$(document).ready(function(){  		
	//	createTable();
		
    	 $('#orderTable').DataTable({
		      "paging": true,
		      "lengthChange": true,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false
	    });  		
    	 
    	 // SHOW CONFIRMATION MODAL TO CANCEL ORDER
    	 $("#confModalText").html("Are you want to cancel this Order?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		$("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 }); 
    	 
    	 //   VALIDATIONS
     	 $("#newOrderFromAdmin").validate();
     	 $("#deliveryOrder").validate();
     	 $("#pickUpOrder").validate();
    	 hideParam();
    	 history.replaceState(null, document.title, "order.do");
   	});
  	
  	</script>