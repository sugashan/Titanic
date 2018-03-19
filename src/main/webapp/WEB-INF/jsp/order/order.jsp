<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../../layouts/taglib.jsp" %>
<%@ include file="../common/commonModals.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<input type = "button" data-target="#add-order" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-success" value = "Add New"/>
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Employee</h3>
       		 	 <c:if test="${param.success eq true}">
                 <div class="alert alert-success alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
                 
                  <c:if test="${param.success eq false}">
                 <div class="alert alert-warning alertMsg" style = "margin-top:15px; padding:5px;">${param.msg}</div>
                 </c:if>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table id="employeeTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Customer</th>
							<th>Ordered-On</th>
							<th>Delivery-Type</th>
							<th>Branch</th>
							<th>Status</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'>
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteOrder/${order.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a> <c:out value="${order.orderCode}"/></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.customer.user.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderedOn}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.deliveryType}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.branch.name}"/></a></td>
								<td><a class="btn" href='<spring:url value="order-detail/${order.id}.do" />'><c:out value="${order.orderStatus}"/></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Customer</th>
							<th>Ordered-On</th>
							<th>Delivery-Type</th>
							<th>Branch</th>
							<th>Status</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>

<!-- New Order modal -->
<!--   <div class="modal fade" id="add-order" role="dialog"> -->
<!--     <div class="modal-dialog"> -->
<!--       Modal content -->
<!--       <div class="modal-content"> -->
<!--       	<div class="modal-header"> -->
<!--         	<h4 class="modal-title" style="text-align: center;"><b>Add New Order</b></h4> -->
<!--      	 </div> -->
<!--      	 <div class="alert alert-info">Fill All Blanks And Hit Submit.</div> -->
<!--         <div class="modal-body"> -->
<%--     		 <form:form modelAttribute="newOrder" enctype="application/x-www-form-urlencoded" method="post"  > --%>
<!-- 				  <div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				   		 <label for="exampleInputEmail1" Class="difColor">Customer Name :</label> -->
<%-- 				    	 <form:input path="customer.user.name" cssClass="form-control textFiled"/> --%>
<%-- 				    	  <span style="color:red;"><form:errors path="customer.user.name" type="text"/></span> --%>
<!-- 				    </div> -->
<!-- 				     <div class="form-group col-md-6"> -->
<!-- 				   		 <label for="exampleInputEmail1" Class="difColor">Customer Mobile :</label> -->
<%-- 				    	 <form:input path="customer.user.mobile" cssClass="form-control textFiled"/> --%>
<%-- 				    	  <span style="color:red;"><form:errors path="customer.user.mobile" type="number"/></span> --%>
<!-- 				    </div> -->
<!-- 				  </div>   -->
				    
<!-- 				    <div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				   		 <label for="exampleInputEmail1" Class="difColor">Customer Name :</label> -->
<%-- 				    	 <form:input path="user.name" cssClass="form-control textFiled"/> --%>
<%-- 				    	  <span style="color:red;"><form:errors path="customer.user.name" type="text"/></span> --%>
<!-- 				    </div> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    	<label for="exampleInputEmail1" Class="difColor">Role :</label> -->
<%-- 				     	<form:select path="user.roleId" cssClass="form-control" > --%>
<%-- 				     	   <c:forEach items="${roles}" var ="role"> --%>
<%-- 				     	   		<form:option label="${role.name}" value="${role.id}"/> --%>
<%-- 				     	   </c:forEach> --%>
<%-- 						</form:select> --%>
<%-- 						 <span style="color:red;" id="selectBox"><form:errors path="user.roleId"/></span> --%>
<!-- 				     </div> -->
<!-- 				  </div> -->
				  
<!-- 				   <div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    	<label for="exampleInputEmail1" Class="difColor">User Name :</label> -->
<%-- 				    	 <form:input path="user.userName" cssClass="form-control uniqueTextFiled" type="text" /> --%>
<%-- 				    	 <span style="color:red;"><form:errors path="user.userName"/></span> --%>
<!-- 				    	 <span id="dublicateUserNameError" style="color:red;"></span> -->
<!-- 				    </div> -->
				    
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    	<label for="exampleInputEmail1" Class="difColor">Mobile :</label> -->
<%-- 				     	<form:input path="user.mobile" cssClass="form-control numberFiled" type="number"/> --%>
<%-- 				     	<span style="color:red;"><form:errors path="user.mobile"/></span> --%>
<!-- 				     </div> -->
<!-- 				  </div> -->
				  
<!-- 				   <div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    <label for="exampleInputEmail1" Class="difColor">NIC Number :</label> -->
<%-- 				     <form:input path="nic" cssClass="form-control numberFiled" type="text" /> --%>
<%-- 				      <span style="color:red;"><form:errors path="nic"/></span> --%>
<!-- 				    </div> -->
				    
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    	<label for="exampleInputEmail1" Class="difColor">Email :</label> -->
<%-- 				     	<form:input path="user.email" cssClass="form-control emailFiled"/> --%>
<%-- 				     	   <span style="color:red;"><form:errors path="user.email"/></span> --%>
<!-- 				     </div> -->
<!-- 				  </div> -->
				  
<!-- 				   <div class="row"> -->
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    <label for="exampleInputEmail1" Class="difColor">Contact :</label> -->
<%-- 				     <form:input path="contact" cssClass="form-control numberFiled" type="number" /> --%>
<%-- 				     <span style="color:red;"><form:errors path="contact"/></span> --%>
<!-- 				    </div> -->
				    
<!-- 				    <div class="form-group col-md-6"> -->
<!-- 				    <label for="exampleInputEmail1" Class="difColor">Date of Birth :</label> -->
<%-- 	 			      <form:input path = "dob" type = "date" cssClass="form-control"/>  --%>
<%-- 	 			       <span style="color:red;"><form:errors path="dob"/></span> --%>
<!-- 	 			    </div>  -->
<!-- 				  </div>  -->
				  
<!-- 			  	<div class = "row"> -->
<!-- 				  	<div class = "col-md-12"> -->
<!-- 				  	<label for="exampleInputEmail1" Class="difColor">Address :</label> -->
<%-- 				  		<form:textarea path = "user.address" cssClass="form-control textFiled" type="text" /> --%>
<!-- 				  	</div> -->
<!-- 			  	</div> -->
			  	
<!-- 			  	<br/> -->
<!-- 			  	<div class="row"> -->
<!-- 				    <div class="form-group col-md-6" Class="difColor"> -->
<!-- 				    <label for="exampleInputEmail1">Password :</label> -->
<%-- 				       <form:password path="user.password" cssClass="form-control passwordFiled empPassword"  /> --%>
<%-- 				       <span style="color:red;"><form:errors path="user.password"/></span> --%>
<!-- 				    </div> -->
				    
<!-- 				    <div class="form-group col-md-6" Class="difColor"> -->
<!-- 				    <label for="exampleInputEmail1">Confirm Password :</label> -->
<!-- 				     	<input class="form-control passwordFiled" id="empConfirmPassword" type="password" placeholder="Confirm Password"/> -->
<!-- 				   		<span id="confirmPasswordError" style="color:red;"></span> -->
<!-- 				    </div> -->
<!-- 		 		 </div> -->
				  
<!-- 			  	<br/> -->
<!-- 			     <div class = "row"> -->
<!-- 				 	 <div class="form-group col-md-4"> -->
<!-- 			     	    <button type="button" class="btn btn-lg btn-block btn-warning" data-dismiss="modal"> -->
<!-- 			     	     <i class="fa fa-close"></i> Cancel</button> -->
<!-- 				 	  </div> -->
<!-- 				    	<div class="form-group col-md-4"> -->
<!-- 				     	 <button type="button" class="btn btn-lg btn-block btn-secondary" type="reset"> -->
<!-- 			     	   <i class="fa fa-repeat"></i> Reset</button> -->
<!-- 				 	</div> -->
<!-- 				 	<div class="form-group col-md-4"> -->
<!-- 				     	 <button type="submit" id="submitBtn" class="btn btn-lg btn-block btn-success"> -->
<!-- 				        <i class="fa fa-floppy-o"></i> Submit</button> -->
<!-- 				  	  </div> -->
<!-- 				 </div> -->
<%-- 			</form:form> --%>
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->


  <script type="text/javascript">
  	$(document).ready(function(){  		
  		
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 
//     	 // SHOW CONFIRMATION MODAL TO DELETE EMPLOYEE
//     	 $("#confModalText").html("Are you want to delete this Employee?");
//     	 $(".triggerRemove").click(function(e){
//     		e.preventDefault();
//     		 $("#confModalbtn").attr("href", $(this).attr("href")); 
//     		$("#confirmModal").modal("show");
//     	 }); 
    	 
//    		 //   VALIDATIONS
//     	 $("#newEmployee").validate();
    	 
//     	 $('.textFiled, .uniqueTextFiled').each(function () {
//     	      $(this).rules('add', {
//     	          required: true,
//     	          minlength:3
//     	      });
//     	 $('.numberFiled').each(function () {
//    	      $(this).rules('add', {
//    	          required: true,
//    	          minlength:10,
//    	      });
//    	    });
//     	 $('.passwordFiled').each(function () {
//       	      $(this).rules('add', {
//       	          required: true,
//       	          minlength:5
//       	      });
//       	    });
//     	 $('.emailFiled').each(function () {
//      	      $(this).rules('add', {
//      	          email:true
//      	      });
//      	    });
//   		});
//   	});
  	
//   	// CHECK UNIQUE USERNAME
//   	 $('.uniqueTextFiled').on('change', function () {
// 		  $.get('http://localhost:8080/titanic/users/availableUserName.do?userName=' +$(this).val(), 
// 	              function(data){
// 	                  if(data == false){
// 	                		 $('#dublicateUserNameError').html('User Name Already Exits!');
// 	                		 $("#submitBtn").css("display", "none");
// 	                  }
// 	                  else{
// 	                	  $('#dublicateUserNameError').html('');
// 	                	  $("#submitBtn").css("display", "block");
// 	                  }
// 	              }, 'json');
// 	    });
  	
//   	// CONFIRM PASSWORD
//   	$('.empPassword, #empConfirmPassword').on('keyup', function () {
//   	  if ($('.empPassword').val() == $('#empConfirmPassword').val()) {
//   		 $("#submitBtn").css("display", "block");
//   		 $('#confirmPasswordError').html('');
//   	  } else 
//   		 $('#confirmPasswordError').html('Password Mis-Matching!');
//   		 $("#submitBtn").css("display", "none");
//   	});

  	</script>