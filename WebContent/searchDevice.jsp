<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "mytag" tagdir = "/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Miss. - Music</title>

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
	<script src="js/searchDevice.js"></script>
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
            <p>See what’s miss</p>
            <h2>Device</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
	<!-- ##### Shop Content Area Start ##### -->
     <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                    
						<div class="ui sizer vertical segment">
						 	 <div class="ui medium header">'device'에 대한 검색 결과 입니다.</div>
						 </div>
					
						<div class="ui secondary big menu">
						    <div class="item">
						      <div class="ui icon input">
						        <input type="text" id = "searchTitle" placeholder="Search...">
						        <i class="search link icon" onclick = "searchDevice()"></i>
						      </div>
						    </div>
						</div>
                    </div>
                </div>
            </div>

				
    <!-- ##### Buy Now Area Start ##### -->
    <div class="oneMusic-buy-now-area mb-100">
        <div class="container">
        	<c:choose>
        		<c:when test = "${empty searchDatas}">
        			검색 결과가 없습니다.
        		</c:when>
        		<c:otherwise>
        			<div class="row">
					<c:forEach var = "data" items = "${searchDatas}">
						<div class="col-12 col-sm-6 col-md-3">
	                    <div class="single-album-area">
	                    <a href="detail.do?productid=${data.product_id}">
	                        <div class="album-thumb">
	                            <img src="${data.product_pictureurl}" alt="${data.product_name}">
	                            <!-- Album Price -->
	                            <div class="album-price">
	                                <p>${data.price}₩</p>
	                            </div>
	                            <!-- Play Icon -->
	                            <div class="play-icon">
	<!--                                 <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a> -->
	                            </div>
	                        </div>
	                        <div class="album-info">
	                                <h5>${data.product_name}</h5>
	                        </div>
	                       </a>
	                    </div>
	                </div>
					</c:forEach>
					</div>

		            <div class="row">
		                <div class="col-12">
		                    <div class="load-more-btn text-center">
		                        <a href="titleSearch.do?category=device&titleInput=${titleInput}&search_cnt=${search_cnt + 4}" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
		                    </div>
		                </div>
		            </div>
        		</c:otherwise>
        	</c:choose>
<!--             <div class="row"> -->
<%-- 				<c:forEach var = "data" items = "${searchDatas}"> --%>
<!-- 					<div class="col-12 col-sm-6 col-md-3"> -->
<!--                     <div class="single-album-area"> -->
<%--                     <a href="detail.do?productid=${data.product_id}"> --%>
<!--                         <div class="album-thumb"> -->
<%--                             <img src="${data.product_pictureurl}" alt="${data.product_name}"> --%>
<!--                             Album Price -->
<!--                             <div class="album-price"> -->
<%--                                 <p>${data.price}₩</p> --%>
<!--                             </div> -->
<!--                             Play Icon -->
<!--                             <div class="play-icon"> -->
<!-- <!--                                 <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a> --> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="album-info"> -->
<%--                                 <h5>${data.product_name}</h5> --%>
<!--                         </div> -->
<!--                        </a> -->
<!--                     </div> -->
<!--                 </div> -->
<%-- 				</c:forEach> --%>
                <!-- Single Album Area -->
<!--                 <div class="col-12 col-sm-6 col-md-3"> -->
<!--                     <div class="single-album-area"> -->
<!--                         <div class="album-thumb"> -->
<!--                             <img src="img/bg-img/b1.jpg" alt=""> -->
<!--                             Album Price -->
<!--                             <div class="album-price"> -->
<!--                                 <p>$0.90</p> -->
<!--                             </div> -->
<!--                             Play Icon -->
<!--                             <div class="play-icon"> -->
<!--                                 <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="album-info"> -->
<!--                             <a href="#"> -->
<!--                                 <h5>Garage Band</h5> -->
<!--                             </a> -->
<!--                             <p>Radio Station</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Album Area -->
<!--                 <div class="col-12 col-sm-6 col-md-3"> -->
<!--                     <div class="single-album-area"> -->
<!--                         <div class="album-thumb"> -->
<!--                             <img src="img/bg-img/b2.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="album-info"> -->
<!--                             <a href="#"> -->
<!--                                 <h5>Noises</h5> -->
<!--                             </a> -->
<!--                             <p>Buble Gum</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Album Area -->
<!--                 <div class="col-12 col-sm-6 col-md-3"> -->
<!--                     <div class="single-album-area"> -->
<!--                         <div class="album-thumb"> -->
<!--                             <img src="img/bg-img/b3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="album-info"> -->
<!--                             <a href="#"> -->
<!--                                 <h5>Jess Parker</h5> -->
<!--                             </a> -->
<!--                             <p>The Album</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 Single Album Area -->
<!--                 <div class="col-12 col-sm-6 col-md-3"> -->
<!--                     <div class="single-album-area"> -->
<!--                         <div class="album-thumb"> -->
<!--                             <img src="img/bg-img/b4.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="album-info"> -->
<!--                             <a href="#"> -->
<!--                                 <h5>Noises</h5> -->
<!--                             </a> -->
<!--                             <p>Buble Gum</p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->

<!--             <div class="row"> -->
<!--                 <div class="col-12"> -->
<!--                     <div class="load-more-btn text-center"> -->
<%--                         <a href="titleSearch.do?category=device&titleInput=${titleInput}&search_cnt=${search_cnt + 4}" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
        </div>
    </div>
    <!-- ##### Buy Now Area End ##### -->



            

	</div>
    </section>
      <!-- ##### shop content Area End ##### -->

    <!-- ##### Newsletter & Testimonials Area Start ##### -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                <!-- Newsletter Area -->
                <div class="col-12 col-lg-6">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>See what’s new</p>
                            <h2>Subscribe to newsletter</h2>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="search" name="search" id="newsletterSearch" placeholder="E-mail">
                                <button type="submit" class="btn oneMusic-btn">Subscribe <i class="fa fa-angle-double-right"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Testimonials Area -->
                <div class="col-12 col-lg-6">
                    <div class="testimonials-area mb-100 bg-img bg-overlay" style="background-image: url(img/bg-img/bg-3.jpg);">
                        <div class="section-heading white text-left mb-50">
                            <p>See what’s new</p>
                            <h2>Testimonial</h2>
                        </div>
                        <!-- Testimonial Slide -->
                        <div class="testimonials-slide owl-carousel">
                            <!-- Single Slide -->
                            <div class="single-slide">
                                <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi, ac cursus odio. Vivamus nibh velit, rutrum.</p>
                                <div class="testimonial-info d-flex align-items-center">
                                    <div class="testimonial-thumb">
                                        <img src="img/bg-img/t1.jpg" alt="">
                                    </div>
                                    <p>William Smith, Customer</p>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide">
                                <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi, ac cursus odio. Vivamus nibh velit, rutrum.</p>
                                <div class="testimonial-info d-flex align-items-center">
                                    <div class="testimonial-thumb">
                                        <img src="img/bg-img/t1.jpg" alt="">
                                    </div>
                                    <p>Nazrul Islam, Developer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Newsletter & Testimonials Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <p>See what’s new</p>
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
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
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