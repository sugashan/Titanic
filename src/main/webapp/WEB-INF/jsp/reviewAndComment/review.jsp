<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 
<%@ include file="../../layouts/taglib.jsp" %>
<%@ include file="../common/commonModals.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
<!-- 	<input type = "button" data-target="#add-employee" data-toggle="modal" class="btn btn-success" value = "Add New"/> -->
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Reviews & Comments</h3>
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
				<table id="commentsTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Customer-Name</th>
							<th>Customer-Mobile</th>
							<th>subject</th>
							<th>message</th>
							<th>Reply</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${comments}" var="comment">
							<tr>
								<td> <a class="btn text-danger triggerRemove"
									href='<spring:url value="deleteComment/${comment.id}.do" />'> <i
										class="fa fa-trash-o"></i>
								</a><c:out value=" ${emp.user.id}"/></td>
								<td><a class="btn" href='<spring:url value="singleComment/${comment.id}.do" />'><c:out value="${comment.customerName}"/></a></td>
								<td><a class="btn" href='<spring:url value="singleComment/${comment.id}.do" />'><c:out value="${comment.custMobile}"/></a></td>
								<td><a class="btn" href='<spring:url value="singleComment/${comment.id}.do" />'><c:out value="${comment.subject}"/></a></td>
								<td><a class="btn" href='<spring:url value="singleComment/${comment.id}.do" />'><c:out value="${comment.message}"/></a></td>
								<td><a class="btn" href='<spring:url value="singleComment/${comment.id}.do" />'><c:out value="${comment.replyMsg}"/></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Customer-Name</th>
							<th>Customer-Mobile</th>
							<th>subject</th>
							<th>message</th>
							<th>Reply</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</div>
 
 
 <script>
  	$(document).ready(function(){  	
  		history.replaceState(null, document.title, "review.do");
  		hideParam();
    	 $('#commentsTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
    	 
    	 
    	 $("#confModalText").html("Are you want to delete this review?");
    	 $(".triggerRemove").click(function(e){
    		e.preventDefault();
    		 $("#confModalbtn").attr("href", $(this).attr("href")); 
    		$("#confirmModal").modal("show");
    	 });
  	});
</script>