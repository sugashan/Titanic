<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="../../layouts/taglib.jsp"%>

<!-- Small Confirm logout modal -->
<div class="modal fade bd-example-modal-sm" id="confirmLogoutModal"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<p style="color: white; background-color: #f39c12;">Are you sure
					want to logged out?</p>
			</div>
			<div class="modal-footer">
				<form name='f' action='<c:url value="/logout" />' method='POST'>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-warning">Sign out</button>
					<security:csrfInput />
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
				<p id="confModalText" style="color: white;"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="cancelbtn" data-dismiss="modal">Cancel</button>
				<a type="button" class="btn btn-danger" id="confModalbtn" href="">Delete</a>
			</div>
		</div>
	</div>
</div>
