<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<button value = "Edit Employee" class="btn btn-info" id="ediBtn" onclick="showEdit()"><i class="fa fa-pencil-square-o"></i> Edit Employee</button>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">${singleEmployee.user.name}- Employee</h3>
				<div class="" id="main-res-msg"	style="margin-top: 5px; display: none;">
					<strong></strong>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form:form modelAttribute="singleUpdatedEmployee" method="post">
				  <div class="row">
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Employee Name :</label>
				    	 <form:input path="user.name" class="form-control" id="empName" type="text" placeholder="Name" value="${singleEmployee.user.name}"/>
				    </div>
				  </div>
				  
			     <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">User Name :</label>
				    	 <form:input path="user.userName" class="form-control" id="empUserName" type="text" placeholder="Code" value="${singleEmployee.user.userName}" disabled="true"/>
				    </div>
				    
				     <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Mobile Number :</label>
				     	<form:input path="user.mobile" class="form-control" id="empMobile" type="number" placeholder="Mobile" value="${singleEmployee.user.mobile}"/>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">NIC Number :</label>
				     <form:input path="nic" class="form-control" id="empNic" type="text" placeholder="NIC" value="${singleEmployee.nic}"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Email :</label>
				     	<form:input path="user.email" class="form-control" id="empEmail" type="text" placeholder="Email" value="${singleEmployee.user.email}"/>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Contact Number :</label>
				     <form:input path="contact" cssClass="form-control" id="empContact" type="number" placeholder="Contact" value="${singleEmployee.contact}"/>
				    </div>
				    
				    <div class="form-group col-md-6">
				      <label for="exampleInputEmail1">Date Of Birth :</label>
	 			      <form:input path = "dob" type = "date" class="form-control"  placeholder="Date of birth" value="${singleEmployee.dob}"/> 
	 			    </div> 
				  </div> 
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Address :</label>
				  		<form:textarea path = "user.address" class="form-control" row = "3" name="Address" placeholder="address" value="${singleEmployee.user.address}"/>
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	<div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Password :</label>
				     <form:input path="user.password" class="form-control" id="empPassword" type="text" placeholder="Password" value = "${singleEmployee.user.password}"/>
				    </div>
				    
				    <div class="form-group col-md-6 cnfPassword">
				    <label for="exampleInputEmail1">Confirm Password :</label>
				     	<input class="form-control" id="empConfirmPassword" type="text" placeholder="Confirm Password"/>
				    </div>
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
			</form:form>
			</div>
			<!-- /.box-body -->
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
