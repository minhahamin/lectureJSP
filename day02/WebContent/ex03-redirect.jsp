<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--이동하라고 시키는 거 : redirect --%>
<%
	request.setCharacterEncoding("UTF-8");
	
	if (request.getMethod().equals("POST") == false){
		response.sendRedirect("ex03.jsp");
	}
	else {
		String url = request.getParameter("url");
		response.sendRedirect(url);
	}
	
	//String url = request.getParameter("url");
	//response.sendRedirect(url);
	
	//클라이언트(브라우저)에게 주소를 전달함
	//클라이언트는 응답을 받은 후 새로운 요청을 작성하여 url 대상에게 요청을 보낸다
%>

</body>
</html>