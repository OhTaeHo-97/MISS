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
    <title>Miss. - Notice</title>

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
	<style type="text/css">
		table.type09 {
		  border-collapse: collapse;
		  text-align: left;
		  line-height: 1.5;
		
		}
		table.type09 thead th {
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  color: #000000;
		  border-bottom: 3px solid #000000;
		}
		table.type09 tbody th {
		  width: 150px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 350px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px solid #ccc;
		}
	</style>
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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Notice</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0">
    	<div class = "container">
    	<div style = "width:100%; margin: 0 auto; border-top: 2px solid black;">
    	<ul style = "list-style:none;">
    			<a href = "#" style = "color:black; line-height: 3rem;">
    			<li style = "background-image:url('img/arrow.png') !important; box-sizing:border-box !important; background-size:10px !important; background-repeat: no-repeat; background-position: 98% 50%; height:5rem; border-bottom: 1px solid black; padding: 10px;">
	    			<span style = "font-size: 1.6rem; padding: 0.5rem;">1</span>
	    			<span style = "font-size: 1.6rem; padding: 0.5rem 3rem;">타이틀</span>
    			</li>
	    	</a>
    	</ul>
    	</div>
    	</div>
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!-- 				<div> -->

<!-- 					Single -->
<!-- 					<article> -->
<!-- 						<div class="container"> -->
<!-- 							<table class="type09" style="margin: auto;"> -->
<!-- 								<thead> -->
<!-- 									<tr> -->
<!-- 										<th style="padding: 0 20px 0 20px; ">No.</th> -->
<!-- 										<th style="padding: 0 300px 0 300px; ">Title.</th> -->
<!-- 										<th style="padding: 0 20px 0 20px; ">Date.</th> -->
<!-- 									</tr> -->
<!-- 								</thead> -->
<!-- 								<tbody> -->
<%-- 									<c:forEach items="${datas}" var="bvo">								 --%>
<!-- 										<tr> -->
<%-- 											<th><a href="">${bvo.board_id}</a></td>  --%>
<%-- 											<td><a href="">${bvo.title}</a></td> --%>
<%-- 											<td><a href="">${bvo.writedate}</a></td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
<!-- 									아직 BoardFrontController가 안만들어진 상태맞나요?? -->
<!-- 								</tbody> -->
<!-- 							</table> -->
							
<!-- 						</div> -->
<!-- 					</article> -->
<%-- 					<a href="~~~.do?board_cnt=${board_cnt + 5}" >More</a> --%>
<!-- 					<br> -->
<%-- 					<c:if test="${auth == 'Y'}"> --%>
<!-- 						<ul class="actions"> -->
<!-- 							<li><a href="notice_write.jsp" class="button" -->
<!-- 								style="margin: 0 0 0 980px;">Write Board</a></li> -->
<!-- 						</ul>			 -->
<%-- 					</c:if>	 --%>
<!-- 					Single -->

<!-- 				</div> -->
<!--                 <div class="col-12 col-lg-3">
<!--                     <div class="contact-content mb-100"> -->
<!--                         Title -->
<!--                         <div class="contact-title mb-50"> -->
<!--                             <h5>Contact Info</h5> -->
<!--                         </div> -->

<!--                         Single Contact Info -->
<!--                         <div class="single-contact-info d-flex align-items-center"> -->
<!--                             <div class="icon mr-30"> -->
<!--                                 <span class="icon-placeholder"></span> -->
<!--                             </div> -->
<!--                             <p>1481 Creekside Lane Avila Beach, CA 931</p> -->
<!--                         </div> -->

<!--                         Single Contact Info -->
<!--                         <div class="single-contact-info d-flex align-items-center"> -->
<!--                             <div class="icon mr-30"> -->
<!--                                 <span class="icon-smartphone"></span> -->
<!--                             </div> -->
<!--                             <p>+53 345 7953 32453</p> -->
<!--                         </div> -->

<!--                         Single Contact Info -->
<!--                         <div class="single-contact-info d-flex align-items-center"> -->
<!--                             <div class="icon mr-30"> -->
<!--                                 <span class="icon-mail"></span> -->
<!--                             </div> -->
<!--                             <p>yourmail@gmail.com</p> -->
<!--                         </div> -->

<!--                         Contact Social Info -->
<!--                         <div class="contact-social-info mt-50"> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Behance"><i class="fa fa-behance" aria-hidden="true"></i></a> -->
<!--                             <a href="#" data-toggle="tooltip" data-placement="top" title="Linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                 </div> --> -->

<!--                 <div class="col-12 col-lg-9">
<!--                     ##### Google Maps ##### -->
<!--                     <div class="map-area mb-100"> -->
<!--                         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22236.40558254599!2d-118.25292394686001!3d34.057682914027104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2z4Kay4Ka4IOCmj-CmnuCnjeCmnOCnh-CmsuCnh-CmuCwg4KaV4KeN4Kav4Ka-4Kay4Ka_4Kar4KeL4Kaw4KeN4Kao4Ka_4Kav4Ka84Ka-LCDgpq7gpr7gprDgp43gppXgpr_gpqgg4Kav4KeB4KaV4KeN4Kak4Kaw4Ka-4Ka34KeN4Kaf4KeN4Kaw!5e0!3m2!1sbn!2sbd!4v1532328708137" allowfullscreen></iframe> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->
    </section>
    <!-- ##### Contact Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-0-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
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