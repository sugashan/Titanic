<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.titanic.entity.MealsSchedule"%>
<%@ include file="../../../layouts/taglib.jsp" %>
<%@ include file="../../common/commonModals.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-meal" data-toggle="modal" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Meal</h3>
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
				<table id="employeeTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Type</th>
							<th>Prefer Time</th>
							<th>Image</th>
							<th>Description</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${meal}" var="meal">
							<tr>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteMeal/${meal.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> ${meal.code}</td>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>${meal.name}</a></td>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>${meal.foodType}</a></td>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>${meal.preferedTime}</a></td>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>${meal.image}</a></td>
								<td><a class="btn" href='<spring:url value="singleMeal/${meal.id}.do" />'>${meal.description}</a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Type</th>
							<th>Prefer Time</th>
							<th>Image</th>
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

<!-- Meal Add modal -->
  <div class="modal fade" id="add-meal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title">Add New Meal</h4>
<%--        		 	 <c:if test="${employee.message == 'SUCCESS'}"> --%>
<%--                  <div class="alert alert-success" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
                 
<%--                   <c:if test="${employee.message == 'FAILED'}"> --%>
<%--                  <div class="alert alert-warning" style = "margin-top:15px;">${employee.description}</div> --%>
<%--                  </c:if> --%>
     	 </div>
        <div class="modal-body">
    		 <form:form modelAttribute="newMeal" enctype="application/x-www-form-urlencoded" method="post" >
				  <div class="row">
				    <div class="form-group col-md-6">
				   		 <label for="exampleInputEmail1">Meal-Name :</label>
				    	 <form:input path="name" cssClass="form-control"/>
				    </div>
				    
				     <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Meal-Code :</label>
				    	 <form:input path="code" cssClass="form-control" disabled="true"/>
				    </div>
				  </div>
				  
				   <div class="row">
				     <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Meal-Type :</label>
				     	<form:select path="preferedTime" cssClass="form-control" >
				     	  <%for (MealsSchedule ms : MealsSchedule.values()) {%>
								<option value="<%=ms.getName()%>"><%=ms.getName()%></option>
						  <%}%>
						</form:select>
				     </div>
				     
				    <div class="form-group col-md-6">
				    	<label for="exampleInputEmail1">Food-Type :</label>
				     	<form:select path="foodType" class="form-control" id="foodType">
				     	   <c:forEach items="${mealType}" var ="mealType">
				     	   		<form:option label="${mealType.name}" value="${mealType.id}"/>
				     	   </c:forEach>
						</form:select>
				     </div>
				  </div>
				  
				   <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Unit-Price :</label>
				     <form:input path="price" cssClass="form-control" type="number" step="0.01"/>
				    </div>
				    
				     <div class="form-group col-md-6">
				    	<form:input path="image" type="file" cssClass="form-control" name="image"/>
	 			    </div> 
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
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 $("#confModalText").html("Are you want to delete this Meal?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		 $("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 });
  	});
  	</script>