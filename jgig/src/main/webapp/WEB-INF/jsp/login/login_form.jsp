<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    // 로그인 실패 시 팝업 메시지를 표시하는 함수
    function showLoginError() {
        var errorMessage = "${loginError}"; // 모델 속성에서 오류 메시지 가져오기
        if (errorMessage) {
            alert(errorMessage);
        }
    }

    // 페이지 로드 시 팝업 메시지 표시
    window.onload = showLoginError;
</script>
<style>

.form-structor {
 .login {
    position: absolute;
    top: 20%;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #fff;
    z-index: 5;
    -webkit-transition: all .3s ease;
    
    .center {
      position: absolute;
      top: calc(50% - 10%);
      left: 50%;
      -webkit-transform: translate(-50%, -50%);
      width: 400px;
      z-index: 5;
      -webkit-transition: all .3s ease;
      border: 1px solid #0000001f;
    border-radius: 30px;
    padding: 46px;
      
      .form-title {
        color: #000;
        font-size: 1.7em;
        text-align: center;

        span {
          color: rgba(0,0,0,0.4);
          opacity: 0;
          visibility: hidden;
          -webkit-transition: all .3s ease;
        }
      }

      .form-holder {
        border-radius: 15px;
        background-color: #fff;
        border: 1px solid #eee;
        overflow: hidden;
        margin-top: 50px;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        .input {
          border: 0;
          outline: none;
          box-shadow: none;
          display: block;
          height: 30px;
          line-height: 30px;
          padding: 8px 15px;
          border-bottom: 1px solid #eee;
          width: 100%;
          font-size: 12px;

          &:last-child {
            border-bottom: 0;
          }
          &::-webkit-input-placeholder {
            color: rgba(0,0,0,0.4);
          }
        }
      }

      .submit-btn {
        background-color:  #FFD64B;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 15px;
        display: block;
        margin: 15px auto; 
        padding: 15px 45px;
        width: 100%;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        &:hover {
          transition: all .3s ease;
          background-color: rgba(0,0,0,0.8);
        }
      }
    }
</style>
</head>

<body>
<div class="form-structor">
		<div class="login slide-up">
		<form action="/jgig/login" method="post" class="center">
			<h2 class="form-title" id="login">
				<span>로그인</span>
			</h2>

			<div class="form-holder">
				<input type="text" class="input" name="mem_id"
					placeholder="아이디를 입력해주세요" /> <input type="password" class="input"
					name="mem_pw" placeholder="비밀번호를 입력해주세요" />
					
			</div>
			<br>

			<button type="submit" class="submit-btn">로그인</button>
			<button type="button" onclick="location.href='register'" class="submit-btn">회원가입</button>
		</form></div></div>
</body>

</html>