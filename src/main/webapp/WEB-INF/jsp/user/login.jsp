<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layouts/taglib.jsp" %>

<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Titanic</b>Admin</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	 	<c:if test="${param.success eq null}">
	         <div class="alert alert-info" style = "margin-top:15px;"> <p style=" text-align: center;">Login to start your session</p></div>
	 	</c:if>
	   <c:if test="${param.success eq false}">
            <div class="alert alert-danger" style = "margin-top:15px;"> <p style=" text-align: center;">Failed..! Check your Credentials.</p></div>
       </c:if>
	  
	  
    <form name='f' action='<c:url value="/login" />' method='POST'>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="username" placeholder="UserName" autofocus="autofocus">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password"  class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <input name="submit" type="submit" class="btn btn-danger btn-block btn-flat" value="Login" />
          <security:csrfInput/>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="#">I forgot my password</a><br>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


<script>
  $(document).ready(function () {
	  $(".hold-transition").removeClass("lockscreen").addClass("login-page");
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
