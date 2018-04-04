<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layouts/taglib.jsp"%>

<div class="cotn_principal">
	<div class="cont_centrar">
		<div style="margin-top: 75px; color:white;">
			<div>
			<p style="font-size:35px;">
					<b>Titanic</b>Restaraunt
				</p></div>
		<c:if test="${param.success eq null}">
			<div class="alert alert-warning" style="margin-top: 15px;">
				<p style="text-align: center;">Login to start your session</p>
			</div>
		</c:if>
		<c:if test="${param.success eq false}">
			<div class="alert alert-danger" style="margin-top: 15px;">
				<p style="text-align: center; color:red;">Failed..! Please Check your Credentials.</p>
			</div>
		</c:if>
		<c:if test="${param.success eq true}">
			<div class="alert alert-danger" style="margin-top: 15px;">
				<p style="text-align: center; color:green;">${param.msg}!,  Login to start your session.</p>
			</div>
		</c:if>
		</div>
		<div class="cont_login" style="margin-top:-45px;">
			<div class="cont_info_log_sign_up">
				<div class="col_md_login">
					<div class="cont_ba_opcitiy">

						<h2>LOGIN</h2>
						<p>Let's get In!</p>
						<button class="btn_login" onclick="cambiar_login()">LOGIN</button>
					</div>
				</div>
				<div class="col_md_sign_up">
					<div class="cont_ba_opcitiy">
					
						<h2>SIGN UP</h2>
						<p>Don't have an account yet?</p>
						<button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN
							UP</button>
					</div>
				</div>
			</div>


			<div class="cont_back_info">
				<div class="cont_img_back_grey">
					<img
						src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
						alt="" />
				</div>

			</div>
			<div class="cont_forms">
				<div class="cont_img_back_">
					<img
						src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
						alt="" />
				</div>
				<form name='f' action='<c:url value="/login" />' method='POST'
					class="cont_form_login">
					<a href="#" onclick="ocultar_login_sign_up()"><i
						class="material-icons">&#xE5C4;</i></a>
					<h2>LOGIN</h2>

					<input type="text" name="username" placeholder="UserName"
						autofocus="autofocus" /> 
					<input type="password" name="password"
						placeholder="Password" /> 
					<input name="submit" type="submit"
						class="btn_login" value="LOGIN"
						style="color: white; text-align: center; width: 200px" />
					<security:csrfInput/>
				</form>

				<form:form modelAttribute="newUser" action="/titanic/users/addCustomer.do" enctype="application/x-www-form-urlencoded" method="post" class="cont_form_sign_up" >
					<a href="#" onclick="ocultar_login_sign_up()"><i
						class="material-icons">&#xE5C4;</i></a>
					<h2>SIGN UP</h2>
					<form:input type="text" path="email" placeholder="Email" class="emailFiled" style="height: 25px;" /> 
					<form:errors path="email"/><br/>
					<form:input type="text" path="userName" placeholder="UserName" class="textFiled uniqueTextFiled" style="height: 25px;"/> 
					<form:errors path="userName"/><br/>
					<span id="dublicateUserNameError" style="color:red;"></span>
					<form:input type="number" path="mobile" placeholder="mobile" class="numberFiled" style="height: 25px;"/> 
					<form:errors path="mobile"/><br/>
					<form:textarea type="text" path="address" placeholder="Address" class="" style="height: 25px;"></form:textarea>
					<form:errors path="address"/><br/>
					<form:input type="password" path="password" placeholder="Password" class="passwordFiled" style="height: 25px;"/> 
					<form:errors path="password"/><br/>
					<input type="password" id="conFPassword" placeholder="Confirm Password" class="passwordFiled" style="height: 25px;"/><br/>
					<span id="confirmPasswordError" style="color:red;"></span>
					<button class="btn_sign_up" type="submit">SIGN UP</button>
				</form:form>
				</div>
			</div>
		</div>
	</div>

<script>
  $(document).ready(function () {
	  
	  $("#newUser").validate();
		 validator();
		 reset();
  });
  

//CONFIRM PASSWORD
$('#password, #conFPassword').on('keyup', function () {
if ($('#password').val() == $('#conFPassword').val()) {
//	 $("#submitBtn").css("display", "block");
	 $('#confirmPasswordError').html('');
} else 
	 $('#confirmPasswordError').html('Password Mis-Matching!');
//	 $("#submitBtn").css("display", "none");
});


//CHECK UNIQUE USERNAME
$('.uniqueTextFiled').on('change', function () {
  $.get('http://localhost:8080/titanic/users/availableUserName.do?userName=' +$(this).val(), 
          function(data){
              if(data == false){
            		 $('#dublicateUserNameError').html('User Name Already Exits!');
//            		 $("#submitBtn").css("display", "none");
              }
              else{
            	  $('#dublicateUserNameError').html('');
            	  $("#submitBtn").css("display", "block");
              }
          }, 'json');
});
</script>
