<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="../../layouts/taglib.jsp"%>

<!-- bootstrap-modal-pop-up for Food tip & Customize food -->
<div class="modal video-modal fade" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"><p>Luscious</p>
				<button type="button" class="close" data-dismiss="modal" onclick="dataChanager()"
					aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<!-- For Customize Order -->
				<div id="orderCustomDiv" style="display: block">
					<a id="selectedMealimagelinkn"><img src="<c:url value="/resources/dist/img/home/banner1.jpg" />"
						alt=" " class="img-responsive" id="selectedMealimage" /></a>
					<p id="modalContentAtShow"
						style="text-align: center; font-size: 18px">Let's Customize
						Your Order!</p>
					<div class="row customFiled">
						<div class="col-md-3">
							<label>Quantity :</label> <input type="number"
								class="form-control tobereset" id="mealQuantity" autofocus="autofocus" />
						</div>
						<div class="col-md-9">
							<label>Customize Message :</label>
							<textarea rows="3" class="form-control tobereset" id="mealCustomizeInfo"
								placeholder="Please customize your food within 100 characters!"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="customFiled">
					<button class="btn btn-danger btn-block"
						data-dismiss="modal" type="reset">
						<i class="fa fa-remove"></i> Cancel
					</button>
					<button class="btn btn-success btn-block" onclick="addToCart()"
						type="button" id="addCartBtn" style="display: block;">
						<i class="fa fa-shopping-cart "></i> Add To Cart
					</button>
				</div>
				<div class="customFiledforoffer">
					<button class="btn btn-success btn-block" onclick="addOfferToCart()"
						type="button" id="offerCartBtn" style="display: block;">
						<i class="fa fa-shopping-cart "></i>  Grap It
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->


<!-- bootstrap-modal-pop-up for Order food -->
<div class="modal video-modal fade" id="myCartModal" tabindex="-1"
	role="dialog" aria-labelledby="myCartModal">
	<div class="modal-dialog" role="document">
			<form:form modelAttribute="newFoodOrder" action="/titanic/newOrder.do" enctype="application/x-www-form-urlencoded" method="post" class="col-md-12 modal-content">
				<div class="modal-body">
					<div class="row orderDeliveryInfo">
	
						<ul class="nav nav-pills nav-justified" id="pills-tab-order">
							<li class="active" data-order-type="PickUp"><a data-toggle="pill" href="#pills-Pick" >Pick
									up</a></li>
							<li data-order-type="Delivery"><a data-toggle="pill" href="#pills-Delivery" >Delivery</a></li>
						</ul>
						
							<p id="alertMsg" style="text-align: center; font-size: 16px">Please fill
								these to get your Order!</p>
						<hr>
						
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
											 <input type="text" id="Time1"
 														placeholder="Time"  
 														class="pickUp timepickerforPickUp form-control tobereset timepicker"
  														value="Time" onkeypress="return false;"
  														style="height: 35px;" /> 
										</div>
										<div class="form-group col-md-6">
											<label for="exampleInputEmail1" Class="difColor">Pick Up Date :</label> 
											<input id="datepicker"
  													type="text" class=" tobereset dateField pickUp datepickerforPickUp form-control"  />  
										</div>
									</div>
									<div style="background-color: aliceblue;">
										<hr>
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
  												placeholder="Time" class="delivery tobereset timepicker timepickerfordelivery form-control" 
 	 										    style="height: 35px;"/>  
									</div>
									<div class="form-group col-md-6">
										<label for="exampleInputEmail1" Class="difColor">Deliver Date :</label> 
										<input type="text" id="datepicker2"
 	 											class="delivery dateField  tobereset datepickerfordelivery form-control" /> 
									</div>
								</div>
								<div style="background-color: aliceblue;">
									<hr>
									<p>Note: Time may differ with the distance and traffic.</p>
								</div>
								<div class="row" style="padding-top: 15px;">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Customer fullName* :</label>
											<input type="text" id="recieverCustName" class="textFiled delivery form-control custName" value="${myProfile.user.name}"/>
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
											<input type="text" id="deliveryAddress" class="textFiled delivery form-control custAddress" value="${myProfile.user.address}" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<label for="exampleInputEmail1">Ref-Mobile Number* :</label>
											<input type="text"	id="refMobile" class="numberFiled delivery form-control custMobile"  value="${myProfile.user.mobile}"/>
										</div>
									</div>
							</div>
						</div>
						<form:input path="orderType" hidden="hidden"/>
						<form:input path="tempStringForDeliveryOpt" hidden="hidden"/>
					</div>
					<div class="row orderPaymentInfo" style="display: none">
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
					<div class="orderDeliveryInfo">
						<button class="btn btn-success btn-block" onclick="directPayment()"
							type="button" id="directpaymentBtn">
							<i class="fa fa-cutlery" aria-hidden="true"></i> Continue Order
						</button>
					</div>
					<div class="orderPaymentInfo" style="display: none;">
						<button class="btn btn-danger btn-block" onclick="resetCustom()"
							data-dismiss="modal" type="reset">
							<i class="fa fa-remove"></i> Cancel
						</button>
						<button class="btn btn-success btn-block" type="submit" id="submtCartBtn">
							<i class="fa fa-cutlery" aria-hidden="true"></i>Proceed Order
						</button>
					</div>
				</div>
			</form:form>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->

<!-- bootstrap-modal-pop-up for Profile modal -->
<div class="modal video-modal fade" id="myProfileModal" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<%=session.getAttribute("LoggerName")%> - My Profile
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body">
				<ul class="nav nav-pills nav-justified" id="pills-tab-profile">
					<li class="active"><a data-toggle="pill" href="#pills-Account">My
							Account</a></li>
					<li><a data-toggle="pill" href="#pills-Msg">Notifications</a></li>
					<li><a data-toggle="pill" href="#pills-Orders">Past Orders</a></li>
					<li><a data-toggle="pill" href="#pills-FAQ">FAQ</a></li>
				</ul>
				
				<div style="background-color: whitesmoke;">
					<hr style="margin-bottom: -15px;"/>
					<p style="text-align: center; font-size: 18px; padding-bottom:0px;"><c:out value="${myProfile.user.userName}"/><br><c:out value="${myProfile.user.email}"/></p>
					<hr />
				</div>

				<div class="tab-content" id="pills-tabContent">
					<!-- MY ACCOUNT -->
					<div class="tab-pane fade in active" id="pills-Account">
						<form:form modelAttribute="currentCustomer" action="/titanic/users/customer-detail/${myProfile.id}.do" enctype="application/x-www-form-urlencoded" method="post" class="row" >
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-fn">Email: </label> 
									<form:input path="user.email" class="form-control  emailFiled" value="${myProfile.user.email}"/> 
									<form:errors path="user.email"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-ln">User Name: </label> 
									<form:input type="text" path="user.userName" class="form-control textFiled" value="${myProfile.user.userName}"/> 
									<form:errors path="user.userName"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-email">Mobile: </label> 
									<form:input type="text" path="user.mobile" class="form-control numberFiled" value="${myProfile.user.mobile}" /> 
									<form:errors path="user.mobile"/><br/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-phone">Address</label>
									<form:input type="text" path="user.address" class="form-control" value="${myProfile.user.address}"/>
									<form:errors path="user.address"/><br/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-pass">New Password</label>
									<form:input type="password" path="user.password" placeholder="New Password" class="passwordFiled form-control"/> 
									<form:errors path="user.password"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="account-confirm-pass">Confirm Password</label> 
									<input type="password" id="conFPassword" placeholder="Confirm Password" class="passwordFiled form-control"/><br/>
									<span id="confirmPasswordError" style="color:red;"></span>
								</div>
							</div>
							<div class="col-12">
								<hr class="mt-2 mb-3">
								<div class="d-flex flex-wrap justify-content-between align-items-center">
									<button class="btn btn-success margin-right-none" type="submit"
										data-toast-type="success" data-toast-icon="icon-circle-check"
										data-toast-title="Success!"
										data-toast-message="Your profile updated successfuly." style="margin-left: 40%;">Update
										Profile</button>
								</div>
							</div>
						</form:form>
					</div>
					
					<!-- NOTIFICATION -->
					<div class="tab-pane fade " id="pills-Msg">
						<c:if test="${msgs eq null}">
							<div class="row" style="margin: -5px;">
								<div class="col-md-12" style="margin: -15px;">
									<p style="color:white;">You don't have any new message!</p>
								</div>
							</div>
						</c:if>
						<c:if test="${msgs ne null}">
							<c:forEach items="${msgs}" var="msg" varStatus="index">
								<div class="row ">
									<div class="col-md-12" style="background-color:  #ffa41f;">
										<p style="color:white;"><b>${index.index +1} --</b> <c:out value=" ${msg.message}" />! :
											<small style="color:black;"> <c:out value=" ${msg.createdDate}" /></small><br/>
												           ${msg.description}</p>
									</div>
								</div>
								<br/>
							</c:forEach>
						</c:if>
					</div>
					
					
					<!-- PAST ORDERS -->
					<div class="tab-pane fade " id="pills-Orders">
						<div class="row">
							<table id="orderTable" class="col-md-12 table table-bordered table-striped" style="width:100%; text-allign:center;">
								<thead>
									<tr>
										<th style="background-color: black; color: white;">No</th>
										<th style="background-color: black; color: white;">Order</th>
										<th style="background-color: black; color: white;">Code</th>
										<th style="background-color: black; color: white;">Ordered-On</th>
										<th style="background-color: black; color: white;">Branch</th>
										<th style="background-color: black; color: white;">Status</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${myOrders}" var="order" varStatus="status">
											<tr>
												<td>${status.index}</td>
												<td><c:out value="${order.foodOrderString}"/></td>
												<td><c:out value="${order.orderCode}"/></td>
												<td><c:out value="${order.orderedOn}"/></td>
												<td><c:out value="${order.outletBranch}"/></td>
												<td><c:out value="${order.orderStatus}"/></td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>	
					</div>
					
					<!-- FAQ -->
					<div class="tab-pane fade" id="pills-FAQ">
						<form:form modelAttribute="newInquiry" action="/titanic/inquiry/addInquiry.do" enctype="application/x-www-form-urlencoded" method="post" class="row" style="margin-top:-25px;">
								<p><b>Fill and Hit.</b></p>
								<div class="col-md-12">
									<label>Subject* :</label>
									<form:input type="text" path="inqSubject" placeholder="Subject" class="textFiled form-control"/>
									<form:errors path="inqSubject"/>
								</div>
								<br/>
								<div class="col-md-12">
									<label>Message* :</label>
									<form:textarea path="inqMessage" class="textFiled form-control" placeholder="Message..."/>
									<form:errors path="inqMessage"/>
								</div>
								<br/>
								<div>
									<button class="btn btn-success margin-right-none" type="submit"
										data-toast-message="Your Request sent successfuly." style="margin-left: 40%; margin-top: 10px;">Send Request</button>
								</div>
						</form:form>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //bootstrap-modal-pop-up -->


