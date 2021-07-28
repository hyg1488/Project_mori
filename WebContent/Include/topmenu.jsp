<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모리 :: 일본 취업 정보</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap');


    body {
        margin: 0;
    }
    .navbar {
        margin-bottom: 50px;
        background-color: white;
        font-family: 'Nanum Gothic', sans-serif;
        letter-spacing: 0.5px;
        box-shadow: 0 0 4px rgba(0, 0, 0, 0.158); 
    }

    .navbar-top {
        background-color: rgb(251,251,251);
        margin-top: 0;
        display: flex;

    }
    
    .con{
        width: 950px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0;
        align-items: center;
        height: 30px;
        font-size: 11px;
        color: #9DA4AB;
        letter-spacing: -1px;
    }

    a {
        color: inherit;
        text-decoration: none;
    }

    .acc_section {
        text-align: right;
        width: 950px;
        padding-right: 10px;
        padding-top: 7px;
        float: right;
        font-weight: bold;
    }

    .acc_section a {
        margin-right: 3px;
        margin-left: 3px;
    }

    .navbar-middle {
        background-color: white;
        border-top: 1px solid rgb(214,214,214);
        border-bottom: 1px solid rgb(214,214,214);
        margin-left: auto;
        margin-right: auto;
        height: 90px;
    }

    .container-middle{
        display: flex;
        width: 950px;
        height: 90px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0;
        align-items: center;
        font-size: 11px;

    }

    .logo img {
        margin-top: 6px;
        width : 200px;
    }

    .search {
        margin-top: 18px;
        display: flex;
        margin-left: 120px;
        margin-bottom: 1px;
    }

    .input-search {
        outline: none;
        border: none;
        border-left: 4px solid  black;
        border-right: none;
        width: 284px;
        height: 17px;
        padding: 7px;
    }

    .s-btn {
        cursor: pointer;
        outline: none;
        margin-left: 0;
        border: 4px solid  black;
        border-radius: none;
        background-color:    black;
        color: aliceblue;
        width: 60px;
        height: 32px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    

    .magnifier {
        background: url('Img/ens_more.png');
        padding-right: 10px;
        margin-right: 3px;
    }

    .right-logo {
        margin-left: 160px;
    }

    .right-logo img {
        display: block;
        height: 26px;
        margin-left: 15px;
        margin-top: 3px;
        margin-bottom: none;
    }

    .my_page {
        font-weight: 800;
    }

    .popular-search {
        margin-left: 132px;
    }

    .navbar-bottom {
        background-color: white;
        margin-left: auto;
        margin-right: auto;
        border-bottom: 1px solid rgb(214,214,214);
        display: flex;
    }

    .container-bottom{
        display: flex;
        height: 45px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0;
        align-items: center;
        font-size: 15px;
        font-weight: bold;
    }

    .navbar-bottom ul{
        width: 950px;
        padding: 0;
        display: flex;
        list-style: none;
        float: left;
    }
    
    .navbar-bottom li{
        margin-left: 12px;
        padding: 0px 30px 0px 0px;
    }
    .navbar-bottom li a{
        color: black;
        font-weight: 800;
        font-size: 13px;
    }
    .navbar-bottom .right {
        margin-left: 570px;
        padding-right: 0;
    }

    .navbar-bottom .right a {
        padding: 0px 0px 0px 30px;
    }

    .body {
        background-color:  rgb(251,251,251);
        height: 800px;
    }

</style>

<script>
    function search_send(formEI) {
        if (formEI.search.value=='') {
            alert('검색어를 입력해 주세요.');
            formEI.search.focus();
            return false;
        }
    }

    function search() {
        if (search_frm.search.value=='') {
            alert('검색어를 입력해 주세요.');
            search_frm.search.focus();
            return;
        }

        search_frm.submit();
    }

</script>
</head>
    <div class="navbar">

        <div class="navbar-top">
            <!-- 최상단 메뉴 -->
            <div class="con">
                <div class="acc_section">
                	<c:if test="${empty userinfo and empty companyinfo }">

	                    <a href="User?cmd=user_login">로그인</a>
	                    <span>|</span>
	                    <a href="User?cmd=insert_select">회원가입</a>

                	</c:if>
                	<c:if test="${!empty userinfo}">

	                    <a href="User?cmd=user_logout">로그아웃</a>
	                    <span>|</span>
	                    <a href="User?cmd=user_info&cnt=1">개인정보수정</a>
                	</c:if>
                	<c:if test="${!empty companyinfo }">

	                    <a href="User?cmd=user_logout">로그아웃</a>
	                    <span>|</span>
	                    <a href="User?cmd=company_info&cnt=1">기업정보수정</a>
                	</c:if>
                </div>
                <!-- 최상단 메뉴 끝 -->
            </div>
        </div>
        <div class="navbar-middle">
            <!-- 상단 시작 -->
            <div class="container-middle">
                <!-- 로고 영역 -->
                <div class="logo">
                    <a href=""><img src="Include/Img/301.png"></a>
                </div>
                <!-- 검색 영역 -->
                <form class="search_frm" name="search_frm" action="Index?cmd=search" onsubmit="return search_send(this)">
                    <div class="search">
                        <input type="text"  name="search" class="input-search" value="" placeholder="검색어를 입력해 주세요">
                        <a href="javascript:search()"><input type="button" class="s-btn" value="검색"></a>
                    </div>
                    <small class="popular-search">
                        <span class="magnifier">&nbsp;</span>

                        <!-- 자주 검색한 단어 -->
                        <a href="">IT기업</a> | 
                        <a href="">무역</a> | 
                        <a href="">사무</a> |
                        <a href="">요식업</a> |
                        <a href="">한인 회사</a> |
                        <a href="">호텔리어</a> |
                        <a href="">유학</a>
                        <!-- 자주 검색한 단어 끝 부분-->

                    </small>
                </form>
                <div class="right-logo">
                   	<c:if test="${!empty userinfo }">
							    <a href="User?cmd=user_info&cnt=0">                    	
                	</c:if>  
                	<c:if test="${!empty companyinfo }">
							    <a href="User?cmd=company_info&cnt=0">                    	
                	</c:if>  
                	<c:if test="${empty userinfo and empty companyinfo }">
							    <a href="User?cmd=user_login">                  	
                	</c:if>
                	<img src="Include/Img/ico_my.png" id="my_page" ></a>
                    <div class="my_page">
                    <c:if test="${!empty userinfo }">

							    <a href="User?cmd=user_info&cnt=0">마이페이지</a>                    	
                	</c:if>
                	 <c:if test="${!empty companyinfo }">

							    <a href="User?cmd=company_info&cnt=0">마이페이지</a>                    	
                	</c:if>
                	
                	<c:if test="${empty userinfo and empty companyinfo }">
							    <a href="User?cmd=user_login">&nbsp;&nbsp;&nbsp;로그인</a>                    	
                    	
                	</c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar-bottom">
            <div class="container-bottom">
               <ul>
                    <li><a href="Japanese?cmd=test">일본어 진단</a></li>
                    <li><a href="Company?cmd=company_list">기업 정보</a></li>
                    <li class="right"><a href="">커뮤니티</a><a href="">공지사항</a></li>
                </ul>
            </div>
        </div>
    </div>
</html>