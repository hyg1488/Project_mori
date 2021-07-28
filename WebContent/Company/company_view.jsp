<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모리 :: 기업 공고</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap')
	;

body {
	margin: 0;
	background-color: rgb(251, 251, 251);
}

.memberForm-tbl-wrap {
	background-color: white;
	padding-top: 2px;
	margin-left: auto;
	margin-right: auto;
	width: 980px;
	border: 1px solid gray;
	border-radius: 10px;
}

.memberForm-top h2 {
	margin-top: 35px;
	margin-left: 160px;
	margin-bottom: 10px;
	font-family: 'Nanum Gothic', sans-serif;
}

table {
	/* background-color: #f7f7f7; */
	width: 700px;
	padding: 20px;
	margin-left: auto;
	margin-right: auto;
	align-items: center;
	border-collapse: collapse;
}

.line-wrap {
	height: 10px;
}

.line {
	border-top: 1px solid #dfe2e8;
}

caption {
	display: none;
}

th, td {
	padding: 0;
	height: 50px;
	font-size: 13px;
	border-bottom: 1px solid #dfe2e8;
}

th {
	width: 100px;
	text-align: left;
	color: grey;
	letter-spacing: -2px;
}

th img {
	margin-bottom: 2px;
}

.id_check {
	margin-top: 10px;
}

.btn, .join {
	width: 80px;
	height: 36px;
	color: white;
	background-color: #3371d1;
	border: 1px solid #3371d1;
	border-radius: 4px;
	outline: none;
	box-shadow: 0px 2px 0 #dad8d8;
}

.input-text {
	width: 300px;
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

#email3, #tel, #job {
	width: 110px;
	height: 36px;
	padding: 0 0 0 12px;
	border: 1px solid grey;
	border-radius: 3px;
}

#capital {
	width: 150px;
	height: 36px;
	padding: 0 0 0 5px;
	border: 1px solid grey;
	border-radius: 3px;
}

.email-info-box {
	line-height: 1.7em;
}

.input-tel {
	width: 166px;
	height: 34px;
	margin-left: 10px;
	padding: 0 0 0 12px;
	border: 1px solid grey;
	border-radius: 3px;
}

.input-radio {
	height: 10px;
}

.input-price {
	width: 100px;
	height: 34px;
	padding: 0 0 0 12px;
	border: 1px solid grey;
	border-radius: 3px;
}

.txt-area {
	margin-top: 20px;
	padding: 20px;
	width: 488px;
	min-width: 488px;
	max-width: 488px;
	height: 200px;
	min-height: 200px;
	max-height: 200px;
}

.input-addr {
	margin-top: 10px;
	width: 492px;
	height: 34px;
	padding: 0 0 0 12px;
	border: 1px solid grey;
	border-radius: 3px;
}

.join-btn-wrap {
	margin-top: 30px;
	text-align: center;
	margin: 30px;
}

.cancle {
	width: 80px;
	height: 36px;
	color: #494949;
	font-weight: bold;
	background-color: white;
	border: 1px solid #494949;
	border-radius: 4px;
	outline: none;
	box-shadow: 0px 2px 0 #dad8d8;
}

.btn, .join, .cancle {
	cursor: pointer;
}
</style>

<script>
	function email() {
		if (company_frm.email3.value != '1') {
			company_frm.email2.value = company_frm.email3.value;
			document.getElementById('email2').readOnly = true;
		} else {
			company_frm.email2.value = '';
			document.getElementById('email2').readOnly = false;
		}
	}

	function company_send() {
		if (company_frm.userid.value == '') {
			alert('아이디을 입력해 주세요.');
			company_frm.userid.focus();
			return;
		} else if (company_frm.pass.value == '') {
			alert('비밀번호를 입력해 주세요.');
			company_frm.pass.focus();
			return;
		} else if (company_frm.passck.value == '') {
			alert('비밀번호 확인을 입력해 주세요.');
			company_frm.passck.focus();
			return;
		} else if (company_frm.pass.value != company_frm.passck.value) {
			alert('비밀번호 확인이 일치하지 않습니다.');
			company_frm.passck.focus();
			return;
		} else if (company_frm.companyname.value == '') {
			alert('기업명을 입력해 주세요..');
			company_frm.companyname.focus();
			return;
		} else if (company_frm.ceooname.value == '') {
			alert('대표명을 입력해 주세요..');
			company_frm.ceoname.focus();
			return;

		} else if (company_frm.email1.value == '') {
			alert('이메일을 입력해 주세요.');
			company_frm.email1.focus();
			return;
		} else if (company_frm.email2.value == '') {
			alert('이메일을 입력해 주세요.');
			company_frm.email2.focus();
			return;
		} else if (company_frm.tel2.value == '') {
			alert('관리자 연락처를 입력해 주세요.');
			company_frm.tel2.focus();
			return;
		} else if (company_frm.addr.value == '') {
			alert('주소를 입력해 주세요.');
			company_frm.addr.focus();
			return;
		}

		company_frm.action = 'User?cmd=user_insert_pro';
		company_frm.submit();
	}

	
	function company_w_modify() {
		location.href='Company?cmd=company_wmodify&idx=' + ${company.idx};
	}
</script>
</head>
<body>

	<%@ include file="/Include/topmenu.jsp"%>

	<div class="memberForm-tbl-wrap">
		<div class="memberForm-top">
			<h2>${company.name }</h2>
		</div>
		<form name="company_frm" method="POST" onsubmit="return false">
			<table class="memberForm-tbl">
				<caption>기업 정보</caption>
				<tbody>
					<tr>
						<th scope="row">기업명</th>
						<td>${company.name }</td>
						<th scope="row">대표명</th>
						<td>${company.ceo }</td>
					</tr>
					<tr>
						<th scope="row">관리자 이메일</th>
						<td>${company.email }</td>
						<th scope="row">관리자 연락처</th>
						<td>연락처 입력 부분</td>
					</tr>
					<tr>
						<th scope="row">업종</th>
						<td>${company.category }</td>
						<th scope="row">근무 지역</th>
						<td>${company.loc }</td>
					</tr>
					<tr>
						<th scope="row">자본금</th>
						<td>${company.capital }만엔</td>
						<th scope="row">설립연도</th>
						<td>${company.estyear }년</td>
					</tr>
					<tr>
						<th scope="row">연봉</th>
						<td>${company.salary }만엔</td>
						<th scope="row">사원수</th>
						<td>${company.employeenum }명</td>
					</tr>
					<tr>
						<th scope="row">고용형태</th>
						<td>${company.employtype }</td>
						<th scope="row">학력 제한</th>
						<td>${company.edulv }</td>
					</tr>
					<tr>
						<th scope="row">일본어 능력 제한</th>
						<td>${company.japaneselv }</td>
						<th scope="row">회사 주소</th>
						<td>${company.address }</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td>${company.homepage }</td>
						<th scope="row"></th>
						<td></td>
					</tr>
					<tr>
						<th scope="row">기업 소개</th>
						<td colspan="3">
							<p>${company.intro }</p>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="join-btn-wrap">
								<c:if test="${!empty userinfo }">
									<input class="join" type="button" value="지원"
									onclick="company_send()">
								</c:if>									
								<c:if test="${company.name == companyinfo.name }">
									<input class="join"
										type="button" value="수정" onclick="company_w_modify()">
								</c:if>	
								<input class="cancle"
										type="button" value="리스트" onclick="location.href='Company?cmd=company_list'">	
							</div>
						</td>
					</tr>

				</tbody>

			</table>
		</form>

	</div>

	<%@ include file="/Include/footer.jsp"%>
</body>
</html>