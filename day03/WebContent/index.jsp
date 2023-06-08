<%@page import="java.util.ArrayList"%>
<%@page import="snack.SnackDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
	#root {
		display : flex;
		width : 700px;
		flex-flow : wrap;
		margin : 20px auto;
		border : 2px solid black;
	}
	.item{
		box-sizing : border-box;
		width : 150px;
		margin : 10px;
		padding : 10px;
		cursor : pointer;
		
		display : flex;
		flex-direction : column;
		justify-content : center;
		
		text-align : center;
	}
	
	.item:hover{
		background-color : #eee;
	}
	.image > img {
		width : 100px;
		
	}
	#menu{
		display : flex;
		width : 700px;
		justify-content : space-between;
		margin : 20px auto;
		align-items : center;
	}
</style>
</head>
<body>
	<h1> 상품 관리(대문 페이지)</h1>
	<hr>
	
	<%
		List<SnackDTO> list = null;
		Object tmp = application.getAttribute("list");
		if(tmp != null ){	//이미 사용중인 리스트가 있으면 기존 리스트를 불러와서 list에 저장함
			list = (List<SnackDTO>) tmp;
			
		}
		else {	//기존 사용중인 리스트가 없으면 새로 만들고 더미 데이터를 추가함
			list = new ArrayList<SnackDTO>();
			list.add(new SnackDTO("초코칩", 1500, "초코칩.jpg"));
			list.add(new SnackDTO("초코송이", 1000, "초코송이.jpg"));
			list.add(new SnackDTO("초코하임", 2000, "초코하임.jpg"));
			list.add(new SnackDTO("찰떡파이", 2500, "찰떡파이.jpg"));
			list.add(new SnackDTO("홈런볼", 3000, "홈런볼.jpg"));
			list.add(new SnackDTO("빈츠", 1700, "빈츠.jpg"));
			application.setAttribute("list",list);
			
			//새로 만든 리스트를 application에 등록함
		}
	%>
	<div id = "menu">
		<!-- 왼쪽 -->
		<div>
			<form> 
				<p> 
					<input type = "search" name = "search" placeholder ="검색">
					<input type = "submit" value = "검색">
					
				</p>
			</form>
		</div>
		<!-- 오른쪽 -->
		<div>
			<a href = "add.jsp"><button> 추가 </button></a>
		</div>
	</div>
	<div id ="root">
		<% for (SnackDTO dto : list) {%>
		<div class = "item">
			<div class = "image"><img src ="img/<%=dto.getImage() %>"></div>
			<div class = "name"><%=dto.getName() %></div>
			<div class = "price"><%=String.format("%d", dto.getPrice()) %>원</div>
		</div>
		<%} %>
	</div>
	
	
	<div id="contextMenu" style="background-color : pink;
									position : absolute;
									display : none;
									width : 70px;
									padding : 10px;
									text-align : center;"
									>
	<a href = "delete.jsp" > <button> 삭제 </button></a> 
	</div>
	
	
	<script>
		const itemList = document.querySelectorAll('div.item')
		const contextMenu = document.getElementById('contextMenu')
		
		const contextMenuHandler = function(event){  //우클릭 이벤트
			event.preventDefault()	// 기본 작동을 막음 (원래 뜨는 거)
			contextMenu.style.display = 'block' //숨겨뒀던 메뉴 보여주기
			contextMenu.style.top = event.clientY + 'px'	//위치 수정 (마우스 클릭)
			contextMenu.style.left = event.clientX + 'px'
			
			let target = event.target		//우클릭 대상(div.item or .name or .price or .image)
			while(target.classList.contains('item') == false ){  //대상이 div.item이 아니면
				target = target.parentNode		//div.item이 될때까지 상위 노드를 대입한다
			}
			const name = target.querySelector('div.name').innerText  //상품이름 글자를 문자열 저장
			contextMenu.querySelector('a').href = 'delete.jsp?name='+ name	//a 태그의 속성에 추가
		}
		itemList.forEach(item => item.oncontextmenu = contextMenuHandler)
		document.body.onclick = () => contextMenu.style.display = 'none'
	</script>
	
	
</body>
</html>