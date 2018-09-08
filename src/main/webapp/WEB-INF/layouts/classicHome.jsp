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
  <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <link rel="icon" type="image/png" href="/resources/dist/img/favicon.ico">
  
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css" />">
  
  <!-- Theme style -->
  <link href="<c:url value="/resources/dist/css/home/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/common/css/bootstrap-toggle.min.css" />" rel="stylesheet">
  
  <!-- Others -->
  <link href="<c:url value="/resources/dist/css/AdminLTE.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/dist/css/home/wickedpicker.css" />" rel="stylesheet"> 
  <link href="<c:url value="/resources/dist/css/home/font-awesome.css" />" rel="stylesheet"> 
  
   <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link href="<c:url value="/resources/dist/css/home/easy-responsive-tabs.css" />" rel="stylesheet"> 
  <link href="<c:url value="/resources/dist/css/home/chocolat.css" />" rel="stylesheet" media="all"> 
  
  <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	    rel='stylesheet' type='text/css'>
	    
 
  <title><tiles:getAsString name="title"/></title>
  
  <script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
   
</head>

<body>

	<tiles:insertAttribute name="body" />
	
</body>
</html>