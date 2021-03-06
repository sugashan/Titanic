<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="../../layouts/taglib.jsp" %>

    <!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="../../index2.html"><b>Titanic</b>Admin</a>
  </div>
  <!-- User name -->
  <div class="lockscreen-name">John Doe</div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="../../dist/img/user1-128x128.jpg" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials" name='f' action='<c:url value="/login" />' method='POST'>
      <div class="input-group">
       <input type="text" class="form-control" name="username" placeholder="UserName" value="${username }" hidden="hidden">
        <input type="password" class="form-control" placeholder="password" autofocus="autofocus">
        <div class="input-group-btn">
        	 <a type="submit"><i  class="fa fa-arrow-right text-muted"></i></a>
         	 <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden" />
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    Enter your password to retrieve your session
  </div>
  <div class="text-center">
    <a href='<spring:url value="/login.do" />'>Or sign in as a different user</a>
  </div>
  <div class="lockscreen-footer text-center">
    Copyright &copy; 2018-2019 <b><a href="http://almsaeedstudio.com" class="text-black">Sugashan Tech</a></b><br>
    All rights reserved
  </div>
</div>
<!-- /.center -->

<script>
	$(document).ready(function(){
		 $(".hold-transition").removeClass("login-page").addClass("lockscreen");
	});

</script>