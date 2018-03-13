<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../../layouts/taglib.jsp" %>
<%@ include file="../../common/commonModals.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-foodType" data-toggle="modal" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Food-Type</h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
				<div class="" id="main-res-msg"	style="margin-top: 5px; display: none;">
					<strong></strong>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="foodTypeTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${foodType}" var="fte">
							<tr>
								<td><a class="btn" href='<spring:url value="singlefoodType/${fte.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteFoodType/${fte.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> ${fte.id}</td>
								<td><a class="btn" href='<spring:url value="singlefoodType/${fte.id}.do" />'>${fte.name}</a></td>
								<td><a class="btn" href='<spring:url value="singlefoodType/${fte.id}.do" />'>${fte.description}</a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- Food Type Add modal -->
  <div class="modal fade" id="add-foodType" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title">Add New Food Type</h4>
<%--        		 	 <c:if test="${employee.message == 'SUCCESS'}"> --%>
<%--                  <div class="alert alert-success" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
                 
<%--                   <c:if test="${employee.message == 'FAILED'}"> --%>
<%--                  <div class="alert alert-warning" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
     	 </div>
        <div class="modal-body">
    		 <form:form modelAttribute="newFoodType" enctype="application/x-www-form-urlencoded" method="post" >
				  <div class="row">
				    <div class="form-group col-md-12">
				   		 <label for="exampleInputEmail1">Name :</label>
				    	 <form:input path="name" cssClass="form-control"/>
				    </div>
				    
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    	<label for="exampleInputEmail1">Role :</label> -->
<%-- 				     	<form:select path="role.id" cssClass="form-control" > --%>
<%-- 				     	   <c:forEach items="${role}" var ="role"> --%>
<%-- 				     	   		<form:option label="${role.name}" value="${role.id}"/> --%>
<%-- 				     	   </c:forEach> --%>
<%-- 						</form:select> --%>
<!-- 				     </div> -->
				  </div>
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<form:textarea path = "description" cssClass="form-control" />
				  	</div>
			  	</div>
			  	
			  	<br/>
			     <div class = "row">
				 	 <div class="form-group col-md-4">
			     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal">
			     	     <i class="fa fa-close"></i> Cancel</button>
				 	  </div>
				    	<div class="form-group col-md-4">
				     	 <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset">
			     	   <i class="fa fa-repeat"></i> Reset</button>
				 	</div>
				 	<div class="form-group col-md-4">
				     	 <button type="submit" class="btn btn-lg btn-block btn-success">
				        <i class="fa fa-floppy-o"></i> Save</button>
				  	  </div>
				 </div>
			</form:form>
        </div>
      </div>
    </div>
  </div>


  <script>
  	$(document).ready(function(){  		
    	 $('#foodTypeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 $("#confModalText").html("Are you want to delete this Food Type?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		 $("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 });
  	});
  	</script>