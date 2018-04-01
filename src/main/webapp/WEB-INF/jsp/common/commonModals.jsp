<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!-- Small Confirm modal -->
<div class="modal fade bd-example-modal-sm" id="confirmModal"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body alert alert-warning">
				<p id="confModalText"></p>
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
			<div class="modal-header">
				Luscious
			</div>
			<div class="modal-body">
				<!-- For Customize Order -->
				<div id="orderCustomDiv" style="display:block">
					<img src="<c:url value="/resources/dist/img/home/banner1.jpg" />" alt=" " class="img-responsive" id="selectedMealimage"/>
					<p id = "modalContentAtShow" style="text-align: center; font-size: 18px">Let's Customize Your Order!</p>
					<div class="row">
						<div class="col-md-3">
							<label>Quantity :</label>
							<input type="number" class="form-control" id="mealQuantity" autofocus="autofocus"/>
						</div>
						<div class="col-md-9">
							<label>Customize Message :</label>
							<textarea rows="3" class="form-control" id="mealCustomizeInfo" placeholder="Please customize your food within 100 characters!"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
					<button class="btn btn-danger btn-block" onclick="reset()" data-dismiss="modal" type="reset"><i class="fa fa-remove"></i>  Cancel</button>
					<button class="btn btn-success btn-block" onclick="addToCart()" type="button" id="addCartBtn" style="display:block;"><i class="fa fa-shopping-cart "></i>  Add To Cart</button>
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
			<div class="modal-header">
				Luscious
			</div>
			<div class="modal-body row">
				<fieldset class=" col-md-12"><legend>Your Order :</legend>
					    <table class="col-md-12">
					    	<thead>
								<tr style="border:1px solid black">
									<th style="background-color:#ffa41f; color:white;">Number</th>
									<th style="background-color:#ffa41f; color:white;">Meal</th>
									<th style="background-color:#ffa41f; color:white;">Quantity</th>
									<th style="background-color:#ffa41f; color:white;">CustomizedInfo</th>
									<th style="background-color:#ffa41f; color:white;"></th>
								</tr>
							</thead>
	
							<tbody id="addedOrderTableBody">
							
							</tbody>
						
					    </table>
				 </fieldset>
				 <p style="text-align: center; font-size: 18px">Please fill these to get your Order!</p>
				 
				 
				 
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger btn-block" onclick="resetCustom()" data-dismiss="modal" type="reset"><i class="fa fa-remove"></i>  Cancel</button>
				<button class="btn btn-success btn-block" onclick="purchaseOrder()" type="submit" id="submtCartBtn"><i class="fa fa-cutlery" aria-hidden="true"></i>  Order</button>
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
				<%= session.getAttribute("LoggerName") %>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="/resources/dist/img/home/gal6.jpg" alt="User profile picture">

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
