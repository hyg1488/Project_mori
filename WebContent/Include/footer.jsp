<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/e7462ea469.js" crossorigin="anonymous"></script>
    <title>Document</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap');


    body {
        margin: 0;
    }
    footer {
        margin-top: 50px;
        display: flex;
        background-color: #343434;
        height: 200px;
        font-family: 'Nanum Gothic', sans-serif;
        letter-spacing: 0.5px;
    }

    footer a {
        text-decoration: none;
        color: white;
    }
    .footer-container {
        width: 950px;
        height: 75px;
        align-items: center;
        justify-content: center;
        margin: auto;
        margin-bottom: 82px;
        font-size: 14px;

        
    }
    .navbar-menu, .navbar-icon {
        display: flex;
        list-style: none;
        justify-content: center;
        padding-left: 0;
    }

    .person {
        color: rgb(255, 238, 0);
    }

    .navbar-menu li, .navbar-icon li{
        margin-right: 20px;
        color: white;
    }

    .navbar-icon {
        margin-top: 20px;
        font-size: 20px;
    }

    .copyright {
        justify-content: center;
        display: flex;
        text-align: center;
        color: white;
    }

</style>    
</head>
<body>
    <footer>
        <div class="footer-container">
            <ul class="navbar-menu">
                <li><a class="person" href="">개인정보처리방침</a></li>
                <li><a href="">이메일무단수집거부</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">홈페이지오류신고</a></li>
            </ul>
            <ul class="navbar-icon">
                <li><a href=""><i class="fab fa-instagram"></a></i></li>
                <li><a href=""><i class="fab fa-facebook-square"></a></i></li>
                <li><a href=""><i class="fab fa-twitter-square"></a></i></li>
            </ul>
            <ul class="navbar-menu">
                <li class="copyright">ⓒ2020 MORI.</li>
            </ul>
        </div>
    </footer>
</body>
</html>