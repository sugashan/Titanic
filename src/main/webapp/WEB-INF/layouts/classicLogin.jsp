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
  
  <!-- Theme style -->
  <link href="<c:url value="/resources/dist/css/login/style.css" />" rel="stylesheet">
 
   <title><tiles:getAsString name="title"/></title>

</head>

<body>
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.2.3 -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js" />"></script>
	<script src="<c:url value="/resources/dist/js/login/index.js" />"></script>
	
  	<!-- Validator -->
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
  	<script type="text/javascript" src="<c:url value="/resources/common/js/titanic.js" />"></script>
	
	<tiles:insertAttribute name="body" />
</body>
</html>