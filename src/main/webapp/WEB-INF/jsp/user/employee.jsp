<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-employee" data-toggle="modal" value = "Add New"/>
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
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${employee}" var="emp">
							<tr>
								<td><a class="btn" href='<spring:url value="/employee/${emp.user.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger"
									onclick="deleteUserModal(${emp.user.id})"> <i
										class="fa fa-trash-o"></i>
								</a> ${emp.user.userName}</td>
								<td onclick="singleView(${emp.user.id})">${emp.user.name}</td>
								<td onclick="singleView(${emp.user.id})">${emp.user.mobile}</td>
								<td onclick="singleView(${emp.user.id})">${emp.role.name}</td>
								<td onclick="singleView(${emp.user.id})">${emp.branch.name}</td>
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
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h4 class="modal-title">Add New Employee</h4>
<%--        		 	 <c:if test="${employee.message == 'SUCCESS'}"> --%>
<%--                  <div class="alert alert-success" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
                 
<%--                   <c:if test="${employee.message == 'FAILED'}"> --%>
<%--                  <div class="alert alert-warning" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
     	 </div>
        <div class="modal-body">
    		 <form:form modelAttribute="newEmployee" method="POST" enctype="multipart/form-data">
				  <div class="row">
				    <div class="form-group col-md-6">
				    	 <form:input path="user.name" class="form-control" id="empName" type="text" placeholder="Name"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				     	<form:input path="user.mobile" class="form-control" id="empMobile" type="number" placeholder="Mobile"/>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				     <form:input path="nic" class="form-control" id="empNic" type="text" placeholder="NIC"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				     	<form:input path="user.email" class="form-control" id="empEmail" type="text" placeholder="Email"/>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				     <form:input path="contact" cssClass="form-control" id="empContact" type="number" placeholder="Contact"/>
				    </div>
				    
				    <div class="form-group col-md-6">
	 			      <form:input path = "dob" type = "date" class="form-control"  placeholder="Date of birth"/> 
	 			    </div> 
				  </div> 
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  		<form:textarea path = "address" class="form-control" row = "3" name="Address" placeholder="address"/>
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	<div class="row">
				    <div class="form-group col-md-6">
				     <form:input path="user.password" class="form-control" id="empPassword" type="text" placeholder="Password"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				     	<input class="form-control" id="empConfirmPassword" type="text" placeholder="Confirm Password"/>
				    </div>
		 		 </div>
				  
			  	<br/>
			     <div class = "row">
		       		  <div class="form-group col-md-8">
				     	 <button type="submit" class="btn btn-lg btn-block btn-info">
				        <i class="fa fa-floppy-o"></i> Submit</button>
				  	  </div>
				    	<div class="form-group col-md-4">
				     	 <button type="button" class="btn btn-lg btn-block btn-secondary" onclick = "resetForm()">
			     	   <i class="fa fa-repeat"></i> Reset</button>
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