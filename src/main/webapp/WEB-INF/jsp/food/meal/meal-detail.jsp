<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page  import=com.titanic.entity.MealsSchedule %>
<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<button value = "Edit Employee" class="btn btn-info" id="ediBtn" onclick="showEdit()"><i class="fa fa-pencil-square-o"></i> Edit Employee</button>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">${singleMeal.code}- Meal</h3>
				<div class="" id="main-res-msg"	style="margin-top: 5px; display: none;">
					<strong></strong>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form:form modelAttribute="singleUpdatedMeal" method="post">
				 <div class="row">
				    <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Meal-Name :</label>
				    	 <form:input path="name" cssClass="form-control" value="${singleMeal.name}"/>
				    </div>
				    
				     <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Meal-Code :</label>
				    	 <form:input path="code" cssClass="form-control" disabled="true" value="${singleMeal.code}"/>
				    </div>
				  </div>
				  
				   <div class="row">
				     <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Meal-Type :</label>
				     	<form:select path="preferedTime" cssClass="form-control" >
				     		<option>${singleMeal.preferedTime}</option>
				     	  <%for (MealsSchedule ms : MealsSchedule.values()) {%>
								<form:option value="<%=ms.getName()%>"><%=ms.getName()%></form:option>
						  <% } %>
						</form:select>
				     </div>
				     
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Food-Type :</label>
				     	<form:select path="foodType" class="form-control" id="foodType">
				     			<form:option label="${singleMeal.foodType.name}" value="${singleMeal.foodType.id}"/>
				     	   <c:forEach items="${mealType}" var ="mealType">
				     	   		<form:option label="${mealType.name}" value="${mealType.id}"/>
				     	   </c:forEach>
						</form:select>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Unit-Price :</label>
				     <form:input path="price" cssClass="form-control" type="number" step="0.01" value="${singleMeal.price}"/>
				    </div>
				    
				     <div class="form-group col-md-6">
				    	<form:input path="image" type="file" cssClass="form-control" name="image"/>
				    	<img src="${singleMeal.image}" alt="Meal face" height="42" width="42">
	 			    </div> 
				  </div>
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<form:textarea path = "description" cssClass="form-control" value="${singleMeal.description}" />
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
