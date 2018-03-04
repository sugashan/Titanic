<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ include file="../../layouts/taglib.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">Employee</h3>
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
							<th>Mobile</th>
							<th>Role</th>
							<th>Region</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${employee}" var="emp">
							<tr>
								<td><a class="btn" onclick="editEmployee(${emp.user.id})">
										<i class="fa fa-pencil-square-o"></i>
								</a> <a class="btn text-danger"
									onclick="deleteUserModal(${emp.user.id})"> <i
										class="fa fa-trash-o"></i>
								</a> ${emp.user.userName}</td>
								<td onclick="singleView(${emp.user.id})">${emp.user.name}</td>
								<td onclick="singleView(${emp.user.id})">${emp.user.mobile}</td>
								<td onclick="singleView(${emp.user.id})">${emp.role.name}</td>
								<td onclick="singleView(${emp.user.id})">${emp.branch}</td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Region</th>
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
    	 $('#employeeTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });  		
  	});
  	</script>