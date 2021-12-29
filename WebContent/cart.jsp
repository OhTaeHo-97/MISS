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
    <title>Miss. - Cart</title>

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
                                    <li><a href="notice.jsp">Notice</a></li>
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
                                    <div class="cart-btn">
                                        <p><span class="icon-shopping-cart"> <a href="cart.jsp"></a></span><a href="cart.jsp"> <span class="quantity">1</span></a></p>
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
            <h2>cart</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Cart Area Start ##### -->
    <section class="login-area section-padding-100">
    
        <div class="container">
            <div class="row justify-content-center">

			<div class="ui items">
			<!-- for each구문으로 장바구니에 담겨있는만큼 출력필요 -->
			<c:choose>
				<c:when test = "${empty data}">
					<div style = "text-align:center;"><h6>로그인이 필요합니다!</h6></div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test = "${empty pvoData}">
							<div style = "text-align:center;"><h6>장바구니에 담긴 상품이 없습니다!</h6></div>
						</c:when>
						<c:otherwise>
							<c:forEach var = "pvo" items = "${pvoData}">
								<div class="item">
					    			<div class="ui small image">
					      				<img src="${pvo.product_pictureurl}">
					    			</div>
					  			    <div class="content">
					     			 <div class="header">${pvo.product_name}
					     			 <c:if test = "${pvo.product_category == 'music'}">
					     			 	&nbsp;&nbsp;- ${pvo.music_singer}
					     			 </c:if>
					     			 </div>
					   				 <div class="meta">
					      			 	<span class="price">${pvo.price}₩</span>
					   				 </div>
									 <div class="extra">
					        		 	<a href="deleteCart.do?deleteId=${pvo.product_id}"><i class="minus circle icon"></i></a>
					      			 </div>
					    		     </div>
					  			</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
<%-- 			<c:forEach var = "pvo" items = "pvoData"> --%>
<!-- 				<div class="item"> -->
<!-- 	    			<div class="ui small image"> -->
<!-- 	      				<img src="img/chance.jpg"> -->
<!-- 	    			</div> -->
<!-- 	  			    <div class="content"> -->
<%-- 	     			 <div class="header">${pvo.product_name} --%>
<%-- 	     			 <c:if test = "${pvo.product_category == 'music'}"> --%>
<%-- 	     			 	&nbsp;&nbsp;- ${pvo.music_singer} --%>
<%-- 	     			 </c:if> --%>
<!-- 	     			 </div> -->
<!-- 	   				 <div class="meta"> -->
<%-- 	      			 	<span class="price">${pvo.price}₩</span> --%>
<!-- 	   				 </div> -->
<!-- 					 <div class="extra"> -->
<!-- 	        		 	<a href="cart.jsp"><i class="minus circle icon"></i></a> -->
<!-- 	      			 </div> -->
<!-- 	    		     </div> -->
<!-- 	  			</div> -->
<%-- 			</c:forEach> --%>
<!--   			<div class="item"> -->
<!--     			<div class="ui small image"> -->
<!--       				<img src="img/chance.jpg"> -->
<!--     			</div> -->
<!--   			    <div class="content"> -->
<!--      			 <div class="header">chance the rapper - coloring book</div> -->
<!--    				 <div class="meta"> -->
<!--       			 	<span class="price">$1200</span> -->
<!--    				 </div> -->
<!-- 				 <div class="extra"> -->
<!--         		 	<a href="cart.jsp"><i class="minus circle icon"></i></a> -->
<!--       			 </div> -->
<!--     		     </div> -->
<!--   			</div> -->
<!--   			<div class="item"> -->
<!--     			<div class="ui small image"> -->
<!--       				<img src="img/1975.jpg"> -->
<!--     			</div> -->
<!--   			    <div class="content"> -->
<!--      			 <div class="header">The1975 - A Brief Inquiry into Online Relationships</div> -->
<!--    				 <div class="meta"> -->
<!--       			 	<span class="price">$1340</span> -->
<!--    				 </div> -->
<!-- 				 <div class="extra"> -->
<!--         		 	<a href="cart.jsp"><i class="minus circle icon"></i></a> -->
<!--       			 </div> -->
<!--     		     </div> -->
<!--   			</div> -->
<!--   			<div class="item"> -->
<!--     			<div class="ui small image"> -->
<!--       				<img src="img/lp.jpg"> -->
<!--     			</div> -->
<!--   			    <div class="content"> -->
<!--      			 <div class="header">LP Player Gadhouse x Honne</div> -->
<!--    				 <div class="meta"> -->
<!--       			 	<span class="price">$1840</span> -->
<!--    				 </div> -->
<!-- 				 <div class="extra"> -->
<!--         		 	<a href="cart.jsp"><i class="minus circle icon"></i></a> -->
<!--       			 </div> -->
<!--     		     </div> -->
<!--   			</div> -->
  			
			</div>
            </div>
            
        </div>
        
    </section>
    <!-- ##### Cart Area End ##### -->
            <div class="row">
                <div class="col-12">
                    <div class="load-more-btn text-center mt-70">
            <a href="payment.jsp" class="btn oneMusic-btn btn-2 m-2">ORDER<i class="fa fa-angle-double-right"></i></a>
                    <br><br>	
                    </div> 
                </div>
            </div>
	

	
	
	
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12">
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
