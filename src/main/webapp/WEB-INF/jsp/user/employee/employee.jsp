<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-employee" data-toggle="modal" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Employee</h3>
				<div class="" id="main-res-msg"	style="margin-top: 5px; display: none;">
					<strong></strong>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="employeeTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Branch</th>
							<th>Address</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${employee}" var="emp">
							<tr>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger"
									href='<spring:url value="/deleteEmployee/${emp.user.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> ${emp.user.id}</td>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>${emp.user.name}</a></td>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>${emp.user.mobile}</a></td>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>${emp.role.name}</a></td>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>${emp.branch.name}</a></td>
								<td><a class="btn" href='<spring:url value="/singleEmployee/${emp.user.id}.do" />'>${emp.user.address}</a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Branch</th>
							<th>Address</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- Employee Add modal -->
  <div class="modal fade" id="add-employee" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title">Add New Employee</h4>
<%--        		 	 <c:if test="${employee.message == 'SUCCESS'}"> --%>
<%--                  <div class="alert alert-success" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
                 
<%--                   <c:if test="${employee.message == 'FAILED'}"> --%>
<%--                  <div class="alert alert-warning" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
     	 </div>
        <div class="modal-body">
    		 <form:form modelAttribute="newEmployee" enctype="application/x-www-form-urlencoded" method="post" >
				  <div class="row">
				    <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Name :</label>
				    	 <form:input path="user.name" cssClass="form-control"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Role :</label>
				     	<form:select path="role.id" cssClass="form-control" >
				     	   <c:forEach items="${role}" var ="role">
				     	   		<form:option label="${role.name}" value="${role.id}"/>
				     	   </c:forEach>
						</form:select>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">User Name :</label>
				    	 <form:input path="user.userName" cssClass="form-control" disabled="true"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Mobile :</label>
				     	<form:input path="user.mobile" cssClass="form-control" type="number"/>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">NIC Number :</label>
				     <form:input path="nic" cssClass="form-control" />
				    </div>
				    
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Email :</label>
				     	<form:input path="user.email" cssClass="form-control" />
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Contact :</label>
				     <form:input path="contact" cssClass="form-control" type="number" />
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Date of Birth :</label>
	 			      <form:input path = "dob" type = "date" cssClass="form-control"/> 
	 			    </div> 
				  </div> 
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Address :</label>
				  		<form:textarea path = "user.address" cssClass="form-control" />
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	<div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Password :</label>
				       <form:password path="user.password" cssClass="form-control" />
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Confirm Password :</label>
<!-- 				     	<input class="form-control" id="empConfirmPassword" type="text" placeholder="Confirm Password"/> -->
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
				        <i class="fa fa-floppy-o"></i> Submit</button>
				  	  </div>
				 </div>
			</form:form>
        </div>
      </div>
    </div>
  </div>


  <script>
  	$(document).ready(function(){  		
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
  	});
  	</script>