<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									<li><a href="shop.jsp">Albums</a></li>
									<li><a href="device.jsp">Device</a></li>
									<li><a href="notice.jsp">Notice</a></li>
									<li><a href="basket.jsp">Sign_Up</a></li>
									<!-- 어드민사용자만이 접근가능하게 수정 -->
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center">
									<!-- Login/Register -->
									<div class="login-register-btn mr-50">
										<a href="login.jsp" id="login">Login</a> / <a
											href="register.jsp" id="register">Register</a>
									</div>

									<!-- Cart Button -->
									<div class="cart-btn">
										<p>
											<span class="icon-shopping-cart"></span> <span
												class="quantity">1</span>
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
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>See what’s new</p>
			<h2>Register</h2>
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

							<h3 style="font-size: 30px;">상세페이지</h3>

							<form>

								<div class="mb-3">

									<label>제목</label> <input type="text" class="form-control"
										name="title" id="title" value="<%=data.getTitle()%>">

								</div>

								<div class="mb-3">

									<label>작성자</label> <input type="text" class="form-control"
										name="writer" id="writer" value="관리자" readonly>
								</div>

								<div class="mb-3">

									<label>내용</label>

									<textarea class="form-control" rows="10" name="content"
										id="content" value="<%=data.getContent()%>"></textarea>

								</div>

							</form>

							<div>
								<button type="button" class="btn btn-sm btn-primary"
									id="btnSave" onclick="location.href='notice.jsp'">돌아가기</button>

								<button type="button" class="btn btn-sm btn-primary"
									id="btnList" onclick="'">삭제</button>

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