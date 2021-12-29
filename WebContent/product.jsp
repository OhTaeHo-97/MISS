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
    <title>Miss. - Detail</title>

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
	<script type="text/javascript" src="js/productPage.js"></script> 
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
            <h2>Detail</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
	
    <section class="events-area section-padding-100">
    <div class="container">

    	<div class="ui items">
		  <div class="item">
		    <div class="ui medium image">
		      <img src="${product.product_pictureurl}" alt = "${product.product_name}">
		    </div>
		    <div class="content">
		      <div class="header">${product.product_name}
		      <c:if test = "${product.product_category == 'music'}">
		      	&nbsp;&nbsp;- ${product.music_singer}
		      </c:if>
		      </div>
		      <div class="meta">
<!-- 		        <span class="price"><dl><dt>발매일/출시일<dt><dd>2018.09.13</dd></dl> </span> <br> -->
		        <span class="stay">
	        		<c:if test = "${product.product_category == 'music'}">
	        			<dl><dt>장르</dt><dd>${product.music_genre}</dd></dl>
	        		</c:if>
		        </span> <br>
		        <span class="price">${product.price}₩</span>
		      </div>

		    </div>
		  </div>
		 </div>
		 
		<div class="ui buttons">
		<div class="ui labeled button" tabindex="0">
			<c:choose>
				<c:when test = "${empty data}">
					<div class="ui button" onClick = "noIdFav()">
			  			<i class="heart icon"></i> Like
			  		</div>
			  		<a class="ui basic label">
			    		${product.favorite_count}
			  		</a>
				</c:when>
				<c:otherwise>
					<div class="ui button" onClick = "location.href = 'fav.do?productId=${product.product_id}'">
				  		<i class="heart icon"></i> Like
				  	</div>
				  	<a class="ui basic label">
				    	${product.favorite_count}
				 	</a>
				</c:otherwise>
			</c:choose>
<%-- 			<c:if test = "${not empty product}"> --%>
<%-- 				<div class="ui button" onclick = "location.href = 'fav.do?productId=${product.product_id}'"> --%>
<!-- 			  		<i class="heart icon"></i> Like -->
<!-- 			  	</div> -->
<!-- 			  	<a class="ui basic label"> -->
<%-- 			    	${product.favorite_count} --%>
<!-- 			 	</a> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test = "${empty product}"> --%>
<!-- 				<div class="ui button" onclick = "noIdFav()"> -->
<!-- 		  			<i class="heart icon"></i> Like -->
<!-- 		  		</div> -->
<!-- 		  		<a class="ui basic label"> -->
<%-- 		    		${product.favorite_count} --%>
<!-- 		  		</a> -->
<%-- 			</c:if> --%>
<%-- 		  <div class="ui button" onclick = "location.href = 'fav.do?productId=${product.product_id}'"> --%>
<!-- 		  	<i class="heart icon"></i> Like -->
<!-- 		  </div> -->
<!-- 		  <a class="ui basic label"> -->
<%-- 		    ${product.favorite_count} --%>
<!-- 		  </a> -->
		</div>
		<c:choose>
			<c:when test = "${empty data}">
			<div class="ui vertical animated button" tabindex="0" onClick = "noIdCart()">
	 		<div class="hidden content">Cart</div>
	 			<div class="visible content">
	    			<i class="shop icon"></i>
	  			</div>
			</div>
			</c:when>
			<c:otherwise>
				<div class="ui vertical animated button" tabindex="0" onClick = "location.href = 'insertCart.do?productId=${product.product_id}'">
	 			<div class="hidden content">Cart</div>
	 				<div class="visible content">
	    				<i class="shop icon"></i>
	  				</div>
				</div>
			</c:otherwise>
		</c:choose>
<%-- 		<div class="ui vertical animated button" tabindex="0" onclick = "location.href = 'insertCart.do?productId=${product.product_id}'"> --%>
<!-- 		  <div class="hidden content">Cart</div> -->
<!-- 		  <div class="visible content"> -->
<!-- 		    <i class="shop icon"></i> -->
<!-- 		  </div> -->
<!-- 		</div> -->
		</div>
		
		<h3 class="ui header">곡/제품 소개</h3>
		<p>${product.product_comment}</p>
	<div class="ui hidden divider"></div><br>
	<div class="ui comments">
  	<h3 class="ui dividing header">댓글</h3>
  	<form class="ui reply form" id = "replyForm" name = "replyForm" action = "insertReview.do" method = "POST">
  	<input type = "hidden" name = "productId" value = "${product.product_id}">
  	<input type = "hidden" name = "userNickname" value = "${data.nickname}">
  	<div class="ui comments">
		<c:forEach var = "rvo" items = "${replies}">
			<div class="comment">
			    <div class="content">
			      <a class="author">${rvo.nickname}</a>
			      <div class="metadata">
			        <div class="date">${rvo.review_date}</div>
			      </div>
			      <div class="text">
			        <p>${rvo.review_content}</p>
			      </div>
			      <div class="actions">
			      	<c:if test = "${rvo.nickname == data.nickname}">
			      		<a href = "deleteReview.do?productId=${product.product_id}&reviewId=${rvo.review_id}" class="deleteR">delete</a>
			      	</c:if>
			      	<c:if test = "${auth == 'Y'}">
			      		<a href = "deleteReview.do?productId=${product.product_id}&reviewId=${rvo.review_id}" class="deleteR">delete</a>
			      	</c:if>
			      </div>
			    </div>
			  </div>
		</c:forEach>
	</div>
<!-- 	<form class="ui reply form"> -->
		<div class="field">
			<textarea name = "replyContent" placeholder = "댓글을 입력하세요." cols = "100" rows = "3" style = "resize: none;"></textarea>
		</div>
		<div class="ui primary submit labeled icon button" onClick = "document.forms['replyForm'].submit()">
			<i class="icon edit"></i> Add Comment
		</div>
  	</form>
<!-- 		  <div class="ui comments"> -->
<!-- 			  <div class="comment"> -->
<!-- 			    <div class="content"> -->
<!-- 			      <a class="author">Ohtaeho</a> -->
<!-- 			      <div class="metadata"> -->
<!-- 			        <div class="date">1 day ago</div> -->
<!-- 			      </div> -->
<!-- 			      <div class="text"> -->
<!-- 			        <p>The hours, minutes and seconds stand as visible reminders that your effort put them all there. -->
<!-- 			        Preserve until your next run, when the watch lets you see how Impermanent your efforts are.</p> -->
<!-- 			      </div> -->
<!-- 			      <div class="actions"> -->
<!-- 			      	<a class="deleteR">delete</a> -->
<!-- 			      </div> -->
<!-- 			    </div> -->
<!-- 			  </div> -->
<!-- 			  <div class="comment"> -->
<!-- 			    <div class="content"> -->
<!-- 			      <a class="author">Jeonghyeongyu</a> -->
<!-- 			      <div class="metadata"> -->
<!-- 			        <div class="date">2 days ago</div> -->
<!-- 			      </div> -->
<!-- 			      <div class="text"> -->
<!-- 			        I re-tweeted this. -->
<!-- 			      </div> -->
<!-- 			      <div class="actions"> -->
<!-- 			      	<a class="deleteR">delete</a> -->
<!-- 			      </div> -->
<!-- 			    </div> -->
<!-- 			  </div> -->
<!-- 			  <form class="ui reply form"> -->
<!-- 			    <div class="field"> -->
<!-- 			      <textarea name = "replyContent" placeholder = "댓글을 입력하세요." cols = "100" rows = "3" style = "resize: none;"></textarea> -->
<!-- 			    </div> -->
<!-- 			    <a href="product.jsp"> -->
<!-- 			    <div class="ui primary submit labeled icon button"> -->
<!-- 			      <i class="icon edit"></i> Add Comment -->
<!-- 			    </div> -->
<!-- 			    </a> -->
<!-- 			  </form> -->
<!-- 			</div> -->
	</div>
	
	</div>
    </section>


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