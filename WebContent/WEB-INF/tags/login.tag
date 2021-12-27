<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:choose>

	<c:when test = "${data == null}">
		<a href="login.jsp" id="login">Login</a> / <a href="register.jsp" id="register">Register</a>
	</c:when>
	<c:otherwise>
		<form method = "POST" action = "logout.mem" >
        	 <a href = "account.jsp" style = "text-decoration:underline;">${data.member_id}</a>
        	 <span style = "color:#ffffff; font-weight: 300; font-size: 14px;">님 환영합니다! 
        	 </span> / <a href="javascript:(logform).submit())">logout</a>
      	</form>

	</c:otherwise>
</c:choose>