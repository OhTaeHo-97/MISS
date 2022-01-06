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
    <title>Admin - sign up for Product</title>

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
                        <a href="main.jsp" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

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
                                    	<li><a href="sign_up.jsp">Sign_Up</a></li> <!-- 어드민사용자만이 접근가능하게 수정 -->
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
            <p>See what’s new</p>
            <h2>Upload</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    <!--  제품등록 시작 -->

    <section class="events-area section-padding-100">
    	<form name = "signUpForm" name = "signUpForm" action = "insertProduct.do" method = "POST">
        <div class="container">	
		<h4 class="ui horizontal divider header">
		  <i class="tag icon"></i>
		  Description
		</h4>
		<p>This page is where admin registers the product.</p>
		<h4 class="ui horizontal divider header">
		  <i class="upload icon"></i>
		  Sign_up
		</h4>
			<table class="ui definition table">
			  <tbody>
			    <tr>
			      <td>Category</td>
			      <td><input type="radio" id = "category" name="category" checked="checked" value = "music">Music
			      <input type="radio" name="category" id = "category" value = "device">Device</td>
			    </tr>
			    <tr>
			      <td>Image</td>
			      <td><input type="file" id="image" name="image" accept=".jpg, .jpeg, .png" onchange="this.select(); document.getElementById('file_path').value=document.selection.createRange().text.toString();"></td>
			    </tr>
			    <tr>
			      <td>Product_Name(Song)</td>
			      <td><input type="text" name = "pname" id = "pname" value="finish line"></td>
			    </tr>
			    <tr>
			      <td>Singer</td>
			      <td><input type="text" name = "singer" id = "singer" value="chance the rapper"></td>
			    </tr>
			    <tr>
			      <td>Genre</td>
			      <td>
<!-- 			      	<input type="text" value="랩/힙합" required> -->
					<select name = "genre" class="ui dropdown item">
						<option value = "ballad">발라드</option>
						<option value = "dance">댄스</option>
						<option value = "rap">랩/힙합</option>
						<option value = "rb">R&B/Soul</option>
						<option value = "indie">인디음악</option>
						<option value = "rock">록/메탈</option>
						<option value = "trot">트로트</option>
						<option value = "fork">포크/블루스</option>
					</select>
			      </td>
			    </tr>
			    <tr>
			      <td>Price</td>
			      <td><input type="text" name = "price" id = "price" value="120">₩</td>
			    </tr>
			    <tr>
			      <td>Stock</td>
			      <td><input type="text" name = "stock" id = "stock" value="992"></td>
			    </tr>
			    <tr>
			      <td>Introduce Product(song)</td>
			      <td><textarea name = "comment" placeholder = "제품소개 및 곡소개" cols = "100" rows = "10" style = "resize: none;"></textarea><!-- <input type="textarea" value="제품소개 및 곡소개"> --></td>
			    </tr>
			  </tbody>
			</table>
<!-- 			<input type = "submit" class="positive ui button" value = "Sign Up"> -->
			<input type = "submit" class="positive ui button" value = "Sign Up">
			</div>
		</form>
	   </section>
    

<!--  제품등록 끝 -->
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Music</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

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
