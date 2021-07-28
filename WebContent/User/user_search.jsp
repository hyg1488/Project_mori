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
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap');



    /* 아이디, 비밀번호 찾기 */
    body {
        margin: 0;
        background-color:  rgb(251,251,251);
    }
    .memberForm-top {
        height: 60px;
    }

    .memberForm-tbl-wrap {
        background-color: white;
        padding-top: 2px;
        margin-top: 50px;
        margin-bottom: 50px;
        margin-left: auto;
        margin-right: auto;
        width: 980px;
        border: 1px solid gray;
        border-radius: 10px;
    }

    

    .memberForm-top h2 {
        display: inline-block;
        margin-top: 24px;
        margin-left: 160px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    table {
        /* background-color: #f7f7f7; */
        width: 700px;
        padding: 20px;
        margin-left: auto;
        margin-right: auto;
        align-items: center;
    }

    .line-wrap {
        height: 25px;
    }

    .line {
        border-top: 2px solid #dfe2e8;
    }

    caption {
        display: none;
    }
    th, td {
        padding: 0;
        height: 50px;
        font-size: 13px;
    }
    th {
        width: 150px;
        text-align: left;
        color: #494949;
        letter-spacing: -2px;
    }
    th img {
        margin-bottom: 2px;
    }
    .id_check {
        margin-top: 10px;
    }

    .btn {
        display: inline-block;
        background-color: #3371d1;
        border-radius: 4px;
        color: white;
        width: 100px;
        height: 34px;
        margin-top: 15px;
        margin-left: auto;
        margin-right: auto;
        border: 1px solid #3371d1;
        outline: none;
    }

    .btn {
        cursor: pointer;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .input-text {
        width: 178px;
        height: 34px;
        padding: 0 0 0 12px;
        border: 1px solid grey;
        border-radius: 3px;
    }
    #email1 {
        width: 90px;
    }
    #email2 {
        width: 100px;
    }
    #email3 {
        width: 100px;
        height: 33px;
        padding: 0 0 0 12px;
        border: 1px solid grey;
        border-radius: 3px;
    }
    .email-info-box {
        line-height: 1.7em;
    }

    .btn-wrap {
        text-align: center;
        
    }


    /* 임시 비밀번호 메시지 */

    .email-send {
        background-color: white;
        margin-top: 50px;
        margin-bottom: 50px;
        padding-top: 2px;
        margin-left: auto;
        margin-right: auto;
        width: 980px;
        height: 200px;
        border: 1px solid gray;
        border-radius: 10px;
        justify-content: center;
    }

    .message {
        text-align: center;
        margin-top: 60px;
        font-family: 'Nanum Gothic', sans-serif;
    }

</style>

<script>
    function id_check() {
    }
	function send01() {
		email.submit();
	}
	function send02() {
		email_post.submit();
	}
	function emailck() {
        if (email.email3.value !='1') {
        	email.email2.value = email.email3.value;
            document.getElementById('email2').readOnly = true;
        }else {
        	email.email2.value = '';
            document.getElementById('email2').readOnly = false;
        }
    }
	
	function emailck02() {
		 if (email_post.email03.value !='1') {
	        	email_post.email02.value = email_post.email03.value;
	            document.getElementById('email02').readOnly = true;
	        }else {
	        	email_post.email02.value = '';
	            document.getElementById('email02').readOnly = false;
	        }
	}
</script>
</head>
<body>
    <!-- 아이디, 비밀번호 찾기 시작 -->
    <c:if test="${cnt==0 || cnt==4 || cnt==5}">
    <div class="memberForm-tbl-wrap">
        <div class="memberForm-top">
            <h2>아이디 찾기</h2>
        </div>
	<form action="User?cmd=user_search" name="email" method="post">
        <table class="memberForm-tbl">
            <caption>개인 정보</caption>
            <tbody>
                <tr>
                    <th scope="row"><label for="username"><img src="User/Img/red_star_spot.png"> 이름</label></th>
                    <td>
                        <input class="input-text" type="text" name="username" id="username" placeholder="">
                        <br>
                        <small class="email-info-box">
                            가입 시 입력하신 이름을 입력해 주세요.
                        </small>
                    </td>
                </tr>
                <tr>
                    <td class="line-wrap" colspan="2">
                        <div class="line"></div>
                    </td>
                </tr>
                
                <tr>
                    <th scope="row"><label for="email1"><img src="User/Img/red_star_spot.png"> 이메일</label></th>
                    <td>
                        <input class="input-text" type="text" name="email1" id="email1">
                        <span>@</span>
                        <input class="input-text" type="text" name="email2" id="email2">
                        <select name="email3" id="email3" onclick="emailck()">
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hanmail.com">hanmail.net</option>
                        </select>
                        <br>
                        <small class="email-info-box">
                            가입 시 입력하신 메일 주소를 입력해 주세요.
                        </small>
                    </td>
                </tr>
                <c:if test="${cnt==4}"><tr><td colspan="2" style="text-align: center; color: red">
                * 이름과 이메일을 다시 확인해 주십시요.</td></tr></c:if>
                <tr class="btn-wrap">
                    <td colspan="2"><input class="btn" type="button" value="아이디 찾기" onclick="send01()"></td>
                </tr>
            </tbody>
        </table>
        </form>
	
    </div>

    <div class="memberForm-tbl-wrap">
        <div class="memberForm-top">
            <h2>비밀번호 찾기</h2>
        </div>
			<form action="User?cmd=user_email" name="email_post" method="post">
        <table class="memberForm-tbl">
            <caption>개인 정보</caption>
            <tbody>
                <tr>
                    <th scope="row"><label for="username"><img src="User/Img/red_star_spot.png"> 아이디</label></th>
                    <td>
                        <input class="input-text" type="text" name="userid" id="username" placeholder="">
                        <br>
                        <small class="email-info-box">
                            가입 시 입력하신 아이디를 입력해 주세요.
                        </small>
                    </td>
                </tr>
                <tr>
                    <td class="line-wrap" colspan="2">
                        <div class="line"></div>
                    </td>
                </tr>
                
                <tr>
                    <th scope="row"><label for="email1"><img src="User/Img/red_star_spot.png"> 이메일</label></th>
                    <td>
                        <input class="input-text" type="text" name="email01" id="email1">
                        <span>@</span>
                        <input class="input-text" type="text" name="email02" id="email2">
                        <select name="email03" id="email3" onclick="emailck02()">
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hanmail.com">hanmail.net</option>
                        </select>
                        <br>
                        <small class="email-info-box">
                            가입 시 입력하신 메일 주소를 입력해 주세요.
                        </small>
                    </td>
                </tr>
                <c:if test="${cnt==5}"><tr><td colspan="2" style="text-align: center; color: red">
                * 아이디와 이메일을 다시 확인해 주십시요.</td></tr></c:if>
                <tr class="btn-wrap">
                	
                    <td colspan="2"><input class="btn" type="button" value="비밀번호 찾기" onclick="send02()"></td>
                </tr>
            </tbody>
        </table>
        </form>

    </div>
	</c:if>
    <!-- 임시 비밀번호 메시지 시작 -->

	<c:if test="${cnt==1 }">
    <div class="email-send">
       <div class="message">
           가입 시 인증된 메일로 임시 비밀번호가 전송되었습니다.<br>
           임시 비밀번호로 로그인 후 비밀번호를 변경해 주세요.<br><br>
           문의 : suhan0427@gmail.com<br>
           <a href="Index"><input class="btn" type="button" value="확인"></a>
       </div>
    </div>
	</c:if>
    <!-- 회원 가입 이메일 전송 -->
	<c:if test="${cnt==2 }">

    <div class="email-send">
        <div class="message">
            입력하신 이메일로 인증 메일이 전송되었습니다.<br>
            이메일에서 연결된 주소로 회원가입 인증을 완료해 주세요.<br><br>
            https://www.morikorea.com
        </div>
     </div>

    <footer>


    </footer>
	</c:if>
	<c:if test="${cnt==3}">
    <div class="email-send">
       <div class="message">
          해당 사용자의 아이디는  ${userid} 입니다.<br>
     비밀번호를 분실하셨을 경우 비밀번호 찾기를 이용해주세요.<br><br>
           문의 : suhan0427@gmail.com<br>
           <a href="Index"><input class="btn" type="button" value="확인"></a>
       </div>
    </div>
	</c:if>


</body>
</html>