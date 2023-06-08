<%@page import="java.util.List"%>
<%@page import="snack.SnackDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		List<SnackDTO> list = (List<SnackDTO>) application.getAttribute("list");
		final String name = request.getParameter("name");
		//boolean result = list.removeIf(dto -> dto.getName().equals(name));
		
		boolean result = false;
		for(SnackDTO dto : list){
			if(dto.getName().equals(name)){
				list.remove(dto);
				result = true;
				break;
			}
		}
	%>
	<h3><%= result ? "삭제성공" : "삭제실패" %></h3>
	<a href = "index.jsp"><button>목록으로</button></a>
</body>
</html>