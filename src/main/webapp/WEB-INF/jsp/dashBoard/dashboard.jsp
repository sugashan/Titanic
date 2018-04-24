<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ include file="../../layouts/taglib.jsp"%>
    
  <!-- Morris chart -->
	  <link href="<c:url value="/resources/plugins/morris/morris.css" />" rel="stylesheet">
	  
	  <!-- Date Picker -->
	   <link href="<c:url value="/resources/plugins/datepicker/datepicker3.css" />" rel="stylesheet">
	  
	  <!-- Daterange picker -->
	   <link href="<c:url value="/resources/plugins/daterangepicker/daterangepicker.css" />" rel="stylesheet">
	   
	   
	      
     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>Titanic Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3 id="newOrders">12</h3>

              <p>New Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href='<spring:url value="/orders/order.do" />' class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3 id="bounceRate">53</h3>

              <p>Order Finishing Rate</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3 id="tasks">44</h3>

              <p>Tasks</p>
            </div>
            <div class="icon">
              <i class="fa fa-hourglass-start" style="font-size:75px;"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 id="homePageVisitors">65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom" style="display:none;">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
              <li><a href="#sales-chart" data-toggle="tab">Donut</a></li>
              <li class="pull-left header"><i class="fa fa-inbox"></i> Sales</li>
            </ul>
            <div class="tab-content no-padding">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
              <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
            </div>
          </div>
          <!-- /.nav-tabs-custom -->

			
			    <!-- solid sales graph -->
          <div class="box box-solid bg-teal-gradient">
            <div class="box-header">
              <i class="fa fa-th"></i>

              <h3 class="box-title">Titanic Order Graph</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" id="dineIn" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Dine-Orders</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" id="delivery" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Delivery-Orders</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <input type="text" class="knob" id="pickUp" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Pick-Up-Orders</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
         

        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">

          <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Titanic's Event Calendar</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bars"></i></button>
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="#">Add new event</a></li>
                    <li><a href="#">Clear events</a></li>
                    <li class="divider"></li>
                    <li><a href='<spring:url value="/utility/calendar.do" />'>View calendar</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%;"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  
  
    <!-- SCRIPTS -->
 <script>

	var dashInfo = "";
	dashInfo = ${dashboardInfo};
	
	var dineInOrder = 0;
	var deliveryOrder = 0;
	var pickUpOrder = 0;
	
	var orderData = [];
	 var total = 1;
	
	if(dashInfo != "" || dashInfo != null){
	 $("#newOrders").html(dashInfo.newOrders);
	 $("#homePageVisitors").html(dashInfo.activeCustomers);
	 $("#tasks").html(dashInfo.newOrders);
	 $("#bounceRate").html(dashInfo.newOrders+1/total *100 + " %");
	 
	 dineInOrder = dashInfo.dineInOrders;
	 deliveryOrder = dashInfo.delievryOrders;
	 pickUpOrder  = dashInfo.pickUpOrders;
	 
	 total = dineInOrder + deliveryOrder + pickUpOrder;
	 
	 if(dineInOrder != 0){
		 dineInOrder = dineInOrder/total * 100;
	 }
	 if(deliveryOrder != 0){
		 deliveryOrder = deliveryOrder/total * 100;
	 }
	 if(pickUpOrder != 0){
		 pickUpOrder = pickUpOrder/total * 100;
	 }
	 
	 $("#pickUp").val(pickUpOrder);
	 $("#delivery").val(deliveryOrder);
	 $("#dineIn").val(dineInOrder);
	 
	 orderData = dashInfo.ordersCountBySixMonth;
	 console.log(orderData);
	}

</script>
  
  
<!-- jQuery UI 1.11.4 -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

<!-- Morris.js charts -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/morris/morris.min.js" />"></script>

<!-- Sparkline -->
<script type="text/javascript" src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js" />"></script>

<!-- jQuery Knob Chart -->
<script type="text/javascript" src="<c:url value="/resources/plugins/knob/jquery.knob.js" />"></script>

<!-- daterangepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js" />"></script>

 <!-- Bootstrap WYSIHTML5 -->
<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />" ></script>

<script src="<c:url value="/resources/dist/js/pages/dashboard.js"/>"></script>
  
