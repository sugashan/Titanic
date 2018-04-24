<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page  import="com.titanic.entity.MealsSchedule" %>
<%@ include file="../../layouts/taglib.jsp" %>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	  	  
		<div class="box">
			<div class="box-header">
				<h3 class="box-title"><c:out value="${singleOrder.order.orderCode}"/> - <b><c:out value="${singleOrder.order.orderType}"/></b> - <c:out value="${singleOrder.order.customer.user.userName}"/></h3>
				<hr>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
			     	 <c:if test="${singleOrder.order.orderStatus eq 'Accepted' }">
			     	 	 <div class="alert alert-info" style = "margin-top:15px; padding:5px;">
			     	 	 	<h4>${singleOrder.order.orderStatus}</h4>
			     	 		<small>Ordered-On : NOW</small>
			     	 	 </div>
			     	 </c:if>
				    <c:if test="${singleOrder.order.orderStatus eq 'Delivered' }">
					     <div class="alert alert-success" style = "margin-top:15px; padding:5px;">
				     	 	 	<h4>${singleOrder.order.orderStatus}</h4>
				     	 		<small>Delivered-On : <c:out value = "${singleOrder.order.lastUpdatedTime}"/></small>
			     	 	 </div>
					</c:if>
					<c:if test="${singleOrder.order.orderStatus eq 'Cancel' }">
						 <div class="alert alert-warning" style = "margin-top:15px; padding:5px;">
				     	 	 	<h4>${singleOrder.order.orderStatus}</h4>
				     	 		<small>Canceled-On : <c:out value = "${singleOrder.order.lastUpdatedTime}"/></small>
			     	 	 </div>
					</c:if>
					<c:if test="${singleOrder.order.orderStatus eq 'Rejected' }">
						 <div class="alert alert-danger" style = "margin-top:15px; padding:5px;">
			     	 	 	<h4>${singleOrder.order.orderStatus}</h4>
			     	 		<small>Rejected-On : <c:out value = "${singleOrder.order.lastUpdatedTime}"/></small>
			     	 	 </div>
					</c:if>  
					<c:if test="${singleOrder.order.orderStatus eq 'Finished' }">
						 <div class="alert alert-success" style = "margin-top:15px; padding:5px;">
			     	 	 	<h4>${singleOrder.order.orderStatus}</h4>
			     	 		<small>Finished-On : <c:out value = "${singleOrder.order.lastUpdatedTime}"/></small>
			     	 	 </div>
					</c:if> 
			</div>
			
			<!-- /.box-header -->
			<div class="box-body">
				 <div class="row">
				    <div class="form-group col-md-4">
				   		 <label for="exampleInputEmail1">Telephone Number :</label>
				    	 <input name="name" class="form-control" disabled value="${singleOrder.order.customer.user.mobile}"/>
				    	  <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-4">
					    <label for="exampleInputEmail1">Ordered-On :</label>
					     <input name="addedOn" class="form-control" disabled type = "text" value="${singleOrder.order.orderedOn}"/>
					   	<span style="color:red;"></span>
				    </div>
				    
				    <div class="form-group col-md-4">
					    <label for="exampleInputEmail1">Order Status :</label>
					     <input class="form-control" disabled type = "text" value="${singleOrder.order.orderStatus}"/>
					   	<span style="color:red;"></span>
				    </div>
				 </div>
				    
				  <div class="row">
				     <div class="form-group col-md-4">
				    	<label for="exampleInputEmail1">Expected-Delivery-Time :</label>
				    	 <input name="code" class="form-control" disabled value="${singleOrder.order.expectedDeliverTime}"/>
				    	  <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-4">
					    <label for="exampleInputEmail1">Order-Price :</label>
					     <input class="form-control" type="text" disabled value="${singleOrder.order.payment.total} LKR"/>
					   	<span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-4">
					    <label for="exampleInputEmail1">Paid-On :</label>
					     <input class="form-control" type="text" disabled value="${singleOrder.order.payment.addedOn}"/>
					   	<span style="color:red;"></span>
				    </div>
				  </div>

			  	<div class = "row">
				  	<div class = "col-md-6">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<textarea name = "description" disabled class="form-control">${singleOrder.order.description}</textarea>
				  		<span style="color:red;"></span>
				  	</div>
				  	<div class = "col-md-6">
				  	<label for="exampleInputEmail1">Payment Description :</label>
				  		<textarea name = "payDescription" disabled class="form-control">${singleOrder.order.payment.description}</textarea>
				  		<span style="color:red;"></span>
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	 <div class="row">
			  	 	<fieldset class="col-md-12"><legend>Ordered Meals</legend>
			  		  <table class="col-md-12" style="width:100%;">
			  		  		<thead>
							<tr style="border:1px solid black">
								<th style="background-color:powderblue; width: 20px;">Number</th>
								<th style="background-color:powderblue; width: 350px;">Meal</th>
								<th style="background-color:powderblue; width: 100px;">Quantity</th>
								<th style="background-color:powderblue;">Customized Message</th>
							</tr>
						</thead>

						<tbody id="addedMealTable">
							<c:if test="${singleOrder.order.foodOrder ne null}">
							  	<c:forEach items="${singleOrder.order.foodOrder}" var="orderMeal" varStatus="ord" >
							  	  <tr>
							  	  	  <td><c:out value="${ord.index + 1}"/></td>
							  	  	  <td><c:out value="${orderMeal.mealName}"/></td>
							  	  	  <td><c:out value="${orderMeal.quantity}"/></td>
							  	  	  <td><c:out value="${orderMeal.customizedFoodMsg}"/></td>
							  	  </tr>
							  	</c:forEach>
							</c:if>
					  	</tbody>
					 </table>
				   </fieldset>
				 </div>
				   
				 <br/>
				 <c:if test="${singleOrder.order.orderType eq 'PickUp' }">
				 	<div class="row">
					 	<fieldset class="col-md-12"><legend>PickUp</legend>
							<div class="form-group col-md-6">
								<label for="exampleInputEmail1" Class="difColor">Pick Up Time :</label>
								<input type="text" style="height: 35px;" disabled value="${singleOrder.pickUpTime }" /> 
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputEmail1" Class="difColor">Pick Up Date :</label> 
								<input type="text" style="height: 35px;" disabled value="${singleOrder.pickUpDate }" /> 
							</div>
						</fieldset>
					</div>
				 </c:if>
				
				  <c:if test="${singleOrder.order.orderType eq 'Delivery' }">
					 	<fieldset><legend>Delivery</legend>
							<div class="row">
								<div class="form-group col-md-3">
									<label for="exampleInputEmail1" Class="difColor">Deliver Time :</label> 
									<input type="text" style="height: 35px;" disabled value="${singleOrder.deliveryTime }" /> 
								</div>
								<div class="form-group col-md-3">
									<label for="exampleInputEmail1" Class="difColor">Deliver Date :</label> 
									<input type="text" style="height: 35px;" disabled value="${singleOrder.deliveryDate }" /> 
								</div>
								
							</div>

							<div class="row" style="padding-top: 15px;">
								<div class="form-group col-md-12">
									<label for="exampleInputEmail1">Customer fullName* :</label>
									<input value="${singleOrder.recieverCustName}" disabled class="form-control"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label for="exampleInputEmail1">House Number* :</label> 
									<input type="text" value="${singleOrder.houseNumber}" disabled class="form-control" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label for="exampleInputEmail1">Delivery Address* :</label> 
									<input type="text" disabled value="${singleOrder.deliveryAddress}" class="form-control"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label for="exampleInputEmail1">Ref-Mobile Number* :</label>
									<input disabled	type="text" value="${singleOrder.refMobile}" class="form-control" />
								</div>
							</div>
						</fieldset>
				 </c:if>
				  <div class="col-md-4" style="left: 30%;">
			    	 <button type="button" class="btn btn-lg btn-block btn-info" data-target="#myModalToUpdate" data-toggle="modal" data-backdrop="static" data-keyboard="false">
			        <i class="fa fa-floppy-o"></i> Update</button>
			 	 </div>
		 	 
				</div>			  	
			  	<br/>
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- bootstrap-modal-pop-up for Food tip & Customize food -->
<div class="modal video-modal fade" id="myModalToUpdate" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p  style="margin-left: 30%; font-size: 20px;"><c:out value="${singleOrder.order.orderCode}"/> - <c:out value="${singleOrder.order.customer.user.name}"/></p>
				<small style="margin-left: 40%;">Fill And Hit Proceed!</small>
			</div>
			 <form:form modelAttribute="singleUpdatedOrder" enctype="application/x-www-form-urlencoded" method="post" >
				<div class="modal-body">
					<div class="row">
						<div class="form-group col-md-6" style="margin-left: 25%;">
					    <label for="exampleInputEmail1" Class="difColor">Transaction Date :</label>
		 			      <form:input path = "payment.t_date" type = "date" cssClass="form-control dateField toBeReset"/> 
		 			       <span style="color:red;"><form:errors path="payment.t_date"/></span>
		 			    </div> 
					</div>
					<div class="row">
						<div class="col-md-3">
							<label>Total :</label> 
							<input class="form-control" disabled  value="${singleOrder.order.payment.total} LKR"/>
						</div>
						<div class="col-md-3">
							<label>Given :</label> 
							<input class="form-control" disabled value="${singleOrder.order.payment.given} LKR"/>
						</div>
						<div class="col-md-6">
							<label>Balance ( Payable ) :<small id="type"></small></label> 
							<input class="form-control" id="payable" disabled value=""/>
						</div>
					</div>
					<br/>
					
					<div class="row">
						<div class="form-group col-md-12" style="margin-left: 31%;">
							<label class="labelPay">Given  ( LKR ) </label>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<input class="totalgiven inputPay toBeReset" type = "number" value = "0" step="0.01" min="0" style=" border: 2px solid black;"/>
							<form:input path="payment.given" value = "0" hidden="true" id="given" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12"  style="margin-left: 31%;">
							<label class="labelPay">Balance ( LKR ) </label>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<input class="balance inputPay toBeReset" type = "text" style=" border: 2px solid black;"/>
						</div>
					</div>
					
					 <c:if test="${singleOrder.order.orderType eq 'Delivery' }">
					 	<div class="row">
							<div class="col-md-12">
								<label>Delivery Boy :</label> 
								<form:select path="handledEmployee" class="form-control toBeReset">
									<form:option value="default">Select..</form:option>
									<c:forEach items="${deliveryBoys}" var="deliveryBoy">
									<form:option value="${deliveryBoy}" label="${deliveryBoy.user.userName}" />
									</c:forEach>
						 		</form:select>
						 	</div>
					 	</div>
					 </c:if>
					
					
					<br/>
					<div class="row">
						<div class="col-md-3">
							<label>Order Status :</label> 
							<form:select path="orderStatus" class="form-control selectboxField toBeReset">
								<form:option value="default">Select..</form:option>
								<form:option value="Rejected">Rejected</form:option>
								<form:option value="Cancel">Cancel</form:option>
								<form:option value="Delivered">Delivered</form:option>
								<form:option value="Finished">Finished</form:option>
							</form:select>
						</div>
						<div class="col-md-9">
							<label>Payment Description :</label>
							<form:textarea path="payment.description" rows="3" class="form-control toBeReset"></form:textarea>
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger btn-block" onclick="resetFormodal()"	data-dismiss="modal" type="reset">
						<i class="fa fa-remove"></i> Cancel
					</button>
					<button class="btn btn-success btn-block" type="submit" style="display: block;">
						<i class="fa fa-shopping-cart "></i> Proceed Order
					</button>
				</div>
			</form:form>
		</div>
	</div>
</div>



<script type="text/javascript">
	var payable = 0;
	var orderType = "";
	orderType = "${singleOrder.order.orderType}";
	var orderId = "";
	orderId = "${singleOrder.order.id}";
	var total = 0;
	total = ${singleOrder.order.payment.total};
	var givenPast = 0;
	givenPast = ${singleOrder.order.payment.given};
	
	payable = (total - givenPast).toFixed(2);
	
	$(document).ready(function(){  		
		
		if (payable > 0){
			$("#type").html(" DUE ");
			$("#payable").val(payable + " LKR");
			$("#payable").css("background-color", "red");
			$("#payable").css("color", "white");
		}
		else if (payable == 0){
			$("#type").html(" SETTELED ");
			$("#payable").val(payable + " LKR");
			$("#payable").css("background-color", "green");
			$("#payable").css("color", "white");
		}
		
		$("#updBtnDiv").css("display", "none");
		$(".form-control, form-group ").css("disabled", "true");
		$(".editToShow").css("display", "block");
		
		$("#singleUpdatedOrder").validate();
		validator();
		resetFormField();
		 hideParam();
		 window.history.replaceState({}, document.title,  "/titanic/orders/order-detail-payment/"+orderId+"/"+orderType+".do");
	});
	
	// CALCULATE BALANCE
	$(".totalgiven").change(function(){
		var totalGiven = 0 ;
		totalGiven = $(".totalgiven").val();
		if(payable> 0){
			$(".balance").val((totalGiven - payable).toFixed(2));
		}
		if(totalGiven > payable ){
			 $("#given").val(payable);
		}
		else{
			 $("#given").val(totalGiven);
		}
		
	});	
	
	// RESET FORM MODAL
	function resetFormodal(){
		 $("#given").val(0);
		 resetFormField();
	}
</script>
