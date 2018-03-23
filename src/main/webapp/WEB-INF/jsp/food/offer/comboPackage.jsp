<%@page import="com.titanic.entity.ItemCatergory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
				<table id="comboPackageTable" class="table table-bordered table-striped">
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
								<td><a class="btn" href='<spring:url value="/meals/comboPackage-detail/${comboPackage.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="/meals/deleteComboPackage/${comboPackage.id}.do" />'> <i
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
     	 <div class="alert alert-info" id="res-msg"><strong>Fill All Blanks And Hit Submit.</strong></div>
        <div class="modal-body">
    		 <form id="newComboPackage" enctype="application/x-www-form-urlencoded" method="post" >
    		 	<security:csrfInput />
				  <div class="row">
				    <div class="form-group col-md-12">
				   		 <label for="exampleInputEmail1">Combo-Package-Name :</label>
				    	 <input name="name" id="name" class="form-control textFiled"/>
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
								<th style="background-color:powderblue;">Number</th>
								<th style="background-color:powderblue;">Meal</th>
								<th style="background-color:powderblue;">Quantity</th>
								<th style="background-color:powderblue;"></th>
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
							<input name = "addedOn" id = "addedOn" type = "date" class="form-control"/> 
		 			       <span style="color:red;"></span>				    
	 			    </div>
				    
				     <div class="form-group col-md-6">
				       <label for="exampleInputEmail1">Valid-Until :</label>
						<input name = "validUntil" id = "validUntil" type = "date" class="form-control"/> 
	 			       <span style="color:red;"></span>	 			   
	 			      </div> 
				  </div>
				  
				  <div class="row">
				    <div class="form-group col-md-6">
				    <label for="exampleInputEmail1">Package-Price (LKR) :</label>
				     <input name = "price" id = "price" class="form-control" type="number" step="0.01"/>
				      <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-6">
				       <label for="exampleInputEmail1">Meal-Image :</label>
				    	<input name = "image" id = "image" type="file" class="form-control" name="image"/>
				    	 <span style="color:red;"></span>
	 			    </div> 
				  </div>
				  
			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<textarea name = "description" id = "description"  class="form-control"></textarea>
				  		 <span style="color:red;"></span>
				  	</div>
			  	</div>
			  	
			  	<br/>
			     <div class = "row">
				 	 <div class="form-group col-md-4">
			     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal">
			     	     Cancel</button>
				 	  </div>
				    	<div class="form-group col-md-4">
				     	 <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset">
			     	    Reset</button>
				 	</div>
				 	<div class="form-group col-md-4">
				     	 <input type="button" id="submitBtn" onclick="addDta()" class="btn btn-lg btn-block btn-success" value="Save"/>
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
		
		// SET AJAX WITH CSRF
		 var token =$("meta[name='_csrf']").attr("content");
	  		var header = $("meta[name='_csrf_header']").attr("content");
	  		$(document).ajaxSend(function(e, xhr, options) {
	  			xhr.setRequestHeader(header, token);
	  		});

		
    	 $('#comboPackageTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 
    	 // MODAL CONFIRMATION TO DELETE
    	 $("#confModalText").html("Are you want to delete this Package?");
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
	  			 $.each(data, function(key, meal) {   
	 	 			htmlOption += '<option value="'+ meal.id +'">' + meal.name + '</option>';
	 		  	 }); 
	  			$("#selectedMeal").append(htmlOption);
  		 });
  	 }
  	 
  	 
  	// MANAGE MEAL TO ARRAY AND DISPLAY TABLE
  	 function addMeal() {
  		// ADD MEAL
  		var mealobj = {};
  		mealobj.mealId = $("#selectedMeal option:selected").val();
  		mealobj.mealName = $("#selectedMeal option:selected").text();
  		mealobj.quantity = $("#quantity").val();
  		
  		mealArray.push(mealobj);
   		var key = mealArray.length;

			// DISPLAY TABLE APPENDING
			var htmlStr = '<tr>';
			htmlStr += "<td>"+key+"</td>";
			htmlStr += "<td>"+ mealobj.mealName  + "</td>";
			htmlStr += "<td>"+ mealobj.quantity + "</td>";
			htmlStr += '<td><a class="btn text-danger triggerRemove" data-id="'+ key +'"> <i class="fa fa-trash-o"></i> </a></td>';
			htmlStr += "</tr>";
			
			$("#addedMealTable").append(htmlStr);

	  		
	  		// REMOVE FROM ARRAY AND DISPLAY
	  	  	$(".triggerRemove").click(function deleteMeal(){
	  	  		var id = $(this).attr("data-id")-1;
	  	  		if(id > -1){
	  	  		mealArray.splice(id);
	  	  		document.getElementById("addedMealTable").deleteRow(id);
	  	  		}
	  	  	});
  	}
  	
  	// SUBMIT DATA
  	function addDta(){
  		var pckg = {};
  		pckg.name = $("#name").val();
  		pckg.addedOn = $("#addedOn").val();
  		pckg.price = $("#price").val();
  		pckg.validUntil = $("#validUntil").val();
  		pckg.description = $("#description").val();
  		pckg.mealArr = JSON.stringify(mealArray);
  		console.log(pckg.mealArr);
  		
		if (pckg.name.trim() == ""){
			$("#res-msg").removeClass("alert-success").removeClass("alert-info").addClass("alert-danger");
			$("#res-msg strong").html("Name can not be empty");
		}
		else if (pckg.mealArr == "" || pckg.mealArr == null){
			$("#res-msg").removeClass("alert-success").removeClass("alert-info").addClass("alert-danger");
			$("#res-msg strong").html("Atleast One Meal is needed!");
		}
		else{
			$("#res-msg").removeClass("alert-success").removeClass("alert-danger").addClass("alert-info");
			$("#res-msg strong").html("Fill All And Hit Save!");
			 $.ajax({
		  	    type: 'POST',
		  	    url: 'http://localhost:8080/titanic/meals/comboPackage.do',
		  	 	data: pckg,
		  	    success: function(data, textStatus ){
		  	    	 $(".form-control").val("");
		  			 $("#add-meal").modal("hide");
			  	    if(data == "success"){
			  	    	window.location.href = "http://localhost:8080/titanic/meals/comboPackage.do?success=true&msg=Successfully Added";
			  	    }
			  	    else{
			  	    	window.location.href = "http://localhost:8080/titanic/meals/comboPackage.do?success=false&msg=Failed";
			  	    }
		  	    },
		  	    error: function(xhr, textStatus, errorThrown){
		  	    	$("#res-msg").removeClass("alert-success").removeClass("alert-info").addClass("alert-danger");
		  			$("#res-msg strong").html(xhr);
		  	    	console.log(xhr);
		  	    }
		  	  });  	
		}
  	}
  
  	</script>