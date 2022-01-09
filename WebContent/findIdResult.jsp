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
    <title>Miss. - Find ID</title>

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
            <h2>Find Account</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

 <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Find ID</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                        	<c:choose>
                        		<c:when test = "${empty findId}">
                        			<div class = "form-group">
                        				<div style = "text-align:center;"><h6>고객님의 정보와 일치하는 아이디 정보가 없습니다.</h6></div>
                        			</div>
                        			<input type = "button" class="btn oneMusic-btn mt-30" onclick = "location.href='main.jsp'" value = "메인으로 돌아가기">
                        		</c:when>
                        		<c:otherwise>
                        			<form action="findPwPage.mem" method="post">
		                                <div class="form-group">
		                                    <label>고객님의 정보와 일치하는 아이디 목록입니다.</label>
		                                </div>
		                                <div class="form-group" style = "font-size: 18px;">
		                                	<input type = "radio" name ="result_id" value = "${findId}">&nbsp;&nbsp;${findId}
		                                </div>
										  
		                                <button type="submit" class="btn oneMusic-btn mt-30">비밀번호 찾기</button>
		                            </form>
                        		</c:otherwise>
                        	</c:choose>
<!--                             <form action="findPwPage.mem" method="post"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label>고객님의 정보와 일치하는 아이디 목록입니다.</label> -->
<!--                                 </div> -->
<!--                                 <div class="form-group" style = "font-size: 18px;"> -->
<%--                                 	<input type = "radio" name ="result_id" value = "${findId}">&nbsp;&nbsp;아이디 --%>
<!--                                 </div> -->
								  
<!--                                 <button type="submit" class="btn oneMusic-btn mt-30">비밀번호 찾기</button> -->
<!--                             </form> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
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
                            	<li><a href="sign_up.jsp">Sign_Up</a></li> <!-- 어드민사용자만이 접근가능하게 수정 -->
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