<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page  import="com.titanic.entity.MealsSchedule" %>
<%@ include file="../../layouts/taglib.jsp" %>


<style type="text/css">

	table, th, td {
   border: 1px solid black;
   text-align:center;
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title"><c:out value="${singleOrder.order.orderCode}"/> -<b><c:out value="${singleOrder.order.orderType}"/></b> - <c:out value="${singleOrder.order.customer.user.userName}"/></h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                 <c:if test="${singleOrder.order.orderStatus ne 'Accepted' }">
				     <div class="alert alert-info" style = "margin-top:15px; padding:5px;">
					    <c:if test="${singleOrder.order.orderStatus eq 'Delivered' }">
						   <h4>Delivered-On :</h4>
						</c:if>
						<c:if test="${singleOrder.order.orderStatus eq 'Cancel' }">
						   <h4>Canceled-On :</h4>
						</c:if>
						<c:if test="${singleOrder.order.orderStatus eq 'Paid' }">
						   <h4>Paid-On :</h4>
						</c:if>
						<c:if test="${singleOrder.order.orderStatus eq 'Rejected' }">
						   <h4>Rejected-On :</h4>
						</c:if>  
						  
					     <small><c:out value = "${singleOrder.lastUpdatedTime}"/></small>
					   	 <span style="color:red;"></span>
				    </div>
			    </c:if>
			</div>
			
			<!-- /.box-header -->
			<form id="singleUpdatedMeal" method="post">
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
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<textarea name = "description" class="form-control">${singleOrder.order.description}</textarea>
				  		<span style="color:red;"></span>
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	 <div class="row">
			  	 	<fieldset class="col-md-12"><legend>Ordered Meals</legend>
			  		  <table class="col-md-12" style="width:100%;">
			  		  		<thead>
							<tr style="border:1px solid black">
								<th style="background-color:powderblue;">Number</th>
								<th style="background-color:powderblue;">Meal</th>
								<th style="background-color:powderblue;">Quantity</th>
								<th style="background-color:powderblue;">Customized Message</th>
							</tr>
						</thead>

						<tbody id="addedMealTable">
					  	<c:forEach items="${singleOrder.order.foodOrder}" var="orderMeal" varStatus="ord" >
					  	  <tr>
					  	  	  <td><c:out value="${ord.index + 1}"/></td>
					  	  	  <td><c:out value="${orderMeal.mealName}"/></td>
					  	  	  <td><c:out value="${orderMeal.quantity}"/></td>
					  	  	  <td><c:out value="${orderMeal.customizedFoodMsg}"/></td>
					  	  </tr>
					  	</c:forEach>
					  	</tbody>
					 </table>
				   </fieldset>
				 </div>
				   
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
								<div class="form-group col-md-6">
									<label for="exampleInputEmail1" Class="difColor">Deliver Time :</label> 
									<input type="text" style="height: 35px;" disabled value="${singleOrder.deliveryTime }" /> 
								</div>
								<div class="form-group col-md-6">
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
				</div>			  	
			  	
			  	<br/>
			     <div class = "row" id="updBtnDiv">
		       		  <div class="form-group col-md-8" >
				     	 <button type="submit" class="btn btn-lg btn-block btn-info" >
				        <i class="fa fa-floppy-o"></i> Update</button>
				  	  </div>
			    	  <div class="form-group col-md-4">
			     	    <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset">
			     	     <i class="fa fa-repeat"></i> Reset</button>
				 	  </div>
				 </div>
			</form>
		</div>
		<!-- /.box -->
	</section>
</div>


<script type="text/javascript">
	$(document).ready(function(){  		
		$("#updBtnDiv").css("display", "none");
		$(".form-control, form-group ").css("disabled", "true");
		$(".editToShow").css("display", "block");
	});
	
	function showEdit(){
		$("#updBtnDiv").css("display", "block");
		$(".form-control, form-group").css("disabled", "false");
		$(".editToShow").css("display", "none");
		$("#empRole").css("disabled", "false");
	}
	
</script>
