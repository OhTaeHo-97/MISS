<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "mytag" tagdir = "/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Miss. - Set Account</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
		<script
 		 src="https://code.jquery.com/jquery-3.1.1.min.js"
  		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  		crossorigin="anonymous"></script>
	<script src="semantic/dist/semantic.min.js"></script>
	<script src = "js/logout.js"></script>

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="main.jsp" class="nav-brand"><img src="img/5.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="set_music_filter.do">Music</a></li>
                                    <li><a href="set_device_filter.do">Device</a></li>
                                    <li><a href="boardPage.board">Notice</a></li>
                                    <c:if test = "${auth == 'Y'}">
                                    	<li><a href="sign_up.jsp">Sign_Up</a></li> <!-- ???????????????????????? ?????????????????? ?????? -->
                                    </c:if>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <mytag:login/>
                                    </div>

                                    <!-- Cart Button -->
                                     <div class="cart-btn" onclick = "location.href='cartPage.do'">
                                        <p><span class="icon-shopping-cart"></span><a href="cartPage.do">
                                        	<span class="quantity">
	                                        	<c:set var = "cart_num" value = "0" />
	                                        	<c:forEach var = "pvo" items = "${cartData}">
	                                        		<c:set var = "cart_num" value = "${cart_num + 1}" />
	                                        	</c:forEach>
	                                        	${cart_num}
                                        	</span>
                                        </a><!-- <a href="cart.jsp"> <span class="quantity">1</span></a></p> -->
                                       </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what???s new</p>
            <h2>Account</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-9">

                    <!-- Single -->
     <h2 class="ui header">
  Account Settings
  <div class="sub header">Manage your account settings and set e-mail preferences.</div>
</h2>               
<form class="ui form" action = "account.mem" method = "POST">
<input type = "hidden" name = "member_id" id = "member_id" value = "${data.member_id}">
<div class="ui form">

  <!-- ??? ?????????????????? --> 
  	<div class="required field">
    	<label>Confirm Password</label>
    	<input type="password" name = "member_pw" id = "member_pw" placeholder="??????????????? ??????????????????.">
  	</div>	
  	<input type = "submit" class="ui primary button" value = "confirm">
	
     <!--  ???????????? ?????? ????????? (?????? ??????????????? ????????? ??????????????? ?????????????????? ???????????????)
  <div class="two fields">
    <div class="required field">
     	 <label>New password</label>
     	 <input type="password">
    </div>
   	<div class="field">
     	 <label>Confirm password</label>
     	<input type="password">
    </div>
  </div>
	<div class="required field">
    	<label>Phone Number</label>
    	<input type="text" placeholder="Write it including -">
  	</div>
    <div class="required field">
    	<label>Nickname</label>
    	<input type="text">
  	</div>
  	<div class="field">
    	<label>E-mail</label>
    	<input type="email" placeholder="oscar2272@naver.com">
  	</div>
  	<div class="field">
    	<label>Billing Address</label>
    	<input type="text" placeholder="Street Address">
  	</div>
  	<button class="ui secondary button">
  		save changes
	</button>  -->  
</div> 

</form>

                    <!-- Single -->
 
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <p>See what???s new</p>
                        <h2>Get In Touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn oneMusic-btn mt-30" type="submit">Send <i class="fa fa-angle-double-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/2.png" alt=""></a>

                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This website is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Miss</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
                <div class="col-12 col-md-6">
                    <div class="footer-nav">
						<ul>
                            <li><a href="set_music_filter.do">Music</a></li>
                            <li><a href="set_device_filter.do">Device</a></li>
                            <li><a href="boardPage.board">Notice</a></li>
                            <c:if test = "${auth == 'Y'}">
                            	<li><a href="sign_up.jsp">Sign_Up</a></li> <!-- ???????????????????????? ?????????????????? ?????? -->
                            </c:if>
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <div class="ui icon buttons">
			                    <button class="ui black button" onclick="location.href='https://www.instagram.com/'">
			                    	<i class="instagram icon" style="user-select: auto;"></i>
			                    </button>		
			                    <button class="ui black button" onclick="location.href='https://www.youtube.com/'">
			                    	<i class="youtube square icon" style="user-select: auto;"></i>
			                    </button>				                    			                    
			                    <button class="ui black button" onclick="location.href='https://www.facebook.com/'">
			                    	<i class="facebook icon" style="user-select: auto;"></i>
			                    </button>			                    
				            	</div>        
				            </li>                   
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </footer>

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>
