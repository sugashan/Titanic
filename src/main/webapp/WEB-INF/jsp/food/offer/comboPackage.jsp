<%@page import="com.titanic.entity.ItemCatergory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.titanic.entity.MealsSchedule"%>
<%@ include file="../../../layouts/taglib.jsp" %>
<%@ include file="../../common/commonModals.jsp" %>

<style type="text/css">

	table, th, td {
   border: 1px solid black;
   text-align:center;
}

</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-meal" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-success" value = "Add New"/>
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
							<th>Added-On</th>
							<th>Valid-Until</th>
							<th>Price</th>
							<th>Description</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${comboPackages}" var="comboPackage">
							<tr>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deletecomboPackage/${comboPackage.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a><c:out value="${comboPackage.id}"/></td>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'><c:out value="${comboPackage.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'><c:out value="${comboPackage.addedOn}"/></a></td>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'><c:out value="${comboPackage.validUntil}"/></a></td>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'><c:out value="${comboPackage.price}"/></a></td>
								<td><a class="btn" href='<spring:url value="comboPackage-detail/${comboPackage.id}.do" />'><c:out value="${comboPackage.description}"/></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Added-On</th>
							<th>Valid-Until</th>
							<th>Price</th>
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
        	<h4 class="modal-title">Add New Combo Package</h4>
     	 </div>
     	 <div class="alert alert-info">Fill All Blanks And Hit Submit.</div>
        <div class="modal-body">
    		 <form id="newComboPackage" enctype="application/x-www-form-urlencoded" method="post" >
    		 	
				  <div class="row">
				    <div class="form-group col-md-12">
				   		 <label for="exampleInputEmail1">Combo-Package-Name :</label>
				    	 <input name="name" class="form-control textFiled"/>
				    	  <span style="color:red;"></span>
				    </div>
				  </div>
					
			<!-- combo foods as Select Box -->
			<fieldset class="form-group col-md-12" style="border: 1px solid black"><legend>Meal :</legend>
				  <div class="row">				    
					<div class="form-group col-md-8">
						<label for="exampleInputEmail1">Meal :</label>
						<select name="meal" class="form-control mealSelect" id="selectedMeal">
					
						</select>
					</div>				
   						
					 <div class="form-group col-md-4">
					 <label for="exampleInputEmail1">Quantity :</label>
					 	<input type = "number" id="quantity"></input>
					 </div>
 				</div>
      						
				 <div class="row">				    
					<div  class="form-group col-md-12">
						<input type="button" class = "btn btn-success btn-md btn-block" onclick="addMeal()" value="Add Meal"/>
		   			  </div>
				  </div>
				  
			 <!-- combo foods as Table -->
			<fieldset class="form-group col-md-12"><legend>Selected-Meal :</legend>
				  <div class="row" >				    
				    <table class="form-group col-md-12">
				    	<thead>
							<tr style="border:1px solid black">
								<th>Number</th>
								<th>Meal</th>
								<th>Quantity</th>
								<th></th>
							</tr>
						</thead>

						<tbody id="addedMealTable">
						</tbody>
					
				    </table>
				  </div>
			 </fieldset>
		 </fieldset>	
				  
				   <hr size="300"/>
				  <div class="row"> 
				    <div class="form-group col-md-6">
					    <label for="exampleInputEmail1">Start-From :</label>
							<input name = "addedOn" type = "datetime-local" class="form-control"/> 
		 			       <span style="color:red;"></span>				    
	 			    </div>
				    
				     <div class="form-group col-md-6">
				       <label for="exampleInputEmail1">Valid-Until :</label>
						<input name = "validUntil" type = "datetime-local" class="form-control"/> 
	 			       <span style="color:red;"></span>	 			   
	 			      </div> 
				  </div>
				  
				  <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Unit-Price (LKR) :</label>
				     <input name = "price" class="form-control" type="number" step="0.01"/>
				      <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-6">
				       <label for="exampleInputEmail1">Meal-Image :</label>
				    	<input name = "image" type="file" class="form-control" name="image"/>
				    	 <span style="color:red;"></span>
	 			    </div> 
				  </div>
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<textarea name = "description" class="form-control"></textarea>
				  		 <span style="color:red;"></span>
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
			</form>
        </div>
      </div>
    </div>
  </div>


  <script>
  var mealArray = [];	
  
  	$(document).ready(function(){  		
		getMealListAndFillSelectBox();
		
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 
    	 // MODAL CONFIRMATION TO DELETE
    	 $("#confModalText").html("Are you want to delete this Meal?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		 $("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 });
    	 
  	});
  	
  	 //GET ALL MEAL AS LIST
  	 function getMealListAndFillSelectBox(){
  		var htmlOption = "";
  		 $.get('http://localhost:8080/titanic/meals/allMealsString.do', 
	         function(data){
	  			var data = JSON.parse(data);
	  			console.log(data.result);
	  			 $.each(data.result, function(key, meal) {   
	 	 			htmlOption += "<option value="+ key +">" + meal.name + "</option>";
	 		  	 }); 
	  			$("#selectedMeal").append(htmlOption);
  		 });
  	 }
  	 
  	 
  	// MANAGE MEAL TO ARRAY AND DISPLAY TABLE
  	 function addMeal() {
  		alert(mealArray.length);
  		// ADD MEAL
  		var mealobj = {};
  		mealobj.mealId = $("#selectedMeal").val();
  		mealobj.mealName = $("#selectedMeal").text();
  		console.log(mealobj.mealName);
  		mealobj.quantity = $("#quantity").val();
  		
  		mealArray.push(mealobj);
   		var key = mealArray.length;
   		alert(key + "key");
			// DISPLAY TABLE APPENDING
			var htmlStr = '<tr>';
			htmlStr += "<td>"+key+"</td>";
			htmlStr += "<td>"+ mealobj.mealName + "</td>";
			htmlStr += "<td>"+ mealobj.quantity + "</td>";
			htmlStr += '<td><a class="btn text-danger triggerRemove" data-id="'+ key +'"> <i class="fa fa-trash-o"></i> </a></td>';
			htmlStr += "</tr>";
			
			$("#addedMealTable").append(htmlStr);

	  		
	  		// REMOVE FROM ARRAY AND DISPLAY
	  	  	$(".triggerRemove").click(function deleteMeal(){
	  	  		var id = $(this).attr("data-id")-1;
	  	  		alert(id);
	  	  		console.log(mealArray);
	  	  		mealArray.splice(id, 1);
	  	  		console.log(mealArray);
	  	  		document.getElementById("addedMealTable").deleteRow(id);
	  	  	});
  	}
  	
  
  	</script>