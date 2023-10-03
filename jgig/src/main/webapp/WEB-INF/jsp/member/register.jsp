<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         <script>
            function checkPassword() {
                var password = document.getElementById("mem_pw").value;
                var confirmPassword = document.getElementById("mem_pw_check").value;
                
                if (password !== confirmPassword) {
                    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                    return false;
                }
                document.querySelector("#registerForm").submit();
                return true;
            }
            function formatSSN(input) {
                // 비숫자 문자를 모두 제거합니다.
                var ssn = input.value.replace(/\D/g, '');

                // 입력 길이가 6보다 큰 경우
                if (ssn.length > 6) {
                    // 입력을 "000000-0000000" 형식으로 수정합니다.
                    ssn = ssn.substr(0, 6) + ssn.substr(6, 7);

                    // 7자리 이상의 입력에 대해 경고 메시지를 표시합니다.
                    if (ssn.length > 14) {
                        alert("주민등록번호는 13자리까지만 입력 가능합니다.");
                        ssn = ssn.substr(0, 13); // 14자리 이후의 입력을 제거합니다.
                    }
                }
                  input.value = ssn;
            }
         // Use JavaScript to trigger the modal display when a success message is present
            var successMessage = [[${successMessage}]];
            if (successMessage) {
                $('#successModal').modal('show');
            }
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
            background-color: #FFD64B;
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
                <form action="/jgig/register" method="post" class="center" id="registerForm">
                    <h2 class="form-title" id="login">
                        <span>회원가입</span></h2>
                            <div class="form-holder">
        
                    <input type="text" name="mem_nm" class="input" placeholder="이름을 입력해주세요"/>
               
                                        <div style=" border-bottom : 1px solid #0000001f; display: flex; justify-content: space-between;">
                    <input type="text" style=" border-bottom : none;" name="ssn_1" class="input" placeholder="주민등록번호 앞자리" oninput="formatSSN(this)" maxlength = 6/>
                      <hr style=" border: 1px solid #0000001f;">
                      <input type="text" name="ssn_2" class="input" placeholder="주민등록번호 뒷자리" oninput="formatSSN(this)"  maxlength =7 />
                    </div>
               
                    <input type="text" name="phone_num"class="input" placeholder="전화번호를 입력해주세요" maxlength =11 />
               
                    <input type="text" name="nickname"class="input" placeholder="닉네임을 입력해주세요"/>
                
                    <input type="text" name="mem_id" class="input"placeholder="아이디를 입력해주세요"/>
                
                    <input type="password" name="mem_pw"class="input" id="mem_pw" placeholder="비밀번호를 입력해주세요" required/>
                
                    <input type="password" name="mem_pw_check"class="input" id="mem_pw_check" placeholder="비밀번호를 한번 더 입력해주세요" required/>
                </div>
                <br>
                
                <button type="button" onclick="checkPassword()" class="submit-btn">회원가입</button>
                <button type="button" onclick="location.href='/jgig/'" class="submit-btn">메인페이지로</button>
                
                </form>
            </div>
        </div>
        
        
        <!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Display the success message from the model -->
                <p th:text="${successMessage}"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
    </body>


</html>