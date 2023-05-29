<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	//Post 방식의 요청이 아니라면 quiz1.jsp로 보내기
	if(request.getMethod().equals("POST") == false){
		response.sendRedirect("quiz1.jsp");
	}
%>
	<jsp:useBean id = "dto" class = "quiz1.quiz1DTO"/>
	<jsp:setProperty property = "*" name = "dto"/>

<%@ page import="quiz1.quiz1DTO" %>
	
	<table border="1" cellpadding = "10" cellspacing = "0">
		<tr>
			<td>userid</td>
			<td><jsp:getProperty property="userid" name="dto"/></td>
		</tr>
		<tr>
			<td>pw1</td>
			<td><%= dto.getPw1() %></td>
		</tr>
		<tr>
			<td>pw2</td>
			<td>${dto.pw2 } </td>
		</tr>
		<tr>
			<td>yyyy</td>
			<td><%=((quiz1DTO)pageContext.getAttribute("dto")).getYyyy()%></td>
		</tr>
		<tr>
			<td>mm</td>
			<td><%=((quiz1DTO)pageContext.getAttribute("dto")).getMm()%></td>
		</tr>
		<tr>
			<td>dd</td>
			<td><%=((quiz1DTO)pageContext.getAttribute("dto")).getDd()%></td>
		</tr>
	</table>

</body>
</html>