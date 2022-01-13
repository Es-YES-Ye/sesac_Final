<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	http://localhost:9999/lecture-web/jsp/el/exam02.jsp?id=aaa
	이렇게 요청했다고 가정
	그리고 나서 id 값을 추출하는 방법을 알고 싶다. 
	자바코드니까 <% %> 이거 써서... 
		http://localhost:9999/lecture-web/jsp/el/exam02.jsp?id=aaa&name=bbb
 --%>
 
 <%
 	String id = request.getParameter("id");
 	String[] hobby = request.getParameterValues("hobby");
 	if(hobby==null){
 		hobby = new String[] {"파라미터 없음"};
 	}
 %>
 id : <%= id %><br>
 id : <%= request.getParameter("id") %><br>
 id : ${param.id}<br>
 
 name : <%= request.getParameter("name") %><br>
 name : ${ param.name }<br>
 
 <%--
http://localhost:9999/lecture-web/jsp/el/exam02.jsp?id=aaa&name=bbb&hobby=reading&hobby=movie
 --%>
 	hobby[0] : <%= hobby[0] %><br>

 	
 	hobby[0] : ${ paramValues.hobby[0] }<br>
 	hobby[1] : ${ paramValues.hobby[1] }<br>
 	empty hobby[0] : ${ empty paramValues.hobby[0]}<br>
 
</body>
</html>