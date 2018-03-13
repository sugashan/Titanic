<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <!-- Small Confirm modal -->

<div class="modal fade bd-example-modal-sm" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
		 <div class="modal-body alert alert-warning">
		 	<p id="confModalText"> </p>
		 </div>
		  <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	        <a type="button" class="btn btn-danger" id="confModalbtn" href="">Delete</a>
	      </div>
    </div>
  </div>
</div>