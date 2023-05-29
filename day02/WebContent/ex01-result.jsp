<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-result.jsp</title>
</head>
<body>

<%
	// request.getParameter()를 이용하여
	// 이름과 나이를 화면에 간단하게 출력하세요
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

<fieldset>
	<legend>test1</legend>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
</fieldset>

<%@ page import = "ex01.Ex01DTO" %>
<%
	Ex01DTO dto = new Ex01DTO();
	dto.setName(request.getParameter("name"));
	dto.setAge(Integer.parseInt(request.getParameter("age")));
	
	pageContext.setAttribute("dto", dto);
%>

<fieldset>
	<legend>test2</legend>
	<h3>이름 : <%=dto.getName() %></h3>
	<h3>나이 : <%=dto.getAge() %></h3>
</fieldset>


<%--JSP 에 내장된 액션태그를 활용하여 객체 생성 및 파라미터 입력 이후 화면 출력 --%>
<jsp:useBean id = "dto2" class = "ex01.Ex01DTO" />
<%-- ExDTO dto2= new Ex-1DTO();      

//기본생성자 객체 생성 
//id : 생성되는 객체의 이름 및 attribute 의 이름
//class : 객체 생성에 이용할 패키지. 클래스 이름
//scope : 생성된 객체를 저장할 내장 객체 범위. 생략하면 기본값은 pageContext(page 로 표기함)

--%>


<jsp:setProperty property = "*" name = "dto"/>
<%--  dto2.setName(request.getParameter("name"));   //필드의 이름과 파라미터 이름이 같아야 됨 --%>
<%--  dto2.setAge(Integer.parseInt(request.getParameter("age")));   //primitive type 유형은 자동 형변환도 지원함--%>


<fieldset>
	<legend>test3</legend>
	<h3>이름 : <%=dto2.getName() %></h3>
	<h3>나이 : <%=dto2.getAge() %></h3>
	
	<br>
		
	<h3>이름 : ${dto2.name }</h3>
	<h3>나이 : ${dto2.age }</h3>
	<h3>dto2 는 useBean 태그를 이용하여 자동으로 attribute에 저장됨</h3>
	
	<h3>이름 : ${dto.name }</h3>
	<h3>나이 : ${dto.age }</h3>
	<h3>dto 는 pageContext.setAttribute 를 수행하지 않으면 출력되지 않음</h3>

	<br>
	
	<h3>이름 :<%=((Ex01DTO)pageContext.getAttribute("dto2")).getName()%></h3>
	<h3>나이 :<%=((Ex01DTO)pageContext.getAttribute("dto2")).getAge()%></h3>
</fieldset>

</body>
</html>