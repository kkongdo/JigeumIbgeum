<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap');  /* 글꼴 */
/* 좌측 사이드바 스타일 */
#sidebar {
    width: 300px; /* 박스 컨테이너의 너비 설정 */
    height: 900px; /* 박스 컨테이너의 높이 설정 */
    background-color: #eee; /* 배경색 설정 */
    color: #000; /* 글꼴 색상 설정 */
    padding: 20px; /* 내부 여백 설정 */
    border: 1px solid #ccc; /* 박스 컨테이너의 테두리 설정 */
    border-radius: 5px; /* 박스 컨테이너의 모서리를 둥글게 설정 */
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
    line-height: normal;
    display: inline-block;
    vertical-align: middle;
    margin: 40px;
    float: left; /*왼쪽에 떠있게*/
}

/* 좌측 사이드바 링크 스타일 */
#sidebar a {
    color: #000; /* 링크 글꼴 색상 설정 */
    text-decoration: none; /* 링크 밑줄 제거 */
}

/* 좌측 사이드바 링크 호버 스타일 */
#sidebar a:hover {
    text-decoration: underline; /* 호버 상태에서 밑줄 추가 */
}

/* 좌측 사이드바 제목 스타일 */
#sidebar
	ul{
		list-style: none;
	}
	li{
		font-family: 'Nanum Gothic Coding', cursive;
		display: block; /* 각 <li> 요소를 한 줄에 하나씩 표시 */
		background: #eee;
		font-size: 30px;
	}
	
	#sidebar ul li a{
		line-height: 1.8;
	}
	
</style>
</head>
<body>
	<div id = "sidebar">
		<nav>
				<ul>
					<li>커뮤니티</li> <hr>
					<li class="menu1"><a href="#">공지사항</a></li>
					<li class="menu2"><a href="#">게시판</a></li>
					<li class="menu3"><a href="#">내가 쓴글</a></li>
				</ul>
		</nav>
	</div>

</body>
</html>