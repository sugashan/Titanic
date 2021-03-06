<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page  import="com.titanic.entity.MealsSchedule" %>
<%@ include file="../../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<button value = "Edit Employee" class="btn btn-info" id="ediBtn" onclick="showEdit()"><i class="fa fa-pencil-square-o"></i> Edit Meal</button>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title"><c:out value="${singleMeal.code}"/>- Meal</h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form:form modelAttribute="singleUpdatedMeal" method="post">
				 <div class="row">
				    <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Meal-Name :</label>
				    	 <form:input path="name" cssClass="form-control" value="${singleMeal.name}"/>
				    	  <span style="color:red;"><form:errors path="name"/></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    	<label for="exampleInputEmail1">Meal-Code :</label>
				    	 <form:input path="code" cssClass="form-control" disabled="true" value="${singleMeal.code}"/>
				    	  <span style="color:red;"><form:errors path="code"/></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    	<label for="exampleInputEmail1">Meal-Type :</label>
				     	<form:select path="preferedTime" cssClass="form-control" >
				     		<option>${singleMeal.preferedTime}</option>
				     	  <%for (MealsSchedule ms : MealsSchedule.values()) {%>
								<form:option value="<%=ms.getName()%>"><%=ms.getName()%></form:option>
						  <% } %>
						</form:select>
						 <span style="color:red;"><form:errors path="preferedTime"/></span>
				     </div>
				     
				    <div class="form-group col-md-2">
				    	<label for="exampleInputEmail1">Food-Type :</label>
				     	<form:select path="foodTypeId" class="form-control" id="foodType">
				     			<form:option label="${singleMeal.foodType.name}" value="${singleMeal.foodType.id}"/>
				     	   <c:forEach items="${mealType}" var ="mealType">
				     	   		<form:option label="${mealType.name}" value="${mealType.id}"/>
				     	   </c:forEach>
						</form:select>
							 <span style="color:red;"><form:errors path="foodTypeId"/></span>
				     </div>
				     
				  </div>
				  
				   <div class="row">
					   <div class = "col-md-6">
					  	<label for="exampleInputEmail1">Description :</label>
					  		<form:textarea path = "description" cssClass="form-control" />
					  		<span style="color:red;"><form:errors path="description"/></span>
					  	</div>
					  	 <div class = "col-md-6">
					  	<label for="exampleInputEmail1">Incrediant :</label>
					  		<form:textarea path = "incrediants" cssClass="form-control"></form:textarea>
					  		<span style="color:red;"><form:errors path="incrediants"/></span>
					  	</div>
				  	</div>
				  	
				  	 <div class="row">
				  	 <div class = "col-md-4">
					  	<label for="exampleInputEmail1">Meal-Cooking-Avg-Time (Min) :</label>
					  		<form:input path = "avgCookingTime" cssClass="form-control" value="${singleMeal.avgCookingTime}" />
					  		<span style="color:red;"><form:errors path="avgCookingTime"/></span>
					  	</div>
					  	<div class="form-group col-md-2">
				    <label for="exampleInputEmail1">Unit-Price :</label>
				     <form:input path="price" cssClass="form-control" type="number" step="0.01" value="${singleMeal.price}"/>
				   	<span style="color:red;"><form:errors path="price"/></span>
				    </div>
					  	
				     <div class="form-group col-md-6">
				     <label for="exampleInputEmail1">Meal Image :</label>
						<input name="image" id="image" type="file" class="form-control"/>
				    	<img src='<c:out value="${singleMeal.imageUrl}"/>' alt="Meal face" style="height:200px; width:450px;"/>
				    	<span style="color:red;"></span>
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
		hideParam();
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
