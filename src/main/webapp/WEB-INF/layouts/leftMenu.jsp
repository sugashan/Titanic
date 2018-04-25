
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
			<li class="header ${current == 'dashboard' ? 'active' : ''}">
				<a href='<spring:url value="/dashboard.do" />'> <i class="fa fa-home"></i><span>DashBoard</span></a>
			</li>

			<li class="treeview ${current == 'home' ? 'active' : ''}">
				<a href='<spring:url value="/home.do" />'> <i class="fa fa-laptop"></i><span>Titanic Home Page</span></a>
			</li>
			
			<li class="treeview ${current == 'employee' or current == 'customer' ? 'active' : ''}"><a href="#"><i class="fa fa-user"></i>
					<span>Users</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="${current == 'employee' ? 'active' : ''}">
						<a href='<spring:url value="/users/employee.do" />'><i class="fa fa-circle-thin"></i><span>
								Employees</span></a>
					</li>
					<li class="${current == 'customer' ? 'active' : ''}">
						<a href='<spring:url value="/users/customer.do" />'><i
							class="fa fa-circle-thin"></i><span> 
								Customers</span></a>
					</li>
				</ul>
			</li>

			<li class="treeview ${current == 'foodType' or current == 'meal' or current == 'comboPackage' ? 'active' : ''}">
				<a href="#"><i class="fa  fa-cutlery"></i> <span>Meal</span> 
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
			
			<li class="treeview ${current == 'order' ? 'active' : ''}">
				<a href='<spring:url value="/orders/order.do" />'> <i class="fa fa-bell-o"></i><span> Order</span></a>
			</li>
			
			<li class="treeview ${current == 'table' ? 'active' : ''}">
				<a href='<spring:url value="/orders/order.do" />'> <i class="fa fa-table"></i><span> Tables</span></a>
			</li>
			
			<li class="treeview ${current == 'inquiry' ? 'active' : ''}"><a href="#"><i class="fa fa-th"></i>
					<span>Utilities</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="active ${current == 'calendar' ? 'active' : ''}"><a href='<spring:url value="/utility/calendar.do" />'><i
							class="fa fa-calendar"></i><span>Calendar</span></a></li>
					<li class="${current == 'task' ? 'active' : ''}"><a href="#"><i
							class="fa fa-hourglass-start"></i> <span>Tasks</span></a></li>
					<li class="${current == 'report' ? 'active' : ''}"><a href="#"><i
							class="fa fa-book"></i> <span>Reports</span></a></li>
				</ul>
			</li>
			
			<li class="treeview ${current == 'review' ? 'active' : ''}">
				<a href='<spring:url value="/comments/comment.do" />'> <i class="fa fa-comments-o"></i><span> Comments</span></a>
			</li>
			
			<li class="treeview ${current == 'inquiry' ? 'active' : ''}"><a href="#"><i class="fa fa-question-circle"></i>
					<span>FAQ</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li class="treeview ${current == 'inquiry' ? 'active' : ''}">
						<a href='<spring:url value="/inquiries/inquiry.do" />'> <i class="fa fa-edit"></i><span> InQuiry</span></a>
					</li>
				</ul>
			</li>
			
			</security:authorize>
		</ul>
		<!-- /.side bar-menu -->
	</section>
	<!-- /.side bar -->
</aside>
