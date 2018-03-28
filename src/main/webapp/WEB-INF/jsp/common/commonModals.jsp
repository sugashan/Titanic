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

<!-- bootstrap-modal-pop-up for Food tip -->
<div class="modal video-modal fade" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				Luscious
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<img src="<c:url value="/resources/dist/img/home/banner1.jpg" />"
					alt=" " class="img-responsive" />
				<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam
					corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
					consequatur? Quis autem vel eum iure reprehenderit qui in ea
					voluptate velit esse quam nihil molestiae consequatur, vel illum
					qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
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
