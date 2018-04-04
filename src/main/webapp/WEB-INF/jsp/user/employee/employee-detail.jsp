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
				<h3 class="box-title"><c:out value="${singleEmployee.user.userName}"/>- Employee</h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form:form modelAttribute="singleUpdatedEmployee" method="post">
				  <div class="row">
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Employee Name :</label>
				    	 <form:input path="user.name" class="form-control" id="empName" type="text" placeholder="Name" value="${singleEmployee.user.name}"/>
				   		 <span style="color:red;"><form:errors path="user.name"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				   		<label for="exampleInputEmail1">Role :</label>
				     	<form:select path="user.roleId" class="form-control" id="empRole" disabled="true" >
				     		<form:option label="${singleEmployee.user.role.name}" value="${singleEmployee.user.role.id}" cssClass="editToShow"/>
				     	   <c:forEach items="${role}" var ="role" begin="1">
				     	   		<form:option label="${role.name}" value="${role.id}"/>
				     	   </c:forEach>
						</form:select>
							 <span style="color:red;"><form:errors path="user.roleId"/></span>
				     </div>
				  </div>
				  
			     <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">User Name :</label>
				    	 <form:input path="user.userName" class="form-control" id="empUserName" type="text" placeholder="Code" value="${singleEmployee.user.userName}" disabled="true"/>
				    	 <span style="color:red;"><form:errors path="user.userName"/></span>
				    </div>
				    
				     <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Mobile Number :</label>
				     	<form:input path="user.mobile" class="form-control" id="empMobile" type="number" placeholder="Mobile" value="${singleEmployee.user.mobile}"/>
				    	 <span style="color:red;"><form:errors path="user.mobile"/></span>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">NIC Number :</label>
				     <form:input path="nic" class="form-control" id="empNic" type="text" placeholder="NIC" value="${singleEmployee.nic}"/>
				   	 <span style="color:red;"><form:errors path="nic"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Email :</label>
				     	<form:input path="user.email" class="form-control" id="empEmail" type="text" placeholder="Email" value="${singleEmployee.user.email}"/>
				     	<span style="color:red;"><form:errors path="user.email"/></span>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Contact Number :</label>
				     <form:input path="contact" cssClass="form-control" id="empContact" type="number" placeholder="Contact" value="${singleEmployee.contact}"/>
				   <span style="color:red;"><form:errors path="contact"/></span>
				    </div>
				    
				    <div class="form-group col-md-6">
				      <label for="exampleInputEmail1">Date Of Birth :</label>
	 			      <form:input path = "dob" type = "date" class="form-control"  placeholder="Date of birth" value="${singleEmployee.dob}"/> 
	 			   		<span style="color:red;"><form:errors path="dob"/></span>
	 			    </div> 
				  </div> 
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Address :</label>
				  		<form:input path = "user.address" class="form-control" row = "3" name="Address" placeholder="address" value="${singleEmployee.user.address}"/>
				  		<span style="color:red;"><form:errors path="user.address"/></span>
				  	</div>
			  	</div>
			  	
			  	<br/>
<!-- 			  	<div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    <label for="exampleInputEmail1">Password :</label> -->
<%-- 				     <form:input path="user.password" class="form-control" id="empPassword" type="text" placeholder="Password" value = "${singleEmployee.user.password}"/> --%>
<%-- 				    	<span style="color:red;"><form:errors path="user.password"/></span> --%>
<!-- 				    </div> -->
				    
<!-- 				    <div class="form-group col-md-6 cnfPassword"> -->
<!-- 				    <label for="exampleInputEmail1">Confirm Password :</label> -->
<!-- 				     	<input class="form-control" id="empConfirmPassword" type="text" placeholder="Confirm Password" data-rule-equalTo="#empPassword"/> -->
<!-- 				    </div> -->
<!-- 		 		 </div> -->
				  
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
