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
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');


    table {
        background-color: white;
        font-size: 12px;
        width: 800px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
        font-family: 'Nanum Gothic', sans-serif;
    }

    table a {
        text-decoration: none;
        color: black;
    }


    .comm-top {
        font-weight: bold;
        border-bottom: 1px solid gray;
    }

    .comm-list td {
        padding: 8px;
        border-bottom: 1px solid rgba(128, 128, 128, 0.178);

    }

    .comm-top {
        text-align: center;
    }

    .comm-body {
        text-align: center;
    }

    .num {
        width : 7%;
    }
    .sub {
        width: 50%;
    }
    .comm-body .sub {
        padding-left: 10px;
        text-align: left;
    }
    .name {
        width: 10%;
    }
    .regdate {
        width: 20%;
    }
    .readcnt {
        width: 10%;
    }

    .page-area {
        margin-top: 15px;
        text-align: center;
        font-size: 12px;
    }

    .comm-body:hover {
        background-color: rgba(10, 147, 238, 0.096);
    }

    .search-area {
        height: 40px;
        margin-right: 20px;
        margin-top: 15px;
        text-align: right;
    }

    .select-search {
        font-size: 12px;
        height: 31.2px;
        padding-left: 5px;
        font-family: 'Nanum Gothic', sans-serif;
        border: 1px solid #999;
        margin-top: 2px;
    }

    .input-search {
        outline: none;
        border: none;
        border-left: 4px solid  #3371d1;
        border-right: none;
        width: 200px;
        height: 17px;
        padding: 7px;
    }

    .btn-search {
        margin-top: 2px;
        cursor: pointer;
        outline: none;
        margin-left: 0;
        border: 4px solid #3371d1;
        border-radius: none;
        background-color: #3371d1;
        color: aliceblue;
        width: 48px;
        height: 29px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .btn-comm-write {
        border: 1px solid #999;
        margin-left: 135px;
        margin-right: 20px;
        padding-bottom: 2.7px;
        padding-left: 5px;
        padding-right: 5px;
        background-color: white;
    }

    .search-area i {
        color: rgba(5, 5, 5, 0.897);
        margin-right: 3px;
        padding-bottom: 2px;
    }

    .search-area a {
        font-size: 12px;
    }


</style>    
</head>
<body>

    <div class="comm-wrap">
        <table class="comm-list">
            <thead>
                <tr class="comm-top">
                    <td class="num">번호</td>
                    <td class="sub">제목</td>
                    <td class="name">작성자</td>
                    <td class="regdate">작성일</td>
                    <td class="readcnt">조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub"><a href="">안녕하세요</a></td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
                <tr class="comm-body">
                    <td class="num">1</td>
                    <td class="sub">안녕하세요</td>
                    <td class="name">김수한</td>
                    <td class="regdate">2021-01-31</td>
                    <td class="readcnt">102</td>
                </tr>
            </tbody>
        </table>
        <div style="width: 800px; margin-left: auto; margin-right: auto;">
            <div class="page-area">
                페이징 처리 부분
            </div>
            <div class="search-area">
                <select class="select-search">
                    <option>
                        제목
                    </option>
                    <option>
                        내용
                    </option>
                    <option>
                        작성자
                    </option>
                </select>
                <input class="input-search" type="text"><input class="btn-search" type="submit" value="검색">
                <span class="btn-comm-write"><a href="" style="text-decoration: none; color: black;"><i class="fas fa-edit"></i>글쓰기</a></span>
            </div>
        </div>

    </div>
    
</body>
</html>