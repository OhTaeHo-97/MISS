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
	<script src = "js/registCheck.js"></script>
	<script src="https://cdn.tailwindcss.com/"></script>
	<script src = "js/logout.js"></script>
	<script>
		<c:if test = "${isDelete == true}">
			alert("공지사항 삭제를 성공하였습니다!");
		</c:if>
		<c:if test = "${isInsert == true}">
			alert("공지사항 등록을 성공하였습니다!");
		</c:if>
		<c:if test = "${isEdit == true}">
			alert("공지사항 수정을 성공하였습니다!");
		</c:if>
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
            <h2>Notice</h2>
        </div>
    </section>
 <!-- ##### notice Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                      <!-- Single -->
                    <!-- This example requires Tailwind CSS v2.0+ -->
<h2 class="ui header">
  <i class="info circle icon"></i>
  <div class="content">
  
  </div>
</h2>
<hr><br>

	<div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
		<div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
			<table class="min-w-full divide-y divide-gray-200">
 				<thead class="bg-gray-50">
            		<tr>
              			<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                			Num
              			</th>
              			<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
		                	Title
						</th>
						<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
							Date
						</th>
		              	<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
		                	Role
		              	</th>
		              	<th scope="col" class="relative px-6 py-3">
		                	<span class="sr-only">Edit</span>
		              	</th>
            		</tr>
          		</thead>
				<tbody class="bg-white divide-y divide-gray-200">
      <!-- 반복부분 -->
      			<c:set var = "count" value = "${board_count - ((board_page - 1) * 8)}" />
      			<c:forEach var = "bvo" items = "${board_datas}">
      				<tr>
	              		<td class="px-6 py-4 whitespace-nowrap">
	                		<div class="flex items-center">
	                    		<div class="text-sm font-medium text-gray-900">
									<div class="text-sm text-gray-900">${count}</div>
									<c:set var = "count" value = "${count - 1}" />
	                    		</div>
	                		</div>
	              		</td>
	              		<td class="px-6 py-4 whitespace-nowrap" style = "cursor:pointer;" onclick="location.href='boardDetail.board?bid=${bvo.board_id}'">
	                		<div class="text-sm text-gray-900">${bvo.title}</div>
	              		</td>
	              		<td class="px-6 py-4 whitespace-nowrap">
	                		<span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
	                  			${bvo.writedate}
	                		</span>
	              		</td>
	              		<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
	                		Admin
	              		</td>
	              		<td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
	              			<c:if test = "${auth == 'Y'}">
	              				<a href="boardDelete.board?bid=${bvo.board_id}" class="text-indigo-600 hover:text-indigo-900">Delete</a>
	              			</c:if>
	              		</td>
	              	</tr>
      			</c:forEach>

            <!-- More people... -->
          </tbody>
        </table>
      </div>
    </div>
    
    
      <!-- This example requires Tailwind CSS v2.0+ -->
<div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
  <div class="flex-1 flex justify-between sm:hidden">
    <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
      Previous
    </a>
    <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
      Next
    </a>
  </div>
  <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
    <div>
      <p class="text-sm text-gray-700">
      <c:if test = "${auth == 'Y'}">
      	<button type="button" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" onclick = "location.href='noticeWrite.jsp'">
	        <!-- Heroicon name: solid/pencil -->
	        <svg class="-ml-1 mr-2 h-5 w-5 text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
	          <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z" />
	        </svg>
	        POST
       </button>
      </c:if>
      </p>
    </div>
    <div>
      <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
        <c:set var="page" value="${board_page}"/>
        <c:set var="startPage" value="${page - (page - 1) % 5}"/>
        <c:set var="lastPage" value="${board_last}"/>
        
        <a href="boardPage.board?board_page=${(startPage == 1)? 1 : (startPage - 1)}" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
          <span class="sr-only">Previous</span>
          <!-- Heroicon name: solid/chevron-left -->
          <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
          </svg>
        </a>
        <!-- Current: "z-10 bg-indigo-50 border-indigo-500 text-indigo-600", Default: "bg-white border-gray-300 text-gray-500 hover:bg-gray-50" -->
        <c:forEach var = "i" begin = "0" end = "4">
        	<c:if test = "${(startPage + i) <= lastPage}">
        		<a href = "boardPage.board?board_page=${startPage + i}" class = "bg-white border-gray-300 ${((startPage + i) == page)? 'text-blue-500' : 'text-gray-500'} hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
        			${startPage + i}
        		</a>
        	</c:if>
        </c:forEach>
        
        <a href = "boardPage.board?board_page=${(startPage + 5 <= lastPage) ? startPage + 5 : lastPage}" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
			<span class="sr-only">Next</span>
			<!-- Heroicon name: solid/chevron-right -->
			<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
				<path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
			</svg>
        </a>
      </nav>
    </div>
  </div>
</div>
    
  </div>
  

  
</div>


          
                    

                    <!-- Single -->		
                 
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
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
                                        <input type="text" class="form-control" id="member_name" name = "member_name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" name = "email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="subject" name = "subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="message" class="form-control" id="message" name = "message" cols="30" rows="10" placeholder="Message"></textarea>
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