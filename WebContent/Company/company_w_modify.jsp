<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${companyinfo.name != company.name }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = 'Company?cmd=company_list';
	</script>
</c:if>

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

#email3, #tel, #category, #loc {
	width: 110px;
	height: 36px;
	padding: 0 0 0 12px;
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

.info {
	font-style: inherit;
	font-weight: bold;
}
</style>

<script>
	function cancle() {
		var con = confirm('취소하시면 작성한 내용이 사라집니다.\n이전 페이지로 돌아갑니다.');

		if (con == true) {
			history.back();
		}
	}

	function company_send() {

		if (company_frm.estyear.value == '') {
			alert('설립연도를 입력해 주세요.');
			company_frm.estyear.focus();
			return;
		} else if (company_frm.salary.value == '') {
			alert('연봉을 입력해 주세요.');
			company_frm.salary.focus();
			return;
		} else if (company_frm.employeenum.value == '') {
			alert('사원 수를 입력해 주세요.');
			company_frm.employeenum.focus();
			return;
		} else if (company_frm.employtype.value == '') {
			alert('고용 형태를 입력해 주세요.');
			company_frm.employtype.focus();
			return;
		} else if (company_frm.edulv.value == '') {
			alert('학력 제한를 입력해 주세요.');
			company_frm.edulv.focus();
			return;
		} else if (company_frm.japaneselv.value == '') {
			alert('일본어 능력을 입력해 주세요.');
			company_frm.japaneselv.focus();
			return;
		} else if (company_frm.intro.value == '') {
			alert('기업 소개를 입력해 주세요.');
			company_frm.intro.focus();
			return;
		} else if (company_frm.address.value == '') {
			alert('주소를 입력해 주세요.');
			company_frm.address.focus();
			return;
		}

		var con = confirm('공고를 수정하시겠습니까?');

		if (con == true) {
			company_frm.action = 'Company?cmd=company_wmodify_pro';
			company_frm.submit();
		} else {

		}
	}
</script>
</head>
<body>

	<%@ include file="/Include/topmenu.jsp"%>

	<div class="memberForm-tbl-wrap">
		<div class="memberForm-top">
			<h2>공고 등록</h2>
		</div>
		<form name="company_frm" method="POST" onsubmit="return false">
			<input type="hidden" name="idx" value="${company.idx }">
			<input type="hidden" name="name" value="${company.name }">
			<input type="hidden" name="email" value="${company.email }">
			<input type="hidden" name="ceo" value="${company.ceo }">
			<table class="memberForm-tbl">
				<caption>기업 정보</caption>
				<tbody>
					<tr>
						<th scope="row">기업명</th>
						<td>
							<div class="info">${companyinfo.name }</div>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">대표명</th>
						<td>
							<div class="info">${companyinfo.ceo }</div>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr style="height: 70px;">
						<th scope="row">관리자 이메일</th>
						<td>
							<div class="info">${companyinfo.email}</div>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">관리자 연락처</th>
						<td>
							<div class="info">${companyinfo.tell }</div>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="category"><img
								src="Company/Img/red_star_spot.png"> 업종</label></th>
						<td><select name="category" id="category">
								<c:if test="${company.category == 'IT'}">
									<option selected="selected">IT</option>
									<option>호텔</option>
									<option>무역</option>
									<option>요식업</option>
									<option>관광</option>
									<option>번역</option>
								</c:if>
								<c:if test="${company.category == '호텔'}">
									<option>IT</option>
									<option selected="selected">호텔</option>
									<option>무역</option>
									<option>요식업</option>
									<option>관광</option>
									<option>번역</option>
								</c:if>
								<c:if test="${company.category == '무역'}">
									<option>IT</option>
									<option>호텔</option>
									<option selected="selected">무역</option>
									<option>요식업</option>
									<option>관광</option>
									<option>번역</option>
								</c:if>
								<c:if test="${company.category == '요식업'}">
									<option>IT</option>
									<option>호텔</option>
									<option>무역</option>
									<option selected="selected">요식업</option>
									<option>관광</option>
									<option>번역</option>
								</c:if>
								<c:if test="${company.category == '관광'}">
									<option selected="selected">IT</option>
									<option>호텔</option>
									<option>무역</option>
									<option>요식업</option>
									<option>관광</option>
									<option>번역</option>
								</c:if>
								<c:if test="${company.category == '번역'}">
									<option>IT</option>
									<option>호텔</option>
									<option>무역</option>
									<option>요식업</option>
									<option>관광</option>
									<option selected="selected">번역</option>
								</c:if>
						</select> <br></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="loc"><img
								src="Company/Img/red_star_spot.png"> 근무 지역</label></th>
						<td><select name="loc" id="loc">
								<c:if test="${company.loc == '도쿄'}">
									<option selected="selected">도쿄</option>
									<option>오사카</option>
									<option>삿포로</option>
									<option>나고야</option>
									<option>교토</option>
									<option>후쿠오카</option>
								</c:if>
								<c:if test="${company.loc == '오사카'}">
									<option>도쿄</option>
									<option selected="selected">오사카</option>
									<option>삿포로</option>
									<option>나고야</option>
									<option>교토</option>
									<option>후쿠오카</option>
								</c:if>
								<c:if test="${company.loc == '삿포로'}">
									<option>도쿄</option>
									<option>오사카</option>
									<option selected="selected">삿포로</option>
									<option>나고야</option>
									<option>교토</option>
									<option>후쿠오카</option>
								</c:if>
								<c:if test="${company.loc == '나고야'}">
									<option>도쿄</option>
									<option>오사카</option>
									<option>삿포로</option>
									<option selected="selected">나고야</option>
									<option>교토</option>
									<option>후쿠오카</option>
								</c:if>
								<c:if test="${company.loc == '교토'}">
									<option>도쿄</option>
									<option>오사카</option>
									<option>삿포로</option>
									<option>나고야</option>
									<option selected="selected">교토</option>
									<option>후쿠오카</option>
								</c:if>
								<c:if test="${company.loc == '후쿠오카'}">
									<option>도쿄</option>
									<option>오사카</option>
									<option>삿포로</option>
									<option>나고야</option>
									<option>교토</option>
									<option selected="selected">후쿠오카</option>
								</c:if>

						</select> <br></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="capital">&nbsp; 자본금</label></th>
						<td><input class="input-price" type="text" name="capital"
							id="capital" value="${company.capital }"> <br> <small
							class="email-info-box"> * 만 엔 단위로 숫자만 입력해 주세요. 예) 1,000만
								엔 = 1000 </small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="estyear"><img
								src="Company/Img/red_star_spot.png"> 설립연도</label></th>
						<td><input class="input-price" type="text" name="estyear"
							id="estyear" value="${company.estyear }"> <br> <small
							class="email-info-box"> * 숫자만 입력해 주세요. 예) 2020년 = 2020 </small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="salary"><img
								src="Company/Img/red_star_spot.png"> 연봉</label></th>
						<td><input class="input-price" type="text" name="salary"
							id="salary" value="${company.salary }"> <br> <small
							class="email-info-box"> * 만 엔 단위로 입력해 주세요. 예) 300만 엔 =
								300 </small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="employeenum"><img
								src="Company/Img/red_star_spot.png"> 사원수</label></th>
						<td><input class="input-price" type="text" name="employeenum"
							id="employeenum" value="${company.employeenum }"> <br>
							<small class="email-info-box"> * 숫자만 입력해 주세요. 예) 10명 = 10
						</small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="employtype"><img
								src="Company/Img/red_star_spot.png"> 고용 형태</label></th>
						<td>
							<c:if test="${company.employtype == '정규직' }">
								<input class="input-radio" type="radio" name="employtype" value="정규직" checked="checked">정규직
								<input class="input-radio" type="radio" name="employtype" value="계약직">계약직
								<input class="input-radio" type="radio" name="employtype" value="인턴">인턴
								<input class="input-radio" type="radio" name="employtype" value="기타">기타
							</c:if>
							<c:if test="${company.employtype == '계약직' }">
								<input class="input-radio" type="radio" name="employtype" value="정규직">정규직
								<input class="input-radio" type="radio" name="employtype" value="계약직" checked="checked">계약직
								<input class="input-radio" type="radio" name="employtype" value="인턴">인턴
								<input class="input-radio" type="radio" name="employtype" value="기타">기타
							</c:if>
							<c:if test="${company.employtype == '인턴' }">
								<input class="input-radio" type="radio" name="employtype" value="정규직">정규직
								<input class="input-radio" type="radio" name="employtype" value="계약직">계약직
								<input class="input-radio" type="radio" name="employtype" value="인턴" checked="checked">인턴
								<input class="input-radio" type="radio" name="employtype" value="기타">기타
							</c:if>
							<c:if test="${company.employtype == '기타' }">
								<input class="input-radio" type="radio" name="employtype" value="정규직">정규직
								<input class="input-radio" type="radio" name="employtype" value="계약직">계약직
								<input class="input-radio" type="radio" name="employtype" value="인턴">인턴
								<input class="input-radio" type="radio" name="employtype" value="기타" checked="checked">기타
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="edulv"><img
								src="Company/Img/red_star_spot.png"> 학력 제한</label></th>
						<td>
							<c:if test="${company.edulv == '중졸 이상' }">
								<input class="input-radio" type="radio" name="edulv" value="중졸 이상" checked="checked">중졸 이상
								<input class="input-radio" type="radio" name="edulv" value="고졸 이상">고졸 이상
								<input class="input-radio" type="radio" name="edulv" value="대졸 이상">대졸 이상
								<input class="input-radio" type="radio" name="edulv" value="학력 무관">학력 무관
							</c:if>
							<c:if test="${company.edulv == '고졸 이상' }">
								<input class="input-radio" type="radio" name="edulv" value="중졸 이상">중졸 이상
								<input class="input-radio" type="radio" name="edulv" value="고졸 이상" checked="checked">고졸 이상
								<input class="input-radio" type="radio" name="edulv" value="대졸 이상">대졸 이상
								<input class="input-radio" type="radio" name="edulv" value="학력 무관">학력 무관
							</c:if>
							<c:if test="${company.edulv == '대졸 이상' }">
								<input class="input-radio" type="radio" name="edulv" value="중졸 이상">중졸 이상
								<input class="input-radio" type="radio" name="edulv" value="고졸 이상">고졸 이상
								<input class="input-radio" type="radio" name="edulv" value="대졸 이상" checked="checked">대졸 이상
								<input class="input-radio" type="radio" name="edulv" value="학력 무관">학력 무관
							</c:if>
							<c:if test="${company.edulv == '학력 무관' }">
								<input class="input-radio" type="radio" name="edulv" value="중졸 이상">중졸 이상
								<input class="input-radio" type="radio" name="edulv" value="고졸 이상">고졸 이상
								<input class="input-radio" type="radio" name="edulv" value="대졸 이상">대졸 이상
								<input class="input-radio" type="radio" name="edulv" value="학력 무관" checked="checked">학력 무관
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="japaneselv"><img
								src="Company/Img/red_star_spot.png"> 일본어 능력</label></th>
						<td>
							<c:if test="${company.japaneselv == '상'}">
								<input class="input-radio" type="radio" name="japaneselv" value="상" checked="checked">상
								<input class="input-radio" type="radio" name="japaneselv" value="중">중
								<input class="input-radio" type="radio" name="japaneselv" value="하">하
								<input class="input-radio" type="radio" name="japaneselv" value="무관">무관
							</c:if>
							<c:if test="${company.japaneselv == '중'}">
								<input class="input-radio" type="radio" name="japaneselv" value="상">상
								<input class="input-radio" type="radio" name="japaneselv" value="중" checked="checked">중
								<input class="input-radio" type="radio" name="japaneselv" value="하">하
								<input class="input-radio" type="radio" name="japaneselv" value="무관">무관
							</c:if>
							<c:if test="${company.japaneselv == '하'}">
								<input class="input-radio" type="radio" name="japaneselv" value="상">상
								<input class="input-radio" type="radio" name="japaneselv" value="중">중
								<input class="input-radio" type="radio" name="japaneselv" value="하" checked="checked">하
								<input class="input-radio" type="radio" name="japaneselv" value="무관">무관
							</c:if>
							<c:if test="${company.japaneselv == '무관'}">
								<input class="input-radio" type="radio" name="japaneselv" value="상">상
								<input class="input-radio" type="radio" name="japaneselv" value="중">중
								<input class="input-radio" type="radio" name="japaneselv" value="하">하
								<input class="input-radio" type="radio" name="japaneselv" value="무관" checked="checked">무관
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="contents"><img
								src="Company/Img/red_star_spot.png"> 기업 소개</label></th>
						<td><textarea class="txt-area" id="contents" name="intro">${company.intro }</textarea>
							<br> <small class="email-info-box"> * 만 엔 단위로 숫자만
								입력해 주세요. 예) 천 만 엔 = 1,000 </small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="address"><img
								src="Company/Img/red_star_spot.png"> 주소</label></th>
						<td><input class="input-addr" type="text" name="address"
							id="address" value="${company.address }"> <br> <small class="email-info-box">
								* 영어 주소를 입력해 주세요. </small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="homepage">&nbsp; 홈페이지</label></th>
						<td><input class="input-addr" type="text" name="homepage"
							id="homepage" value="${company.homepage }"> <br> <small class="email-info-box">
						</small></td>
					</tr>
					<tr>
						<td class="line-wrap" colspan="2">
							<div class="line"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="join-btn-wrap">
								<input class="join" type="button" value="등록"
									onclick="company_send()"> <input class="cancle"
									type="button" value="취소" onclick="cancle()">
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