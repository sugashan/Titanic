<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <c:set var="contextPath" value="${pageContext.request.contextPath} "/>
     
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
 
  <!-- Theme style -->
  <link href="<c:url value="/resources/dist/css/AdminLTE.min.css" />" rel="stylesheet">
 
  <!-- AdminLTE Skins.  -->
  <link href="<c:url value="/resources/dist/css/skins/skin-blue.min.css" />" rel="stylesheet">
  
   <title><tiles:getAsString name="title"/></title>
   
</head>

<body class="hold-transition">
		<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.2.3 -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
	
	<!-- iCheck -->
	<script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"></script>
	
	<tiles:insertAttribute name="body" />
</body>
</html>