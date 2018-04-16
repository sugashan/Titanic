<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page  import="com.titanic.entity.MealsSchedule" %>
<%@ include file="../../../layouts/taglib.jsp" %>


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
	<button value = "Edit Employee" class="btn btn-info" id="ediBtn" onclick="showEdit()"><i class="fa fa-pencil-square-o"></i> Edit Combo Package</button>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title"><c:out value="${singleCombo.code}"/>- Combo Package</h3>
				<c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<form id="singleUpdatedMeal" method="post">
				 <div class="row">
				    <div class="form-group col-md-4">
				   		 <label for="exampleInputEmail1">Combo-Name :</label>
				    	 <input name="name" class="form-control" value="${singleCombo.name}"/>
				    	  <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    	<label for="exampleInputEmail1">Combo-Code :</label>
				    	 <input name="code" class="form-control" disabled value="${singleCombo.code}"/>
				    	  <span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    <label for="exampleInputEmail1">Added-On :</label>
				     <input name="addedOn" class="form-control" type = "date" value="${singleCombo.addedOn}"/>
				   	<span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    <label for="exampleInputEmail1">Valid-Until :</label>
				     <input name="validUntil" class="form-control" type = "date" value="${singleCombo.validUntil}"/>
				   	<span style="color:red;"></span>
				    </div>
				    
				     <div class="form-group col-md-2">
				    <label for="exampleInputEmail1">Package-Price :</label>
				     <input class="form-control" type="number" step="0.01" value="${singleCombo.price}"/>
				   	<span style="color:red;"></span>
				    </div>
				  </div>

			  	<div class = "row">
				  	<div class = "col-md-12">
				  	<label for="exampleInputEmail1">Description :</label>
				  		<textarea name = "description" class="form-control">${singleCombo.description}</textarea>
				  		<span style="color:red;"></span>
				  	</div>
			  	</div>
			  	
			  	<br/>
			  	 <div class="row">
			  	 <div  >
			  	 	<fieldset class="col-md-6"><legend>Included Meals</legend>
			  		  <table class="col-md-6" style="width:500px;">
			  		  		<thead>
							<tr style="border:1px solid black">
								<th style="background-color:powderblue;">Number</th>
								<th style="background-color:powderblue;">Meal</th>
								<th style="background-color:powderblue;">Quantity</th>
							</tr>
						</thead>

						<tbody id="addedMealTable">
					  	<c:forEach items="${singleCombo.packageMeal}" var="pckgMeal" varStatus="pckg" >
					  	  <tr>
					  	  	  <td><c:out value="${pckg.index + 1}"/></td>
					  	  	  <td><c:out value="${pckgMeal.mealName}"/></td>
					  	  	  <td><c:out value="${pckgMeal.quantity}"/></td>
					  	  </tr>
					  	</c:forEach>
					  	</tbody>
					 </table>
				   </fieldset>
				   </div>
				   
					  <div>
					  <fieldset class="form-group col-md-6"><legend>Combo Package Image</legend>
					  <label for="exampleInputEmail1">Combo Image :</label>
				    	<input name="image" type="file" class="form-control" name="image"/>
				    	<div class="col-md-6">
				    	<img src='<c:out value="${singleCombo.image}"/>' alt="Meal face" style="height:200px; width:450px;"/>
				    	<span style="color:red;"></span>
				    	</div>
				    	</fieldset>
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
			</form>
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
