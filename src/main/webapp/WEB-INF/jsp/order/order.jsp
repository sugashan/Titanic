<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../../layouts/taglib.jsp" %>
<%@ include file="../common/commonModals.jsp" %>


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
							<th>Branch</th>
							<th>Status</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteOrder/${order.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> <c:out value="${order.orderCode}"/></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.customer.user.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderedOn}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderType}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.branch.name}"/></a></td>
								<c:if test="${order.orderStatus eq Accepted}">
									<td style="color:blue;"><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
								</c:if>
								<c:if test="${order.orderStatus eq Rejected}">
									<td style="color:red;"><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
								</c:if>
								<c:if test="${order.orderStatus eq Delivered}">
									<td style="color:green;"><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
								</c:if>
								<c:if test="${order.orderStatus eq Paid}">
									<td style="color:black;"><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
								</c:if>
								<c:if test="${order.orderStatus eq Cancel}">
									<td style="color:warning;"><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
								</c:if>
								
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Customer</th>
							<th>Ordered-On</th>
							<th>Delivery-Type</th>
							<th>Branch</th>
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
     	 <div class="alert alert-info">Fill All Blanks And Hit Submit.</div>
	     	 <form:form modelAttribute="newDineInORCallOrder" enctype="application/x-www-form-urlencoded" method="post" >
	        	<div class="modal-body">
	        	
					  <!-- ORDER BASIC INFO -->
					  <div class="orderCartInfo" style="display:block;">
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
					  <hr>
					  
						  <fieldset class=" col-md-12">
									<legend>
										Select Order : <span id="priceTag" style="float: right;"></span>
									</legend>
						  	<div class="row">				    
								<div class="form-group col-md-8">
									<label for="exampleInputEmail1">Meal :</label>
									<select name="meal" class="form-control mealSelect selectboxField" id="selectedMeal">
										<c:forEach items="${meals}" var="meal">
											<option value="${meal.id}"><c:out value="${meal.name}"/></option>
										</c:forEach>
									</select>
								</div>				
			   						
								 <div class="form-group col-md-4">
								 	<label for="exampleInputEmail1">Quantity :</label>
								 	<input type = "number" id="mealQuantity" class=""></input>
								 </div>
		 					</div>
		      						
		      				<div class="row">
								 <div class="form-group col-md-12">
								 	<label for="exampleInputEmail1">Customize Message :</label>
								 	<input type = "number" id="mealCustomizeInfo" class="form-control" />
								 </div>      				
		      				</div>
							
							<div class="row">				    
								<div  class="form-group col-md-12">
									<input type="button" class = "btn btn-success btn-md btn-block" onclick="addMeal()" value="Add Meal"/>
					   			</div>
							</div>
						    </fieldset>
						    
							 <br/>
						  	<fieldset class=" col-md-12">
								<legend>
									Your Order : <span id="priceTag" style="float: right;"></span>
								</legend>
								<table class="col-md-12" style="width: 100%; text-allign: center;">
									<thead>
										<tr style="border: 1px solid black">
											<th style="background-color: black; color: white;">Name</th>
											<th style="background-color: black; color: white;">Qty</th>
											<th style="background-color: black; color: white;">Unit-Price</th>
											<th style="background-color: black; color: white;">Custom-Info</th>
											<th style="background-color: black; color: white;"></th>
										</tr>
									</thead>
		
									<tbody id="addedOrderTableBody">
		
									</tbody>
		
								</table>
							</fieldset>
					  </div>
					    
					    <!-- DELIVERY INFO -->
					  	<div class="orderDeliveryInfo" style = "display:none;">
							<ul class="nav nav-pills nav-justified" id="pills-tab-order">
								<li class="active" data-order-type="Dine-In"><a data-toggle="pill" href="#pills-DineIn" >Dine-In</a></li>
								<li data-order-type="PickUp"><a data-toggle="pill" href="#pills-Pick" >Pick	up</a></li>
								<li data-order-type="Delivery"><a data-toggle="pill" href="#pills-Delivery" >Delivery</a></li>
							</ul>
							
								<p id="alertMsg" style="text-align: center; font-size: 16px">Please fill
									these to get your Order!</p>
							
							<div class="tab-content" id="pills-tabContent">
								<!--DINE-IN PILL -->
								<div class="tab-pane fade in active" id="pills-DineIn">
								
								
								</div>
								
								<!--PICK UP PILL -->
								<div class="tab-pane fade in" id="pills-Pick">
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
												 <form:input type="text" path="pickUpOrder.pickUpTime" id="Time1"
	 														placeholder="Time"  
	 														class="pickUp timepickerforPickUp form-control timepicker"
	  														value="Time" onkeypress="return false;" novalidate="true"
	  														style="height: 35px;" /> 
											</div>
											<div class="form-group col-md-6">
												<label for="exampleInputEmail1" Class="difColor">Pick Up Date :</label> 
												<form:input path="pickUpOrder.pickUpDate" id="datepicker"
	  													type="text" class="dateField pickUp datepickerforPickUp form-control"  
	 	 												novalidate="true" />  
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
											<form:input type="text" path="deliveryOrder.deliveryTime" name="Time2"
	  												placeholder="Time" class="delivery timepicker timepickerfordelivery form-control" 
	 	 											novalidate="true" style="height: 35px;"/>  
										</div>
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Deliver Date :</label> 
											<form:input path="deliveryOrder.deliveryDate" type="text" id="datepicker2"
	 	 											class="delivery dateField datepickerfordelivery form-control" novalidate="true" /> 
										</div>
									</div>
									<div style="background-color: aliceblue;">
										<hr />
										<p>Note: Time may differ with the distance and traffic.</p>
									</div>
									<div class="row" style="padding-top: 15px;">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Customer fullName* :</label>
											<form:input path="deliveryOrder.recieverCustName" class="textFiled delivery form-control custName"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">House Number* :</label> 
											<form:input path="deliveryOrder.houseNumber" class="textFiled delivery form-control" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Delivery Address* :</label> 
											<form:input path="deliveryOrder.deliveryAddress" class="textFiled delivery form-control custAddress"/>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Ref-Mobile Number* :</label>
											<form:input	path="deliveryOrder.refMobile" class="numberFiled delivery form-control custMobile" />
										</div>
									</div>
								</div>
							</div>
							<form:input path="orderType" hidden="hidden"/>
						</div>
						
					  <!-- PAYMENT INFO -->	
					  <div class="orderPaymentInfo" style="display: none">
							<form:input path="foodOrderString" hidden="hidden"/>
							<form:input path="payment.total" class="totalAmount" hidden="hidden"/>
							<fieldset class=" col-md-12">
								<legend>
									Your Order : <span id="priceTag" style="float: right;"></span>
								</legend>
								<table class="col-md-12" style="width: 100%; text-allign: center;">
									<thead>
										<tr style="border: 1px solid black">
											<th style="background-color: black; color: white;">Name</th>
											<th style="background-color: black; color: white;">Qty</th>
											<th style="background-color: black; color: white;">Unit-Price</th>
											<th style="background-color: black; color: white;">Custom-Info</th>
											<th style="background-color: black; color: white;"></th>
										</tr>
									</thead>
		
									<tbody id="addedOrderTableBody">
		
									</tbody>
		
								</table>
							</fieldset>
						</div>
					</div>
				  
				  
			     <div class="modal-footer">
			     	<div class="orderCartInfo">
						<button class="btn btn-success btn-block" onclick="directDelivery()"
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
					 	 <div class="form-group col-md-4">
				     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal">
				     	     <i class="fa fa-close"></i> Cancel</button>
					 	  </div>
					    	<div class="form-group col-md-4">
					     	 <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset">
				     	   <i class="fa fa-repeat"></i> Reset</button>
					 	</div>
					 	<div class="form-group col-md-4">
					     	 <button type="submit" id="submitBtn" class="btn btn-lg btn-block btn-success">
					        <i class="fa fa-floppy-o"></i> Submit</button>
					  	</div>
					</div>
				</div>
			</form:form>
     	 </div>
    </div>
 </div>


  <script type="text/javascript">
  
   // PRINT ORDER TABLE
   function createTable(){
		 $.get('http://localhost:8080/titanic/orders/allOrders.do', 
	             function(data){
			 		console.log(data);
		  }, 'json');
	}
  
   	// CHECK USER FOR MOBILE
	$('.custCheckMobile').on('change', function () {
        $.get('http://localhost:8080/titanic/users/CustomerWithMobile.do?mobile=' +$(this).val(), 
            function(data){
                if(data.message == "success"){
              	  $(".custName").val(data.result.name);
              	  $(".custAddress").val(data.result.address);
              	  $(".custMobile").val(data.result.mobile);
                }
          }, 'json');
    });
 	
	
	// DIRECT TO DELIVERY INFO
	function directDelivery(){
		alert(1);
		$(".orderCartInfo").css("display", "none");
		$(".orderDeliveryInfo").css("display", "block");
	}
	
	// DIRECT TO PAYMENT INFO
	function directPayment(){
		$(".orderDeliveryInfo").css("display", "none");
		$(".orderCartInfo").css("display", "none");
		$(".orderPaymentInfo").css("display", "block");
	}
	
	
	$(document).ready(function(){  		
		createTable();
		
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
//     	 $("#newEmployee").validate();
    	 
   	});
  	
  	</script>