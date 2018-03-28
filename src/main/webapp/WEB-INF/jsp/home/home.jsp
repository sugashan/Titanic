<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="../../layouts/taglib.jsp" %>
    <%@ include file="../common/commonModals.jsp" %>
    
	<!-- Header -->
	<div class="header" id="home">
		<!--/top-bar-->
		<div class="top-bar">
			<div class="header-top_w3layouts">
				<div class="forms">
					<p><span class="fa fa-map-marker" aria-hidden="true"></span>Titanic, Nelliyady</p>
					<p><span class="fa fa-envelope-o" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a> </p>
					<p><span class="fa fa-phone" aria-hidden="true"></span> 021-226 2323 </p>
				</div>
				<ul class="top-right-info">
					<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>

				</ul>
				
				<div class="clearfix"></div>

			</div>
			<div class="header-nav">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
						<h1><a class="navbar-brand" href="#">Titanic<span>Restaraunt</span></a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						<nav>
							<ul class="top_nav">
								<li><a class="scroll" href="#home" class="active">Home</a></li>
								<li><a class="scroll" href="#about">About Us</a></li>
								<li><a class="scroll" href="#services">Services</a></li>
								<li class="dropdown menu__item">
									<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" data-hover="Pages" role="button" aria-haspopup="true"
									    aria-expanded="false"> Order <span class="fa fa-angle-down"></span></a>
									<ul class="dropdown-menu">
										<li><a class="scroll" href="#menu">Menu</a></li>
										<li><a class="scroll" href="#book">Booking</a></li>
									</ul>
								</li>
								<li><a class="scroll" href="#gallery">Gallery</a></li>
								<li><a class="scroll" href="#mail">Contact</a></li>
<%-- 								<security:authorize access=" !isAuthenticated()"> --%>
<!-- 								<li><a class="scroll" href='<spring:url value="/titanic/login.do" />'>Login</a></li> -->
<%-- 								</security:authorize> --%>
								
								<!-- User Info -->
<%-- 								<security:authorize access=" isAuthenticated()"> --%>
								<li class="dropdown menu__item">
									<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" data-hover="Pages" role="button" aria-haspopup="true"
									    aria-expanded="false"> My Account <span class="fa fa-angle-down"></span></a>
									<ul class="dropdown-menu">
										<li><a class="scroll" href="#"><i class="fa fa-user"></i> <%= session.getAttribute("LoggerName") %></a></li>
										<li><a class="" href="#" data-toggle="modal" data-target="#myProfileModal" data-backdrop="static" data-keyboard="false" ><i class="fa fa-address-book"></i> Profile </a></li>
										<hr/>
										<li><a class="scroll" href='<c:url value="/logout" />'><i class="fa fa-sign-out"></i> Logout</a></li>
									</ul>
								</li>
<%-- 								</security:authorize> --%>
							</ul>
						</nav>
					</div>
				</nav>
			</div>
		</div>
			<!--//top-bar-->
			
		<!-- banner-text -->
		<div class="slider">
			<div class="callbacks_container">
				<ul class="rslides callbacks callbacks1" id="slider4">
					<li>
						<div class="banner-top">
							<div class="banner-info_agile_w3ls">
								<h3>Come hungry. <span>Leave</span> happy.</h3>
								<p>A Taste Of Good Life.</p>
								<a href="#about" class="scroll">Read More <i class="fa fa-caret-right" aria-hidden="true"></i></a>
								<a href="#mail" class="scroll">Contact Us <i class="fa fa-caret-right" aria-hidden="true"></i></a>
							</div>

						</div>
					</li>
					<li>
						<div class="banner-top1">
							<div class="banner-info_agile_w3ls">
								<h3>Better Ingredients. <span>Better</span> Food.</h3>
								<p>Enjoy life, It's delicious.</p>
								<a href="#about" class="scroll">Read More <i class="fa fa-caret-right" aria-hidden="true"></i></a>
								<a href="#mail" class="scroll">Contact Us <i class="fa fa-caret-right" aria-hidden="true"></i></a>
							</div>

						</div>
					</li>
					<li>
						<div class="banner-top2">
							<div class="banner-info_agile_w3ls">
								<h3>Live, Love And <span>Eat</span> Always.</h3>
								<p>Small change, Big differences.</p>
								<a href="#about" class="scroll">Read More <i class="fa fa-caret-right" aria-hidden="true"></i></a>
								<a href="#mail" class="scroll">Contact Us <i class="fa fa-caret-right" aria-hidden="true"></i></a>
							</div>

						</div>
					</li>
					<li>
						<div class="banner-top3">
							<div class="banner-info_agile_w3ls">
								<h3>Enjoy life.  It's <span>Delicious.</span></h3>
								<p>Good food is Good Mood.</p>
								<a href="#about" class="scroll">Read More <i class="fa fa-caret-right" aria-hidden="true"></i></a>
								<a href="#mail" class="scroll">Contact Us <i class="fa fa-caret-right" aria-hidden="true"></i></a>
							</div>

						</div>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div>

			<!--banner Slider starts Here-->
		</div>
		<!--//Slider-->
	</div>
	
		<!-- services -->
	<div class="work" id="services">
		<div class="container">
			<div class="work-main">
				<div class="work-top">
					<h3>Our Services</h3>
					<p>Lorem ipsum dolor sit amet,vehicula vel sapien et</p>
				</div>
				<div class="work-bottom_w3ls_agile">
					<div class="work-bottom-top">
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-spoon" aria-hidden="true"></span>
								<h4>Fresh Products</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-apple" aria-hidden="true"></span>
								<h4>Healthy Food</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-home" aria-hidden="true"></span>
								<h4>Traditional Methods
								</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
					<div class="work-bottom-top">
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-calendar" aria-hidden="true"></span>
								<h4>Advance Booking</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-smile-o" aria-hidden="true"></span>
								<h4>Best Chefs</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>

						</div>
						<div class="col-md-4">
							<div class="work-bottom-left_agile_w3ls">
								<span class="fa fa-child" aria-hidden="true"></span>
								<h4>150 Tables
								</h4>
								<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. </p>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- gallery special-->
	<div class="gallery" id="gallery">
		<div class="container">
			<div class="gallery-main">
				<div class="gallery-top">
				<c:forEach items="${meals}" var="meal">
					<c:if test="${not empty meal.imageUrl && meal.isSpecial eq true}">
						<div class="gallery-top-img portfolio-grids">
							<a href="<c:out value="${meal.imageUrl}" />" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
								<img src="<c:out value="${meal.imageUrl}" />" class="img-responsive" alt="" />
								<div class="p-mask">
									<h4><span>${meal.name}</span></h4>
									<p>${meal.description}</p>
								</div>
							</a>
						</div>
					</c:if>
				</c:forEach>
					<div class="gallery-top-img">
						<h3>OUR SPECIALS</h3>
						<span> </span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gallery-bottom">
					<div class="col-md-6 gallery-bottom-text">
						<p>Etiam faucibus viverra libero vel efficitur. Ut semper nisl ut laoreet ultrices. Maecenas dictum arcu purus, sit amet
							volutpat purus viverra sit amet. Quisque lacinia quam sed tortor interdum, malesuada congue nunc ornare. Cum sociis
							natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In semper lorem eget tortor pulvinar ultricies.</p>
					</div>
					<div class="col-md-6 gallery-bottom-text">
						<p>Etiam faucibus viverra libero vel efficitur. Ut semper nisl ut laoreet ultrices. Maecenas dictum arcu purus, sit amet
							volutpat purus viverra sit amet. Quisque lacinia quam sed tortor interdum, malesuada congue nunc ornare. Cum sociis
							natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In semper lorem eget tortor pulvinar ultricies.</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	
	
		<!-- Menu tab_section  -->
	<div class="tabs_section" id="menu">
		<div class="container">
		<h5>Special Menu</h5>
		<fieldset> <legend></legend>
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<li> BREAKFAST</li>
					<li> LUNCH</li>
					<li> DINNER</li>
					<li> BEVERAGES</li>
				</ul>
				<div class="clearfix"> </div>
				<div class="resp-tabs-container">
		
					<!-- Breakfast-Meal -->
					<div class="tab1">
						<div class="recipe-grid">
							<c:forEach items="${breakfastMeals}" var="breakFastMeal">
								<div class="col-md-6 menu-grids">
									<div class="menu-text_wthree">
										<div class="menu-text-left">
											<div class="rep-img">
												<img src='<c:out value="${breakFastMeal.imageUrl}"/>' alt=" " class="img-responsive">
											</div>
											<div class="rep-text">
												<h4><c:out value="${breakFastMeal.name}"/></h4>
												<h6>Incrediants - <c:out value="${breakFastMeal.incrediants}"/></h6>
											</div>
	
											<div class="clearfix"> </div>
										</div>
										<div class="menu-text-right">
											<h4>LKR <c:out value="${breakFastMeal.price}"/></h4>
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</c:forEach>
							<div class="clearfix"> </div>
						</div>
							<div class="clearfix"> </div>
						</div>
						
					<!-- Lunch-Meal -->
					<div class="tab2">
						<div class="recipe-grid">
						<c:forEach items="${lunchMeals}" var="lunchtMeal">
							<div class="col-md-6 menu-grids">
								<div class="menu-text_wthree">
									<div class="menu-text-left">
										<div class="rep-img">
											<img src='<c:out value="${lunchtMeal.imageUrl}"/>' alt=" " class="img-responsive">
										</div>
										<div class="rep-text">
											<h4><c:out value="${lunchtMeal.name}"/></h4>
											<h6>Incrediants - <c:out value="${lunchtMeal.incrediants}"/></h6>
										</div>

										<div class="clearfix"> </div>
									</div>
									<div class="menu-text-right">
										<h4>LKR <c:out value="${lunchtMeal.price}"/></h4>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</c:forEach>
						<div class="clearfix"> </div>
					</div>
						<div class="clearfix"> </div>
					</div>
						
					<!-- Dinner-Meal -->
					<div  class="tab3">
							<div class="recipe-grid">
							<c:forEach items="${dinnerMeals}" var="dinnerMeal">
								<div class="col-md-6 menu-grids">
									<div class="menu-text_wthree">
										<div class="menu-text-left">
											<div class="rep-img">
												<img src='<c:out value="${dinnerMeal.imageUrl}"/>' alt=" " class="img-responsive">
											</div>
											<div class="rep-text">
												<h4><c:out value="${dinnerMeal.name}"/></h4>
												<h6>Incrediants - <c:out value="${dinnerMeal.incrediants}"/></h6>
											</div>
	
											<div class="clearfix"> </div>
										</div>
										<div class="menu-text-right">
											<h4>LKR <c:out value="${dinnerMeal.price}"/></h4>
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</c:forEach>
							<div class="clearfix"> </div>
						</div>
							<div class="clearfix"> </div>
					</div>
					
					
					<!-- Beverages -->
					<div class="tab4">
					<div class="recipe-grid">
							<c:forEach items="${anyTimeMeals}" var="anyTimeMeal">
								<div class="col-md-6 menu-grids">
									<div class="menu-text_wthree">
										<div class="menu-text-left">
											<div class="rep-img">
												<img src='<c:out value="${anyTimeMeal.imageUrl}"/>' alt=" " class="img-responsive">
											</div>
											<div class="rep-text">
												<h4><c:out value="${anyTimeMeal.name}"/></h4>
												<h6>Incrediants - <c:out value="${anyTimeMeal.incrediants}"/></h6>
											</div>
	
											<div class="clearfix"> </div>
										</div>
										<div class="menu-text-right">
											<h4>LKR <c:out value="${anyTimeMeal.price}"/></h4>
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</c:forEach>
							<div class="clearfix"> </div>
						</div>
							<div class="clearfix"> </div>
					
					</div>
					
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			</fieldset>
		</div>
	</div>
	

	<!--/services-->
	<div class="choose">
		<div class="container">
			<div class="choose-main">
				<div class="col-md-5 choose-left">
					<h2>SPECIAL SERVICES</h2>
				</div>
				<div class="col-md-7 choose-right">
					<div class="col-md-6 choose-right-top">
						<span class="fa fa-truck" aria-hidden="true" style="font-size:50px; color: #ffa41f; padding-bottom: 15px"></span>
						<h4>Door Delivery</h4>
						<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. Morbi vulputate tempor
							nisl nec tristique.</p>
					</div>
					<div class="col-md-6 choose-right-top">
						<span class="fa fa-shopping-cart" aria-hidden="true" style="font-size:50px; color: #ffa41f; padding-bottom: 15px"></span>
						<h4>Customized Food</h4>
						<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. Morbi vulputate tempor
							nisl nec tristique.</p>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-6 choose-right-top">
						<span class="fa fa-credit-card" aria-hidden="true" style="font-size:50px; color: #ffa41f; padding-bottom: 15px"></span>
						<h4>Card Payment</h4>
						<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. Morbi vulputate tempor
							nisl nec tristique. </p>
					</div>
					<div class="col-md-6 choose-right-top">
						<span class="fa fa-gift" aria-hidden="true" style="font-size:50px; color: #ffa41f; padding-bottom: 15px"></span>
						<h4>Special Offers & Combo</h4>
						<p>Duis sit amet posuere justo, sit amet finibus urna. Aenean elementum diam nec laoreet sodales. Morbi vulputate tempor
							nisl nec tristique.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//services-->

	<!-- about -->
	<div class="about" id="about_one">
		<div class="container">
			<div class="about-main_w3_agileits">
				<div class="col-md-6 about-left">
					<img src='<c:url value="/resources/dist/img/home/chef.jpg" />' alt="">
				</div>
				<div class="col-md-6 about-right_agileits">
					<h3>For Good Taste</h3>
					<p>Nulla sodales efficitur consequat. Maecenas mi diam, imperdiet consectetur ultricies nec, convallis sit amet turpis.
						Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<a class="active" href="#" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">Learn more</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	

	<!-- Reservation -->
	<div class="reservation" id="book">
		<div class="book-form">
			<h4>Prearrange a Table.</h4>
			<form action="#" method="post">
				<div class="col-md-4 form-time">
					<label><i class="fa fa-clock-o" aria-hidden="true"></i></label>
					<input type="text" id="timepicker" name="Time" placeholder="Time" class="timepicker form-control hasWickedpicker" value="Time"
					    onkeypress="return false;" required="required">
				</div>
				<div class="col-md-4 form-date">
					<label><i class="fa fa-calendar" aria-hidden="true"></i> </label>
					<input id="datepicker1" name="Text" type="text" value="mm/dd/yyyy" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
					    required="required">
				</div>
				<div class="col-md-4 form-left">
					<label><i class="fa fa-users" aria-hidden="true"></i></label>
					<select class="form-control">
								<option>No.of People</option>
								<option>1 Person</option>
								<option>2 People</option>
								<option>3 People</option>
								<option>4 People</option>
								<option>5 People</option>
								<option>6 People</option>
								<option>More</option>
							</select>
				</div>
				<div class="clearfix"> </div>
				<div class="col-md-3 form-left">
					<ul>
						<li><i class="fa fa-check-square-o" aria-hidden="true"></i>Over 10,000 restaurants Worldwide</li>
						<li><i class="fa fa-check-square-o" aria-hidden="true"></i>No booking fees</li>
					</ul>
				</div>
				<div class="col-md-3 form-left-submit">
					<input type="submit" value="Book a table">
				</div>
				<div class="clearfix"> </div>
			</form>
		</div>
	</div>
	
		<!-- About Story -->
	<div class="news" id="about">
		<div class="container">
			<div class="news-main_wthree_agile">
				<div class="col-md-6 news-left">
					<h2>OUR INTERESTING HISTORY</h2>
				</div>
				<div class="col-md-6 news-right">
					<p>Etiam faucibus viverra libero vel efficitur. Ut semper nisl ut laoreet ultrices. Maecenas dictum arcu purus, sit amet
						volutpat purus viverra sit amet. Quisque lacinia quam sed tortor interdum, malesuada congue nunc ornare. Cum sociis
						natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In semper lorem eget tortor pulvinar ultricies.
					</p>
					<p>Etiam faucibus viverra libero vel efficitur. Ut semper nisl ut laoreet ultrices. Maecenas dictum arcu purus, sit amet
						volutpat purus viverra sit amet. Quisque lacinia quam sed tortor interdum, malesuada congue nunc ornare. Cum sociis
						natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In semper lorem eget tortor pulvinar ultricies.
					</p>
				</div>

				<div class="clearfix"></div>
				<div class="mid_slider">
					<!-- banner -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1" class=""></li>
							<li data-target="#myCarousel" data-slide-to="2" class=""></li>
							<li data-target="#myCarousel" data-slide-to="3" class=""></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal1.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal2.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal3.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal4.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal5.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal6.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal7.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal8.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal9.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal10.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal11.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal12.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal13.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal1.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal2.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3 slidering">
										<div class="thumbnail"><img src="<c:url value="/resources/dist/img/home/gal3.jpg" />" alt="Image" style="max-width:100%;"></div>
									</div>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="fa fa-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="fa fa-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
						<!-- The Modal -->
					</div>
					<!--//banner -->

				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Comments -->
	<div class="comments" id="client">
		<div class="container">
			<div class="comments-main">
				<div class="comments-head">
					<h3>Comments from our customers</h3>
					<p>Lorem ipsum dolor sit amet,vehicula vel sapien et</p>
				</div>
				<div class="comments-top">
					<c:forEach begin="1" end="3">
						<c:forEach items="${comments}" varStatus="comment">
							<div class="col-md-4 comments-bottom">
								<div class="comments-left">
									<span class="fa fa-quote-right"></span>
								</div>
								<div class="comments-right">
									<h3><c:out value="${comment.user.name}"/></h3>
									<p class="para1">Rating</p>
									<p class="para2"><c:out value="${comment.message}"/>.</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
							<div class="clearfix"></div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<!-- mail -->
	<div class="mail" id="mail">
		<div class="container">
			<h3>Contact Us</h3>
			<div class="mail_grids_wthree_agile_info">
				<div class="col-md-7 mail_grid_right_agileits_w3">
					<h5>Please fill this form to contact with us.</h5>
					<form:form action="comment/addComment.do" modelAttribute="newFeedBack" enctype="application/x-www-form-urlencoded" method="post">
						<div class="col-md-6 col-sm-6 contact_left_grid">
							<form:input type="text" path="customerName" placeholder="Name" class="textFiled" />
							 <form:errors path="customerName"/>
							 
							<form:input type="email" path="email" placeholder="Email" class="emailFiled"/>
							 <form:errors path="email"/>
						</div>
						<div class="col-md-6 col-sm-6 contact_left_grid">
							<form:input type="text" path="mobile" placeholder="Telephone" class="numberFiled"/>
							 <form:errors path="mobile"/>
							 
							<form:input type="text" path="subject" placeholder="Subject" class="textFiled"/>
							 <form:errors path="Subject"/>
						</div>
						<div class="clearfix"> </div>
						<form:textarea path="message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" class="textFiled" placeholder="Message..."/>
						<form:errors path="message"/>
						<input type="submit" value="Submit">
						<input type="reset" value="Clear">
					</form:form>
				</div>
				<div class="col-md-5 contact-left">
					<h5>Contact Info</h5>
					<div class="visit">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-home" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Visit us</h4>
							<p>Titanic Restaruant, Nelliyady, jaffna</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="mail-us">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-envelope" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Mail us</h4>
							<p><a href="mailto:info@example.com">info@titanic.com</a></p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="call">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-phone" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Call us</h4>
							<p>021-226 2323</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="visit">
						<div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
							<span class="fa fa-clock-o" aria-hidden="true"></span>
						</div>
						<div class="col-md-10 col-sm-10 col-xs-10 contact-text">
							<h4>Work hours</h4>
							<table>
								<tbody>
									<tr><td><p>Monday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
									<tr><td><p>Tuesday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
									<tr><td><p>Wednesday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
									<tr><td><p>Thursday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
									<tr><td><p>Friday</p></td><td> : </td><td><p>Closed</p></td></tr>							
									<tr><td><p>Saturday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
									<tr><td><p>Sunday</p></td><td> : </td><td><span style="color:#ffa41f;">07:00 AM - 11:00PM</span></td></tr>							
								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="map_w3layouts">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6147757.32442003!2d8.222917766116648!3d41.203578759977894!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12d4fe82448dd203%3A0xe22cf55c24635e6f!2sItaly!5e0!3m2!1sen!2sin!4v1512728449699"
				     style="border:0"></iframe>
			</div>
		</div>
	</div>

	<!-- Footer -->	
	<div class="copy">
		<p>&copy; 2018 Titanic. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts.</a></p>

	</div>
	<!--/footer -->



	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.2.3 -->
	<script src="<c:url value="/resources/dist/js/home/jquery-2.2.3.min.js" />"></script>
	
  	<!-- Validator -->
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
  	<script type="text/javascript" src="<c:url value="/resources/common/js/titanic.js" />"></script>
	
	<!--search-bar-->
	<script src="<c:url value="/resources/dist/js/home/main.js" />"></script>
	
	<!-- js for portfolio lightbox -->
	<script src="<c:url value="/resources/dist/js/home/jquery.chocolat.js" />"></script>
	
	<script type="text/javascript ">
		$(function () {
			$('.portfolio-grids a').Chocolat();
		});
	</script>
	<!-- /js for portfolio lightbox -->
	
	<!-- Calendar -->
	<link href="<c:url value="/resources/dist/css/home/jquery-ui.css" />" rel="stylesheet"> 
	<script src="<c:url value="/resources/dist/js/home/jquery-ui.js" />"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
		});
	</script>
	<!-- //Calendar -->

	<!-- time -->
	<script src="<c:url value="/resources/dist/js/home/wickedpicker.js" />"></script>
	<script type="text/javascript">
		$('.timepicker').wickedpicker({
			twentyFour: false
		});
	</script>
	<!-- //time -->

	<!-- script for responsive slides -->
	<script src="<c:url value="/resources/dist/js/home/responsiveslides.min.js" />"></script>
	<script>
		$(function () {
			$("#slider4").responsiveSlides({
				auto: true,
				pager: true,
				nav: true,
				speed: 1000,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!-- //script for responsive tabs -->
	
	<!-- script for responsive tabs -->
	<script src="<c:url value="/resources/dist/js/home/easy-responsive-tabs.js" />"></script>
	<script>
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true, // 100% fit in a container
				closed: 'accordion', // Start closed if in accordion view
				activate: function (event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type: 'vertical',
				width: 'auto',
				fit: true
			});
		});
	</script>
	<!--// script for responsive tabs -->
	
	<!-- start-smoth-scrolling -->
	<script src="<c:url value="/resources/dist/js/home/move-top.js" />"></script>
	<script src="<c:url value="/resources/dist/js/home/easing.js" />"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->

	<script type="text/javascript">
		$(document).ready(function () {
			/*
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});
			
			// Validator
// 			 $("#newFeedBack").validate();
// 	    	 validator();
		});
	</script>
	
	<!-- Top Hover button -->
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>


</body>