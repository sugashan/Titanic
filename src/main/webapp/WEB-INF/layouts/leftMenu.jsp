
<%@ include file="taglib.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<aside class="main-sidebar" id="tofix">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar fixed">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<c:url value="/resources/dist/img/user2-160x160.jpg" />"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p><%= session.getAttribute("LoggerName") %></p>
				<!-- Status -->
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"	class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->

		<!-- Side bar Menu -->
		<ul class="sidebar-menu">
			<security:authorize access=" isAuthenticated()">
			<li class="header ${current == 'home' ? 'active' : ''}">
				<a href='<spring:url value="/home.jsp" />'> <i class="fa fa-home"></i><span>Home</span></a>
			</li>

			<li class="treeview ${current == 'employee' ? 'active' : ''}"><a href="#"><i class="fa fa-user"></i>
					<span>Users</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="${current == 'employee' ? 'active' : ''}">
						<a href='<spring:url value="/users/employee.do" />'><i class="fa fa-circle-thin"></i><span>
								Employees</span></a>
					</li>
					<li class="${current == 'employee' ? 'active' : ''}">
						<a href='<spring:url value="/users/customer.do" />'><i
							class="fa fa-circle-thin"></i><span> 
								Customers</span></a>
					</li>
				</ul>
			</li>

			<li class="treeview ${current == 'foodType' ? 'active' : ''}">
				<a href="#"><i class="fa fa-cart-arrow-down"></i> <span>Meal</span> 
					<span class="pull-right-container"> <i	class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li class="${current == 'foodType' ? 'active' : ''}">
						<a href='<spring:url value="/meals/foodType.do" />'><i class="fa fa-circle-thin"></i><span>
								Meal-Type</span></a>
					</li>
					<li class="${current == 'meal' ? 'active' : ''}">
						<a href='<spring:url value="/meals/meal.do" />'><i
							class="fa fa-circle-thin"></i><span> 
								Meal</span></a>
					</li>
					<li class="${current == 'comboPackage' ? 'active' : ''}">
						<a href='<spring:url value="/meals/comboPackage.do" />'><i
							class="fa fa-circle-thin"></i><span> 
								Combo-Packages</span></a>
					</li>
				</ul>
			</li>
			
			<li class="treeview"><a href="#"><i class="fa fa-truck"></i>
					<span>Orders</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="${current == 'meal' ? 'active' : ''}"><a href="<spring:url value="/orders/order.do" />"><i
							class="fa fa-circle-thin"></i><span> Order</span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i><span> </span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i><span> </span></a></li>
				</ul>
			</li>
			</security:authorize>
			<li class="treeview"><a href="#"><i class="fa fa-money"></i>
					<span>Payments</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="active"><a href="#">	<i class="fa fa-circle-thin"></i><span>Pay Cash</span></a></li>
					<li class="active"><a href="#">	<i class="fa fa-circle-thin"></i><span>Pay Credit</span></a></li>
					<li class="active"><a href="#">	<i class="fa fa-circle-thin"></i><span>Pay Cheque</span></a></li>
					<li class="active"><a href="#">	<i class="fa fa-circle-thin"></i><span>Pay Loyality</span></a></li>
					<li class="active"><a href="#">	<i class="fa fa-circle-thin"></i><span>Pay Card</span></a></li>
				</ul>
			</li>

			<li class="treeview"><a href="#"><i class="fa fa-money"></i>
					<span>Transactions</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i><span>Customer Transactions</span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i> <span>Supplier Transactions</span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i> <span>Bank Transactions</span></a></li>
				</ul>
			</li>

			<li class="treeview"><a href="#"><i class="fa fa-link"></i>
					<span>Others</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin "></i> <span>Departments</span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i> <span>Counters</span></a></li>
					<li class="active"><a href="#"><i
							class="fa fa-circle-thin"></i> <span>Banks</span></a></li>
				</ul>
			</li>
		</ul>
		<!-- /.side bar-menu -->
	</section>
	<!-- /.side bar -->
</aside>
