<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--expression language --%>
	<h1>EL Tag 로 파라미터 출력하기</h1>
	<hr>
	<form method = "post" action = "ex02-result.jsp">
		<p><input type = "text" name = "name" placeholder = "이름"></p>
		<p><input type = "text" name = "age" placeholder = "나이"></p>
		<p><input type = "submit"></p>
	</form>
</body>
</html>