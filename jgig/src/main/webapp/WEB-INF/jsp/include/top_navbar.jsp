<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap');  /* 글꼴 */

/* 상단 메뉴 스타일 */
        #top-menu {
            background-color: #F2F2F2;
            color: #fff;
            padding: 10px;
            width: 100%;
             display: flex;
  justify-content: center;
        }
        
    
    #img1 {
		width: 7vmin;
		height: 7vmin;
	}


	#img2 {
		width: 14vmin;
		height: 7vmin;
	}
	
	#top-menu a {
    color: #000; /* 링크 글꼴 색상 설정 */
    text-decoration: none; /* 링크 밑줄 제거 */
}
	
	#top-menu ul{
		list-style: none;
	}
	#top-menu li{
		font-family: 'Nanum Gothic Coding', cursive;
		float: left;
		background: #F2F2F2;
		padding:5px 10px;
		font-size: 40px;
		margin: 10px;
	}
	
	#top-menu ul li a{
		line-height: 2.5;
	}
	
	#nav3 ul li{
		font-size:30px;
	}
</style>
</head>
<body>
	<div id = "top-menu">
		<nav id = "nav1">
				<ul>
					<li><img id="img1" src="../resources/img/KB.png"></li>
					<li><img id="img2" src="../resources/img/지금입금.png"></li>
				</ul>
		</nav id = "nav2">
		<nav>
				<ul>
					<li class="menu1"><a href="#">금융거래연습</a></li>
					<li class="menu2"><a href="#">금융교육</a></li>
					<li class="menu3"><a href="#">커뮤니티</a></li>
					<li class="menu4"><a href="#">지점찾기</a></li>
					<li class="menu5"><a href="#">마이포인트</a></li>
				</ul>
		</nav>
		<nav id = "nav3">
				<ul>
					<li class="menu6"><a href="#">로그인</a></li>
					<li class="menu7"><a href="#">회원가입</a></li>
				</ul>
		</nav>
	</div>

</body>
</html>