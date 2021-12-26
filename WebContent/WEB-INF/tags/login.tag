<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test = "${data == null}">
		<a href="login.jsp" id="login">Login</a>
	</c:when>
	<c:otherwise>
		<form method = "POST" action = "logout.mem">
			<a href = "#">${data.member_id}</a>님 환영합니다!<input type = "submit" value = "logout">
		</form>
	</c:otherwise>
</c:choose>