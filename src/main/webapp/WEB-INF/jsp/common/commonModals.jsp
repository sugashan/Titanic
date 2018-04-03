<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="../../layouts/taglib.jsp" %>

<!-- Small Confirm logout modal -->
<div class="modal fade bd-example-modal-sm" id="confirmLogoutModal"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<p style="color:white; background-color:#f39c12;"> Are you sure want to logged out?</p>
			</div>
			<div class="modal-footer">
				<form name='f' action='<c:url value="/logout" />' method='POST'>
				   <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
               	   <button type="submit" class="btn btn-warning">Sign out</button>
               	   <security:csrfInput/>
               	</form>
			</div>
		</div>
	</div>
</div>

<!-- Small Confirm modal -->
<div class="modal fade bd-example-modal-sm" id="confirmModal"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
					<p id="confModalText" style="color:white;"> </p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<a type="button" class="btn btn-danger" id="confModalbtn" href="">Delete</a>
			</div>
		</div>
	</div>
</div>

<!-- bootstrap-modal-pop-up for Food tip & Customize food -->
<div class="modal video-modal fade" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">Luscious</div>
			<div class="modal-body">
				<!-- For Customize Order -->
				<div id="orderCustomDiv" style="display: block">
					<img src="<c:url value="/resources/dist/img/home/banner1.jpg" />"
						alt=" " class="img-responsive" id="selectedMealimage" />
					<p id="modalContentAtShow"
						style="text-align: center; font-size: 18px">Let's Customize
						Your Order!</p>
					<div class="row">
						<div class="col-md-3">
							<label>Quantity :</label> <input type="number"
								class="form-control" id="mealQuantity" autofocus="autofocus" />
						</div>
						<div class="col-md-9">
							<label>Customize Message :</label>
							<textarea rows="3" class="form-control" id="mealCustomizeInfo"
								placeholder="Please customize your food within 100 characters!"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger btn-block" onclick="reset()"
					data-dismiss="modal" type="reset">
					<i class="fa fa-remove"></i> Cancel
				</button>
				<button class="btn btn-success btn-block" onclick="addToCart()"
					type="button" id="addCartBtn" style="display: block;">
					<i class="fa fa-shopping-cart "></i> Add To Cart
				</button>
			</div>
		</div>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->


<!-- bootstrap-modal-pop-up for Order food -->
<div class="modal video-modal fade" id="myCartModal" tabindex="-1"
	role="dialog" aria-labelledby="myCartModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
			<div class="row orderCartInfo">
					
					<ul class="nav nav-pills nav-justified" id="pills-tab">
						 <li class="active"><a data-toggle="pill" href="#pills-Pick">Pick up</a></li>
						 <li><a data-toggle="pill" href="#pills-Delivery">Delivery</a></li>
					</ul>
					
					<p style="text-align: center; font-size: 18px">Please fill these
						to get your Order!</p>
						<hr/>
					<!-- PICK UP PILL -->
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade in active" id="pills-Pick">
							<br/>
							<form action="" class="col-md-12">
								<div class="row">
								     <div class="form-group col-md-12">
								     	<input type="checkbox" id="orderNow" class="form-control" data-toggle="toggle" data-style="ios" data-on="True" data-off="False"/>
								    	<label for="exampleInputEmail1">PickUp Now</label>
								      	<input type="checkbox" id="orderLater" class="form-control" data-toggle="toggle"  data-style="ios" data-on="True" data-off="False"/>
								     	<label for="exampleInputEmail1">PickUp Later</label>
								     </div>
					    		</div>
					    		<div class="row">
					    			 <div class="form-group col-md-6">
									      <label for="exampleInputEmail1" Class="difColor">Pick Up Time :</label>
						 			      <input type="text" id="timepickerforPickUp" name="Time" placeholder="Time" class=" timepickerforPickUp timepicker form-control hasWickedpicker" value="Time"  onkeypress="return false;" required="required" style=" height: 35px;">
					 			     </div> 
					 			     <div class="form-group col-md-6">
										  <label for="exampleInputEmail1" Class="difColor">Pick Up Date :</label>
							 			  <input id="datepickerforPickUp" name="Text" type="date" class="datepickerforPickUp form-control"  required="required">
					 			     </div> 
					    		</div>
					    		<div style="    background-color: aliceblue;">
					    			<hr/>
				    				<p><b>Note:</b> Time may differ with the outlet selected below.</p>
					    		</div>
					    		<div class="row" style="padding-top: 15px;">
								     <div class="form-group col-md-12">
								     	<label for="exampleInputEmail1">Branch Outlet :</label>
								     	<select id="branch" class="form-control" >
								     		<option value="1">Nelliyady</option>
								     	</select>
								     </div>
					    		</div>
							</form>
						</div>
						<!-- DELIVERY PILL -->
						<div class="tab-pane fade col-md-12" id="pills-Delivery">
							<br/>
							<div class="row">
								     <div class="form-group col-md-12">
								     	<input type="checkbox" id="deliverNow" class="form-control" data-toggle="toggle" data-style="ios" data-on="True" data-off="False"/>
								    	<label for="exampleInputEmail1">Deliver Now</label>
								      	<input type="checkbox" id="deliverLater" class="form-control" data-toggle="toggle"  data-style="ios" data-on="True" data-off="False"/>
								     	<label for="exampleInputEmail1">Deliver Later</label>
								     </div>
				    		</div>
				    		<div class="row">
				    			 <div class="form-group col-md-6">
								      <label for="exampleInputEmail1" Class="difColor">Deliver Time :</label>
					 			      <input type="text" id="timepickerforPickUp" name="Time" placeholder="Time" class="timepickerforPickUp form-control" required="required" style=" height: 35px;">
				 			     </div> 
				 			     <div class="form-group col-md-6">
									  <label for="exampleInputEmail1" Class="difColor">Deliver Date :</label>
						 			  <input id="datepickerforPickUp" name="Text" type="date" class="datepickerforPickUp form-control"  required="required">
				 			     </div> 
				    		</div>
				    		<div style="    background-color: aliceblue;">
				    			<hr/>
				    			<p>Note: Time may differ with the distance and traffic.</p>
					    	</div>
							<div class="row" style="padding-top: 15px;">
							     <div class="form-group col-md-12">
							     	 <label for="exampleInputEmail1">Customer fullName :</label>
				    				 <input name="name" id="name" class="form-control"/>
							     </div>
							</div>
							<div class="row">
							      <div class="form-group col-md-12">
							     	 <label for="exampleInputEmail1">Delivery Number :</label>
				    				 <input name="houseNumber" id="houseNumber" class="form-control"/>
							     </div>
							</div>
							<div class="row">
							      <div class="form-group col-md-12">
							     	 <label for="exampleInputEmail1">Delivery Address :</label>
				    				 <input name="deliveryAddress" id="houseNumber" class="form-control"/>
							     </div>
							</div>
							<div class="row">
							      <div class="form-group col-md-12">
							     	 <label for="exampleInputEmail1">Ref-Mobile Number :</label>
				    				 <input name="refMobile" id="refMobile" class="form-control"/>
							     </div>
							</div>
						</div>
					</div>
				</div>
				<div class="row orderPaymentInfo" style="display:none">
					<fieldset class=" col-md-12">
						<legend>
							Your Order : <span id="priceTag" style="float: right;"></span>
						</legend>
						<table class="col-md-12" style="width: 100%; text-allign:center;">
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
					<button class="btn btn-success btn-block" onclick="directPayment()"
						type="button" id="directpaymentBtn">
						<i class="fa fa-cutlery" aria-hidden="true"></i> Continue Order
					</button>
				</div>
				<div class="orderPaymentInfo" style="display:none;">
					<button class="btn btn-danger btn-block" onclick="resetCustom()"
						data-dismiss="modal" type="reset">
						<i class="fa fa-remove"></i> Cancel
					</button>
					<button class="btn btn-success btn-block" onclick="purchaseOrder()"
						type="submit" id="submtCartBtn">
						<i class="fa fa-cutlery" aria-hidden="true"></i> Order
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->

<!-- bootstrap-modal-pop-up for Profile modal -->
<div class="modal video-modal fade" id="myProfileModal" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<%=session.getAttribute("LoggerName")%>-${myProfile.user.userName }
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
<!-- 						<img class="profile-user-img img-responsive img-circle" -->
<!-- 							src="/resources/dist/img/home/gal6.jpg" -->
<!-- 							alt="User profile picture"> -->

						<h3 class="profile-username text-center">Nina Mcintire</h3>

						<p class="text-muted text-center">Software Engineer</p>

						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>Followers</b> <a
								class="pull-right">1,322</a></li>
							<li class="list-group-item"><b>Following</b> <a
								class="pull-right">543</a></li>
							<li class="list-group-item"><b>Friends</b> <a
								class="pull-right">13,287</a></li>
						</ul>

						<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->


