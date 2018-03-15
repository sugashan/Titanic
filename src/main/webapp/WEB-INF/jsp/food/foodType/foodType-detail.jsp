<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<button value = "Edit Food Type" class="btn btn-info" id="ediBtn" onclick="showEdit()"><i class="fa fa-pencil-square-o"></i> Edit Employee</button>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">${singleFoodType.name}- Meal</h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form:form modelAttribute="singleUpdatednewFoodType" method="post">
				  <div class="row">
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Type Name :</label>
				    	 <form:input path="name" class="form-control" id="empName" type="text" placeholder="Name" value="${singleFoodType.name}"/>
				    	  <span style="color:red;"><form:errors path="name"/></span>
				    </div>
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">PreFix :</label>
				    	 <form:input path="preFix" class="form-control" id="empName" type="text" placeholder="Name" value="${singleFoodType.preFix}"/>
				    	  <span style="color:red;"><form:errors path="name"/></span>
				    </div>
				  </div>
				    
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<form:textarea path = "description" class="form-control" row = "3" name="Address" placeholder="address" value="${singleFoodType.description}"/>
				  		 <span style="color:red;"><form:errors path="description"/></span>
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
