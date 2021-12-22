<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <li><a href="shop.jsp">Music</a></li>
                                    <li><a href="device.jsp">Device</a></li>
                                    <li><a href="notice.jsp">Notice</a></li>
                                    <li><a href="sign_up.jsp">Sign_Up</a></li> <!-- 어드민사용자만이 접근가능하게 수정 -->
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="#" id="login">Login</a> / <a href="register.jsp" id="register">Register</a>
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
		      <img src="img/chance.jpg">
		    </div>
		    <div class="content">
		      <div class="header">Chance the rapper - Coloring book</div>
		      <div class="meta">
		        <span class="price"><dl><dt>발매일/출시일<dt><dd>2018.09.13</dd></dl> </span> <br>
		        <span class="stay"><dl><dt>장르/device-비노출<dt><dd>랩/힙합</dd><dl/></span> <br>
		        <span class="price">$120</span>
		      </div>

		    </div>
		  </div>
		 </div>
		 
		<div class="ui buttons">
		<div class="ui labeled button" tabindex="0">
		  <div class="ui button">
		    <i class="heart icon"></i> Like
		  </div>
		  <a class="ui basic label">
		    2,048
		  </a>
		</div> 
		<div class="ui vertical animated button" tabindex="0">
		  <div class="hidden content">Cart</div>
		  <div class="visible content">
		    <i class="shop icon"></i>
		  </div>
		</div>
		</div>
		
		<h3 class="ui header">곡/제품 소개</h3>
		<p>미국 시카고 출신인 ‘Chance the Rapper’는 2012년 발표한 학창시절 경험을 담은 첫 멕스테이프 [10 Day]는 앨범으로, 미국 믹스테이프 사이트 ‘Datpiff’에 공개되어 40만 건 이상의 다운로드를 기록하였다. 첫 멕스테이프의 성공으로 대형 유통사와의 계약 체결을 할 수 있었지만, 스포티파이, 사운드 클라우드, 애플뮤직 등과 같은 무료 음원 스트리밍 사이트를 통해 팬들과 소통했으며 거대 자본의 통제에서 벗어나 오롯이 자신의 음악을 자유롭게 선보이고 있다.
본 작, [Coloring Book]은 믹스테이프만으로 활동하고 있는 래퍼 찬스 더 래퍼의 3번째 믹스테이프로 발매 1주일 만에 약 5억 명 이상이 스트리밍하면서 빌보드 앨범차트 8위를 차지하며 많은 사랑을 받았다. 특히, 카니예 웨스트의 싱글 ‘Mercy’를 피처링하면서 최고의 인기를 구가하고 있는 힙합 아티스트 ‘2 Chainz’와 싱글 ‘Lollipop’으로 힙합씬에 자신의 이름을 각인시킨 ‘Lil Wayne’이 피처링을 맡아 화제가 된 타이틀곡 ‘No Problem’은 장난스럽지만 활기찬 곡으로 리듬을 타면서 가볍게 들을 수 있으며 힙합 매니아들이 사랑하고 왜 그래미에 어울리는지 알 수 있는 곡입니다. 8번 트랙인 ‘Angels’에 자신이 현재 음악 시장과 같은 꿈을 꾸는 힙합 아티스트들에게 던지는 ‘Chance the rapper’의 신념이 고스란히 담겨있다. 2017년 ‘Chance the Rapper’를 최고의 뮤지션으로 만든 믹스테이프 [Coloring Book]</p>
	<div class="ui hidden divider"></div><br>
	<div class="ui comments">
  	<h3 class="ui dividing header">댓글</h3>
		
		  <div class="ui comments">
			  <div class="comment">
			    <div class="content">
			      <a class="author">Ohtaeho</a>
			      <div class="metadata">
			        <div class="date">1 day ago</div>
			      </div>
			      <div class="text">
			        <p>The hours, minutes and seconds stand as visible reminders that your effort put them all there.
			        Preserve until your next run, when the watch lets you see how Impermanent your efforts are.</p>
			      </div>
			      <div class="actions">
			      	<a class="deleteR">delete</a>
			      </div>
			    </div>
			  </div>
			  <div class="comment">
			    <div class="content">
			      <a class="author">Jeonghyeongyu</a>
			      <div class="metadata">
			        <div class="date">2 days ago</div>
			      </div>
			      <div class="text">
			        I re-tweeted this.
			      </div>
			      <div class="actions">
			      	<a class="deleteR">delete</a>
			      </div>
			    </div>
			  </div>
			  <form class="ui reply form">
			    <div class="field">
			      <textarea></textarea>
			    </div>
			    <a href="product.jsp">
			    <div class="ui primary submit labeled icon button">
			      <i class="icon edit"></i> Add Comment
			    </div>
			    </a>
			  </form>
			</div>
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

