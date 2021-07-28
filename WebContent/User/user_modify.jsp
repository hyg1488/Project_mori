<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Include/topmenu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/e7462ea469.js" crossorigin="anonymous"></script>
    <title>모리 :: 커뮤니티</title>

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
</head>
<body>

    <div class="comm-wrap">
        <div style="text-align: center;"> <h2><c:if test="${row == 1 }">회원 수정이 정상적으로 완료 되었습니다.<br>
        	다시 로그인 해주세요.</c:if>
        <c:if test="${row != 1 }">
        	<script type="text/javascript">
        		alert("수정 실패, 정보를 다시 확인해주세요!");
        		history.back();
        	</script>
        </c:if> </h2>
         <a href="Index"><input class="btn" type="button" value="확인"></a>
        </div>
        

    </div>
    
</body>
</html>