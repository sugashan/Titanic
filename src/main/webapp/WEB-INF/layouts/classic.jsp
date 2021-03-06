<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ include file="taglib.jsp" %>
     <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
     <c:set var="contextPath" value="${pageContext.request.contextPath} "/>
     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<security:csrfMetaTags />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/x-icon" href="/resources/dist/img/favicon.ico" />

	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	  
	  <!-- Bootstrap Core CSS -->
	  <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	  <link href="<c:url value="/resources/common/css/bootstrap-toggle.min.css" />" rel="stylesheet">
		
	  <!-- Theme style -->
	  <link href="<c:url value="/resources/dist/css/AdminLTE.min.css" />" rel="stylesheet">
		
	  <!-- AdminLTE Skins & Titanic.  -->
   	  <link href="<c:url value="/resources/dist/css/skins/skin-blue.min.css" />" rel="stylesheet">
   	  <link href="<c:url value="/resources/common/css/titanic.css" />" rel="stylesheet">
   	  
   	   <!-- DataTable css -->
   	  <link href="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.css" />" rel="stylesheet">
   	  
   	  	<!--multiple-select  -->
   	  <link href="<c:url value="/resources/dist/css/multiple-select.css" />" rel="stylesheet">
   	  
   	  
   	  
   	  <title><tiles:getAsString name="title"/></title>
   	  
   	  <style type="text/css">
   	  	.difColor{
/*    	  		color:red; */
   	  	}
   	  
   	  
   	  </style>

</head>

<body class="hold-transition skin-blue sidebar-mini">

	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
	<tilesx:useAttribute name="current"/>
	
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.2.3 -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/common/js/bootstrap-toggle.min.js" />"></script>
	
	<!-- AdminLTE App -->
	<script src="<c:url value="/resources/dist/js/app.min.js" />"></script>	
	
	<!-- Data Table -->
	<script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
  	<script src="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.min.js" />"></script>
  	
  	<!-- Validator -->
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
  	
  	<!-- Common script -->
  	<script type="text/javascript" src="<c:url value="/resources/common/js/titanic.js" />"></script>
  	
  	<!-- FastClick -->
    <script type="text/javascript" src="<c:url value="/resources/plugins/fastclick/fastclick.js" />"></script>

	 <!-- wrapper -->
	<div class="wrapper">
	
	  <!-- Main Header -->
	  <tiles:insertAttribute name = "header"></tiles:insertAttribute>
	 
	  <!-- Left side column. contains the logo and side bar -->
	  <tiles:insertAttribute name = "leftMenu"></tiles:insertAttribute>
	 
	  <!-- Body -->
	  <tiles:insertAttribute name = "containerbody"></tiles:insertAttribute>
	
	  <!-- Main Footer -->
	  <tiles:insertAttribute name = "footer"></tiles:insertAttribute>

	  <!-- Add the sidebar's background. This div must be placed immediately after the control side bar -->
	  <div class="control-sidebar-bg"></div>
	  
	  
	</div>
	<!-- ./wrapper -->
	
</body>
</html>