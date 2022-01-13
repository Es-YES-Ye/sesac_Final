<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("id", "hong");
	%>
	msg : <%= msg %>
	phone : ${phone }<br>
	<h2>> 인클루드 전 </h2>
	파라미터 미설정<br>
	<c:import url="one.jsp" />
	phone : ${phone }<br>
	파라미터 설정<br>
	<c:import url="one.jsp">
		<c:param  name="name" value="James" />
		<c:param  name="age" value="11" />
	</c:import>	
	<h2>> 인클루드 후 </h2>
	<%-- <c:import url="https://www.naver.com" /> --%>
</body>
</html>