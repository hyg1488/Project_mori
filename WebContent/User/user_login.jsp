<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>

<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모리 :: 일본 취업 정보</title>
   
<style>
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
    body {
        margin: 0;
        background-color:  rgb(251,251,251);
    }

    .memberForm-tbl-wrap {
        background-color: white;
        margin-top: 90px;
        padding-top: 2px;
        margin-left: auto;
        margin-right: auto;
        width: 480px;
        height: 600px;
        border: 1px solid lightgrey;
        border-radius: 10px;
    }

    .memberForm-top h2 {
        text-align: center;
        font-family: 'nanumgothic';
    }

    .login-form {
        width: 100px;
    }

    .id-wrap {
        margin-top: 40px;
    }

    .pass-wrap {
        margin-top: 20px;
    }

    span {
        margin-left: 57px;
        font-size: 12px;
        font-weight: bold;
        
    }

    .input-user {
        padding: 0 16px;
        margin-top: 5px;
        width: 340px;
        height: 38px;
        margin-left: 50px;
        outline: none;
        border: 0.1rem solid #d3d3d3;
        background-color: rgb(232, 240, 254);
    }

    .s-pass {
        color: #aaaaaf;
        margin-top: 30px;
        margin-left: 270px;
        display: inline-block;
    }
    .s-pass a {
        text-decoration: none;
        font-size: 12px;
        font-weight: 600;
        color: #aaaaaf;
    }

    .insert-user {
        margin-top: 20px;
        text-align: center;
    }

  	.btn-wrap {
        margin-top: 40px;
    }

    .btn {
        width: 377px;
        height: 40px;
        background-color: #3371d1;
        border: none;
        color: white;
        font-size: 15px;
        font-family: 'nanumgothic';
        cursor: pointer;
    }

    .copyright-wrap {
        width: 500px;
        margin: 0 auto;
    }
    .copyright {
        margin-top: 20px;
        font-size: 12px;
        text-align: center;
        font-weight: bold;
        color: #aaaaaf;
    }


</style>

<script>

</script>

</head>
<body>
    <form name="login-form" method="POST" action="User?cmd=user_login" onsubmit="return login_send(this)">
        <div class="memberForm-tbl-wrap">
            <div class="memberForm-top">
                <h2>로그인</h2>
            </div>
            <div class="id-wrap">
                <span>
                    아이디 <c:if test="${cnt==1 }"><span style="color: red">! 아이디를 입력해주세요. </span></c:if>
                </span>
                <input class="input-user" type="text" name="userid">
            </div>

            <div class="pass-wrap" >
                <span>
                    비밀번호<c:if test="${cnt==2 }"><span style="color: red">! 비밀번호를 입력해주세요. </span></c:if>
                </span>
                <input class="input-user" type="password" name="pass">
            </div>
            <div class="s-pass">
                <a href="User?cmd=user_search&cnt=0">아이디 찾기 | 비밀번호 찾기</a>
            </div>
            <div class="btn-wrap">
                        	<c:if test="${cnt==3 }"><span style="text-align: center; color: red;"> 
                        	아이디, 비밀번호를 다시 확인해주십시요. </span></c:if>
                <div class="insert-user">
                    <input class="btn" type="submit" value="로그인">
                </div>
                <br>
                <div class="insert-user">
                    <input class="btn" type="button" value="회원가입" onclick="location.href='insert_select.html'">
                </div>
            </div>
        </div>
        <input type="hidden" name="cnt" value="1">
    </form>

    <div class="copyright-wrap">
        <div class="copyright">
            ⓒ2020 MORI.
        </div>
    </div>



</body>
</html>