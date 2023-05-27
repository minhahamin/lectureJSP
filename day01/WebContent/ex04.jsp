<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 이용한 파라미터 전달</title>
</head>
<body>
	<h1> form 태그를 이용한 파라미터 전달</h1>
	<hr>
	
	<%--
	 form 태그는 사용자 입력값을 포함한 새로운 요청을 만들어서 서버에 전송하는 태그
	 form 태그는 다음 속성을 사용할 수 있음
	 
	 	action : 요청을 받을 서버의 주소
	 		          생략하면 현재 주소에서 요청을 받음
	 	method : 요청방식(GET(select),POST(insert), HEAD, PUT(전체수정 : update), PATCH(일부만 수정하고 싶을 때), DELETE...)
	 	                  단, form 태그는 GET, POST, HEAD 만 사용가능
	 	                  생략하면 GET이 지정됨
	 	                  
	 	          GET: 클라이언트의 입장에서 data를 받기 위해 사용하는 메서드
	 	                             어떤 내용을 받을지에 대해 파라키터를 쿼리 스트링 형태로 전달할 수 있음
	 	                             따라서, 파라미터는 주소창을 통해서 전달함
	 	          POST : 클라이언트가 입력하는 data를 서버(혹은 DB)에 만들기 위한 메서드
	 	                                 입력받은 내용은 주소창을 통하여 전달하지 않음
	 	                 Http 요청 패킷의 body 에 form-data 형식으로 포함되어 전달됨
	 --%>
	
	<form> <!--파라미터에게 새로운 요청을 만들어내는 태그  -->
		<p><input type="text" name="name" placeholder="이름입력"></p>
		<p><input type="number" name="age" placeholder="나이입력"></p>
		<p><input type="submit"></p>
	</form>
	
	<fieldset>
	
	<legend>naver 로 연결되는 form</legend>
	<form action = "https://search.naver.com/search.naver">
		<input type="text" name = "query" placeholder = "네이버 검색어 입력">
		<input type="submit" value = "검색">
	</form>
	</fieldset>
	
	<fieldset>
	
	<legend>현재 서버의 ex03.jsp 로 연결되는 form</legend>
	<form action = "ex03.jsp">
		<input type="text" name = "name" placeholder = "이름입려">
		<input type="submit" value = "제출">
	</form>
	</fieldset>
	
	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String msg;
	
	if(name ==null || age==null || "".equals(name) || "".equals(age)){
		
		msg ="안녕하세요";
	}
	else {
		msg = String.format("%s 님 (%s살) 안녕하세요", name, age);
	}
	%>
<h3><%=msg %></h3>
</body>
</html>