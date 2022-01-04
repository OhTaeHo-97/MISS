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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Music - Register</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript">
	function del() {
		confirm("내용은 복구되지않습니다. 정말 삭제하시겠습니까?");
		if (ans == true) {
			document.formA.action.value = "delete";
			document.formA.submit();
		} else {
			return;
		}
	}
</script>
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
						<a href="main.jsp" class="nav-brand"><img
							src="img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
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
                                    <div class="cart-btn" onclick = "location.href='cartPage.do'">
                                        <p><span class="icon-shopping-cart"></span><a href="cartPage.do"><span class="quantity">1</span></a><!-- <a href="cart.jsp"> <span class="quantity">1</span></a></p> -->
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
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>See what’s new</p>
			<h2>Board</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Blog Area Start ##### -->
	<div class="blog-area section-padding-100">
		<div class="containers">
			<div class="ro...........w">
				<div>

					<!-- Single -->

					<article>

						<div class="container" role="main">
							<label style="font-size: 30px;">Board</label>
							<hr>
							<form>

								<div class="mb-3">
								<label style="font-size: 20px;">Title. | ${data.title}</label>
								<h5>21.12.31 ${data.wirtedate}</h5>

								</div>

								
								<hr>
								
								<div class="mb-3">

									<label style="font-size: 15px;">Content.</label>
									<p>${data.board_content} 로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.로렘 입숨은 영어에서 사용하는 문자들의 전형적인 분포에 근접하다고도 하는데, 이 점 때문에 프레젠테이션으로 초점을 이동하는 데에도 도움을 준다</p>
									

								</div>
								<hr>
							</form>

							<div>
								<a class="ui left floated button" href="notice.jsp"><i class="arrow left icon"></i></a>
								<c:if test="${auth == 'Y'}">
									<a class="ui right floated button" href="delete.do?bid=${data.bid}">삭제</a>
									<a class="ui right floated button" href="delete.do?bid=${data.bid}">수정</a>
								</c:if>

							</div>

						</div>

					</article>

					<!-- Single -->

				</div>
			</div>
		</div>
	</div>
	<!-- ##### Blog Area End ##### -->

	<!-- ##### Contact Area Start ##### -->
	<section
		class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
		style="background-image: url(img/bg-img/bg-2.jpg);">
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
								<div class="col-lg-4">
									<div class="form-group">
										<input type="text" class="form-control" id="name"
											placeholder="Name">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<input type="email" class="form-control" id="email"
											placeholder="E-mail">
									</div>
								</div>

								<div class="col-12">
									<div class="form-group">
										<textarea name="message" class="form-control" id="message"
											cols="50" rows="10" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-12 text-center">
									<button class="btn oneMusic-btn mt-30" type="submit">
										Send <i class="fa fa-angle-double-right"></i>
									</button>
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
					<p class="copywrite-text">
						<a href="#"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

				<div class="col-12 col-md-6">
					<div class="footer-nav">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Albums</a></li>
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