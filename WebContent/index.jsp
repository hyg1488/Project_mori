<!-- <!DOCTYPE html> -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모리 :: 일본 취업 정보</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap')
	;

body {
	margin: 0;
}

.navbar {
	margin-bottom: 50px;
	background-color: white;
	font-family: 'Nanum Gothic', sans-serif;
	letter-spacing: 0.5px;
}

.navbar-top {
	background-color: rgb(251, 251, 251);
	margin-top: 0;
	display: flex;
}

.container {
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
}

.acc_section a {
	margin-right: 3px;
	margin-left: 3px;
}

.navbar-middle {
	background-color: white;
	border-top: 1px solid rgb(214, 214, 214);
	border-bottom: 1px solid rgb(214, 214, 214);
	margin-left: auto;
	margin-right: auto;
	height: 90px;
}

.container-middle {
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
	width: 200px;
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
	border-left: 4px solid black;
	border-right: none;
	width: 284px;
	height: 17px;
	padding: 7px;
}

.s-btn {
	cursor: pointer;
	outline: none;
	margin-left: 0;
	border: 4px solid black;
	border-radius: none;
	background-color: black;
	color: aliceblue;
	width: 60px;
	height: 32px;
	font-family: 'Nanum Gothic', sans-serif;
}

.btn {
	width: 80px;
	height: 36px;
	color: white;
	background-color: #3371d1;
	border: 1px solid #3371d1;
	border-radius: 4px;
	outline: none;
	box-shadow: 0px 2px 0 #dad8d8;
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
	border-bottom: 1px solid rgb(214, 214, 214);
	display: flex;
}

.container-bottom {
	display: flex;
	height: 45px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 0;
	align-items: center;
	font-size: 15px;
	font-weight: bold;
}

.navbar-bottom ul {
	width: 950px;
	padding: 0;
	display: flex;
	list-style: none;
	float: left;
}

.navbar-bottom li {
	margin-left: 12px;
	padding: 0px 30px 0px 0px;
}

.navbar-bottom li a {
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

.word {
	margin-left: 10px;
	display: table-cell;
	justify-content: center;
	text-align: center;
	width: 220px;
	height: 200px;
	border-style: dashed;
	border-radius: 30px;
	border-width: 1px;
	padding: 12px;
	word-break: break-all;
	text-align: center;
	display: inline-block;
	border: 1px solid #eaeaea;
	vertical-align: middle;
}

.wordinput {
	line-height: 300%;
	font-size: 13px;
	color: #6881a1;
	height: 50%;
	z-index: 2;
	font-weight: bold;
}

.bottom {
	display: flex;
	justify-content: center;
	height: 50px;
	z-index: 1;
	height: 20%;
}

.word-btn {
	bottom: 20px;
	width: 91px;
	height: 32px;
	background-color: #acb0be;
	-webkit-border-radius: 16px;
	border-radius: 16px;
	font-size: 13px;
	line-height: 32px;
	color: #fff;
	font-weight: bold;
}

.body {
	background-color: rgb(251, 251, 251);
	height: 800px;
}

.hr {
	border-top: 10px solid #9C9C9C;
	padding-top: 30px;
	border-bottom: 1px solid #F6F6F6;
}

.middle {
	display: flex;
	align-items: center;
	justify-content: space-between;
	text-align: center;
	margin-top: -20px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	height: 40%;
}

.explaininput {
	text-align: center;
	font-size: 19px;
	line-height: 25px;
	color: #212121;
	font-weight: 600;
}

.btn-left {
	background-image:
		url(https://s.pstatic.net/static/www/img/uit/2020/sp_dark_shop_981341.png);
	-webkit-background-size: 107px 36px;
	background-size: 107px 36px;
	background-repeat: no-repeat;
	display: inline-block;
	width: 20px;
	height: 20px;
	background-position: 0 -53px;
	background-repeat: no-repeat;
	vertical-align: top;
}

.btn-right {
	background-image:
		url(https://s.pstatic.net/static/www/img/uit/2020/sp_shop_bffdc9.png);
	-webkit-background-size: 107px 78px;
	background-size: 107px 78px;
	background-repeat: no-repeat;
	display: inline-block;
	width: 20px;
	height: 20px;
	background-position: -152px 0;
	background-repeat: no-repeat;
	vertical-align: top;
}

.btn-left:hover, .btn-right:hover {
	border: 1px solid black;
}

.btn-left, .btn-right {
	cursor: pointer;
	border-radius: 4px;
}

.main-wrap {
	width: 850px;
	margin: 0 auto;
}

ul {
	list-style: none;
}

* {
	box-sizing: border-box
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}
}
/* img{
-webkit-perspective:1;
} */
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function search_send(formEI) {
		if (formEI.search.value == '') {
			alert('검색어를 입력해 주세요.');
			formEI.search.focus();
			return false;
		}
	}

	function search() {

		if (search_frm.search.value == '') {

			alert('검색어를 입력해 주세요.');
			search_frm.search.focus();
			return;
		}

		search_frm.submit();
	}
	$(document)
			.on(
					'click',
					'#rightbtn',
					function() {
						$
								.post(
										"Test?cmd=test_nextbtn",
										{
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											"num" : $("#num").val(),
											"lv" : $("#lv").val(),
											"size" : $("#size").val(),
											"side" : "1"
										},

										function(data) { // callback function, executed on GET success
											var word = data
											$("#wordinput").html(
													word.substring(0, word
															.indexOf("||")));
											$("#explaininput")
													.html(
															word
																	.substring(
																			word
																					.indexOf("||") + 2,
																			word
																					.indexOf("|||")));
											$('#num')
													.val(
															word
																	.substring(
																			word
																					.indexOf("|||") + 3,
																			word.length));
										});
					});
	$(document)
			.on(
					'click',
					'#leftbtn',
					function() {

						$
								.post(
										"Test?cmd=test_nextbtn",
										{
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											"num" : $("#num").val(),
											"lv" : $("#lv").val(),
											"size" : $("#size").val(),
											"side" : "-1"

										},

										function(data) { // callback function, executed on GET success
											var word = data
											$("#wordinput").html(
													word.substring(0, word
															.indexOf("||")));
											$("#explaininput")
													.html(
															word
																	.substring(
																			word
																					.indexOf("||") + 2,
																			word
																					.indexOf("|||")));
											$('#num')
													.val(
															word
																	.substring(
																			word
																					.indexOf("|||") + 3,
																			word.length));
										});
					});

	window.onload = function() {
		var slideIndex = 1;
		showSlides();
	};
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}

	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";
		setTimeout(showSlides, 8000); // Change image every 10 seconds
	}
</script>

</head>
<body>
	<jsp:include page="Include/topmenu.jsp" />



	<!-- Slideshow container -->
	<div class="slideshow-container">

		<!-- Full-width images with number and caption text -->
		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="Include/Img/이미지1.jpg" style="width: 100%" width="600"
				height="300">
			
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="Include/Img/이미지2.jpg" style="width: 100%" width="600"
				height="300">
			
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="Include/Img/이미지2.jpg" style="width: 100%" width="600"
				height="300">
			
		</div>

		<!-- Next and previous buttons -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>

	<!-- The dots/circles -->
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>


	<form class="word_frm" name="word_frm" action=""
		onsubmit="return search_send(this)">
		<input type="hidden" name="num" id="num" value=${num } /> <input
			type="hidden" name="size" id="size" value=${size } /> <input
			type="hidden" name="lv" id="lv" value=${lv } />
		<div class="main-wrap">
			<div class="word">
				<span class="wordinput" id=wordinput>${word}</span>
				<hr>
				<br>
				<div class="middle">
					<input class="btn-left" type="button" value="<" id="leftbtn">
					<div class="explaininput" id=explaininput>${explain}</div>

					<input class="btn-right" type="button" value=">" id="rightbtn">
				</div>
				<div class="bottom">
					<a href="Test?cmd=word_list&num=${num}&lv=${lv}" class="word-btn"
						type="button" value="" id="word-btn">더 보기</a>
				</div>
			</div>
			<div class="notice">
				<c:forEach var="list" items="${noticeList}">

					<tr onMouseOver="style.backgroundColor='#D1EEEE'"
						onMouseOut="style.backgroundColor=''">


						<td align="middle" height="20">&nbsp; <font face="돋움"
							size="2" color="#000000"> <a class="list"
								href="notice_view.do?idx=${list.idx}&page=${page}">${list.subject}</a></td>
						<td align="center" height="20"><font face="돋움" size="2">
								<a class="list" href="mailto:ein1027@nate.com">${list.name}</a>
						</font></td>
						<td align="center" height="20"><font face="돋움" size="2">${list.regdate.substring(10)}</font></td>
						<td align="center" height="20"><font face="돋움" size="2">
								${list.readcnt} </font></td>
					</tr>
					<c:set var="nCount" value="${nCount-1 }" />
				</c:forEach>
			</div>
		</div>

	</form>
	<jsp:include page="Include/footer.jsp" />


</body>
</html>