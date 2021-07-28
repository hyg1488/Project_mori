<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/Include/topmenu.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.profile {
	background-color: white;
	margin-top: 30px;
	padding-top: 2px;
	
	margin-left: auto;
	margin-right: auto;
	width: 900px;
	height: 800px;
	border: 1px solid lightgrey;
	border-radius: 10px;
	text-align: center;
}

.profile_ul {
	border-bottom: 1px solid lightgrey;
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 0;
	padding: 0;
	display: flex;
	list-style: none;
	float: left;
}

.profile_list {
	padding-top: 8px;
	width: 100px;
	height: 30px;
}

.profile_list:hover {
	background: silver;
}

.profile_table {
	margin-top: 20px;
	margin-left: 120px;
	margin-right: 120px;
	padding: 0;
	display: flex;
	list-style: none;
	float: left;
}

.profile_list {
	padding-top: 8px;
	width: 100px;
	height: 30px;
}

.profile_name {
	border: 1px solid #444444;
	width: 100px;
	height: 20px;
}

.profile_info {
	border: 1px solid #444444;
	width: 400px;
	height: 20px;
	text-align: left;
	padding-left: 20px;
}

.profile_name01 {
	border: 1px solid #444444;
	width: 100px;
	height: 40px;
}

.profile_info01 {
	border: 1px solid #444444;
	width: 555px;
	height: 40px;
	text-align: left;
	padding-left: 20px;
}

.img {
	border: 1px solid #444444;
	width: 100px;
	height: 20px;
}

.profile_img {
	width: 150px;
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
	margin-left: 160px;
	margin-bottom: 10px;
	font-family: 'nanumgothic';
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

td {
	color: #494949;
	font-weight: 600;
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
	width: 100px;
	height: 33px;
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

.checkbox {
	margin-bottom: 2px;
}

.checkbox input[type="checkbox"] {
	position: relative;
	top: 2px;
}

.checkbox label {
	cursor: pointer;
}

.join-btn-wrap {
	margin-top: 30px;
	text-align: center;
}

.btn, .join, .cancle {
	cursor: pointer;
}

.tab-01 {
	border-bottom: 1px solid black;
	text-align: center;
	font-size: 10pt;
}

.tab-02 {
	height: 40px;
}

.tab-03 {
	height: 30px;
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
	box-shadow: 0px 2px 0 #807e7e;
}

.del_notice {
	font-size: 15px;
}

.comm-wrap {
	border: 1px solid lightgrey;
	margin-top: 30px;
	margin-right: 12%;
	margin-left: 12%;
	margin-right: 12%;
	font-size: 10pt;
}

.tab-list {
	border-spacing: 1px;
	border-collapse: separate;
	width: 600px;
	padding: 0px;
}
.countck{
	margin-top: 50px;
}
.profile_info03 {
	
}
</style>

<script>
	function email() {
		if (user_frm.email3.value != '1') {
			user_frm.email2.value = user_frm.email3.value;
			document.getElementById('email2').readOnly = true;
		} else {
			user_frm.email2.value = '';
			document.getElementById('email2').readOnly = false;
		}
	}

	function checkbox() {
		var chkbox = document.getElementsByName('hobby');
		var chk = false;
		for (var x = 0; x < chkbox.length; x++) {
			if (chkbox[x].checked) {
				chk = true;
			}
		}

		if (chk == false) {
			alert('관심 분야를 하나 이상 선택해 주세요.');
			return false;
		} else {
		}
	}

	function modify_send() {
		if (user_frm.pass.value == '') {
			alert('비밀번호를 입력해 주세요.');
			user_frm.pass.focus();
			return;
		} else if (user_frm.passck.value == '') {
			alert('새 비밀번호를 입력해 주세요.');
			user_frm.passck.focus();
			return;
		} else if (user_frm.passck2.value == '') {
			alert('새 비밀번호 확인을 입력해 주세요.');
			user_frm.passck2.focus();
			return;
		} else if (user_frm.passck.value != user_frm.passck2.value) {
			alert('새 비밀번호가 일치하지 않습니다.');
			user_frm.passck.focus();
			return;
		} else if (user_frm.tel2.value == '') {
			alert('연락처를 입력해 주세요.');
			user_frm.tel2.focus();
			return;
		}

		if (checkbox() == false) {
			return;
		}

		user_frm.action = 'User?cmd=user_modify';
		user_frm.submit();
	}

	function sendDelete() {
		userDelete.submit();
	}
</script>

</head>
<body>

	<c:if test="${empty userinfo}">
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href = "Index";
		</script>
	</c:if>
	<div class="profile">
		<ul class="profile_ul">
			<c:if test="${cnt==0 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>내정보</strong></li>
			</c:if>
			<c:if test="${cnt!=0 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=0">내정보</a></li>
			</c:if>
			<c:if test="${cnt==1 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>정보수정</strong></li>
			</c:if>
			<c:if test="${cnt!=1 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=1">정보
						수정</a></li>
			</c:if>
			<c:if test="${cnt==2 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>단어</strong></li>
			</c:if>
			<c:if test="${cnt!=2 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=2">단어</a></li>
			</c:if>
			<c:if test="${cnt==3 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>내 글 관리</strong></li>
			</c:if>
			<c:if test="${cnt!=3 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=3">내 글 관리</a></li>
			</c:if>
			<c:if test="${cnt==4 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>지원 목록</strong></li>
			</c:if>
			<c:if test="${cnt!=4 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=4">지원 목록</a></li>
			</c:if>

			<c:if test="${cnt==5 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>시험 정보</strong></li>
			</c:if>
			<c:if test="${cnt!=5 }">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=5">시험 정보</a></li>
			</c:if>
			<c:if test="${cnt==6 || cnt==7 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>회원 탈퇴</strong></li>
			</c:if>
			<c:if test="${cnt!=6 and cnt!=7}">
				<li class="profile_list"><a href="User?cmd=user_info&cnt=6">회원 탈퇴</a></li>
			</c:if>
		</ul>

		<c:if test="${cnt == 0 }">
			<c:if test="${!empty userinfo }">
				<table class="profile_table">
					<tr class="profile_tbl">
						<td colspan="6" rowspan="4" class="img"><img
							class="profile_img" src="User/Img/plzimg.png">
							<button>이미지추가</button></td>
						<td class="profile_name">이름</td>
						<td class="profile_info">${userinfo.name}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">아이디</td>
						<td class="profile_info">${userinfo.userid}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">이메일</td>
						<td class="profile_info">${userinfo.email}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">전화번호</td>
						<td class="profile_info">${userinfo.tell}</td>
					</tr>
				</table>

				<table class="profile_table">
					<tr class="profile_tbl">
						<td class="profile_name01">닉네임</td>
						<td class="profile_info01">${userinfo.nickname}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">포인트</td>
						<td class="profile_info01">${userinfo.point}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">시험점수</td>
						<td class="profile_info01">${userinfo.test}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">관심업종</td>
						<td class="profile_info01">${userinfo.job}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">고용형태</td>
						<td class="profile_info01">${userinfo.employee}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">자기소개서</td>
						<td class="profile_info01">${userinfo.filename}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">주소</td>
						<td class="profile_info01">${userinfo.address}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">거주경험</td>
						<td class="profile_info01"><c:if
								test="${userinfo.residence == 1}"> 있음</c:if> <c:if
								test="${userinfo.residence == 0}"> 없음</c:if></td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">관심분야</td>
						<td class="profile_info01">${userinfo.interest}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">가입일자</td>
						<td class="profile_info01">${userinfo.regdate.substring(0,10)}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">최근접속일</td>
						<td class="profile_info01">${userinfo.recent.substring(0,10)}</td>
					</tr>


				</table>
			</c:if>
		</c:if>


		<c:if test="${cnt == 1 }">
			<c:if test="${!empty userinfo }">
				<form method="POST" name="user_frm" action="User?cmd=user_modify">
					<table class="memberForm-tbl">
						<caption>개인 정보</caption>
						<tbody>
							<tr>
								<th scope="row"><label for="userid">&nbsp;&nbsp;
										아이디</label></th>
								<td class="profile_info03"><span class="sero"></span>
									${userinfo.userid}</td>
								<input type="hidden" name="userid" value="${userinfo.userid}">
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="username"><img
										src="User/Img/red_star_spot.png"> 이름</label></th>
								<td>${userinfo.name}</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="pass"><img
										src="User/Img/red_star_spot.png"> 현재 비밀번호</label></th>
								<td><input class="input-text" type="password" name="pass"
									id="pass" placeholder="8~16자 영문, 숫자, 특수문자"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="passck"><img
										src="User/Img/red_star_spot.png"> 새 비밀번호</label></th>
								<td><input class="input-text" type="password" name="passck"
									id="passck"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="passck"><img
										src="User/Img/red_star_spot.png"> 새 비밀번호 확인</label></th>
								<td><input class="input-text" type="password"
									name="passck2" id="passck2"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="email1"><img
										src="User/Img/red_star_spot.png"> 이메일</label></th>
								<td>${userinfo.email }</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="tel">연락처</label></th>

								<td><select name="tel" id="tel">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
										<input class="input-tel" name="tel2" type="text"
										value="${userinfo.tell.substring(3,userinfo.tellsize)}">
								</select> <br> <small class="email-info-box"> 연락처는 '-' 없이
										입력해 주세요. </small></td>

							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="job"><img
										src="User/Img/red_star_spot.png"> 관심 업종 </label></th>
								<td><select name="job" id="job">
										<option value="IT"
											<c:if test="${userinfo.job eq 'IT'}"> selected="selected"</c:if>>IT</option>
										<option value="호텔"
											<c:if test="${userinfo.job eq'호텔'}"> selected="selected"</c:if>>호텔</option>
										<option value="무역"
											<c:if test="${userinfo.job eq'무역'}"> selected="selected"</c:if>>무역</option>
										<option value="요식업"
											<c:if test="${userinfo.job eq'요식업'}"> selected="selected"</c:if>>요식업</option>
										<option value="관광"
											<c:if test="${userinfo.job eq'관광'}"> selected="selected"</c:if>>관광</option>
										<option value="번역"
											<c:if test="${userinfo.job eq'번역'}"> selected="selected"</c:if>>번역</option>
								</select> <br> <small class="email-info-box"> </small></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="hobby"><img
										src="User/Img/red_star_spot.png"> 관심 분야</label></th>
								<td>
									<div class="checkbox" name="checkbox">
										${userinfo.interestHtml }</div> <small> * 하나 이상 선택해 주세요. </small>
								</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="join-btn-wrap">
										<input class="join" type="button" value="수정"
											onclick="modify_send()">
									</div>
								</td>
							</tr>
						</tbody>

					</table>
				</form>
			</c:if>
		</c:if>


		<c:if test="${cnt == 2 }">

			<!-- - 선택된 단어가 없습니다 -  -->
			
			
		* 전체 999 개의 단어중 2개의 단어를 선택하셨습니다.<br>
			<div class="comm-wrap">
				<table class="tab-list">
					<thead>
						<tr class="tab-01">
							<td class="tab-02">번호</td>
							<td class="tab-02" colspan="1">단어</td>
							<td class="tab-02">뜻</td>
							<td class="tab-02">체크</td>
						</tr>
						<tr>
							<td class="line-wrap" colspan="4">
								<div class="line"></div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr class="tab-01">
							<td class="tab-03">1</td>
							<td class="tab-03" colspan="1"><a href="">まがる</a></td>
							<td class="tab-03">1.구부러지다. 2.굽다. 3.방향을 바꾸다, 돌다.</td>
							<td class="tab-03"><input type="checkbox"></td>
						</tr>
						<tr>
							<td class="line-wrap" colspan="4">
								<div class="line"></div>
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr class="tab-01">
							<td class="tab-03">2</td>
							<td class="tab-03" colspan="1"><a href="">まがる [명사]</a></td>
							<td class="tab-03">아이론, 다리미, 머리카락을 지지는 ...</td>
							<td class="tab-03"><input type="checkbox"></td>
						</tr>
						<tr>
							<td class="line-wrap" colspan="4">
								<div class="line"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<input class="join" type="button" value="암기 완료"
					onclick="company_send()">
			</div>
		</c:if>

		<c:if test="${cnt == 3 }">
			<c:if test="${empty list }">
				- 작성된 글이 없습니다 - 
			</c:if>
			<c:if test="${!empty list }">
			
			* 전체 ${totcount } 개의 글을 작성하셨습니다.
			<div class="countck"></div>
				<div class="comm-wrap">
					<table class="tab-list">
						<thead>
							<tr class="tab-01">
								<td class="tab-02">번호</td>
								<td class="tab-02" colspan="1">제목</td>
								<td class="tab-02">작성일</td>
								<td class="tab-02">조회수</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="4">
									<div class="line"></div>
								</td>
							</tr>
						</thead>
						<c:forEach var="list" items="${list }">

							<tbody>
								<tr class="tab-01">
									<td class="tab-03">${list.idx }</td>
									<td class="tab-03" colspan="1"><a href="Community?cmd=community_view&idx=${community.idx }&page=${page}">
									${list.subject }</a></td>
									<td class="tab-03">${list.regdate.substring(0,10) }</td>
									<td class="tab-03">${list.readcnt }</td>
								</tr>
								<tr>
									<td class="line-wrap" colspan="4">
										<div class="line"></div>
									</td>
								</tr>
							</tbody>

						</c:forEach>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="5">
						<tr>&nbsp;
						</tr>
						<tr>
							<td colspan="5">
								<div align="center">${pageSkip}</div>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
		</c:if>

		<c:if test="${cnt == 4 }">
			- 지원 정보가 없습니다 -
		</c:if>
		<c:if test="${cnt == 5}">
			<c:if test="${empty list }">
				- 시험 기록이 없습니다 - 
			</c:if>
			<c:if test="${!empty list }">
			 * 회원님은 총 ${totcount } 번의 테스트 시험을 보셨습니다.<br>
			 가장 높은 점수와 등급이 기록됩니다.
				<div class="comm-wrap">
					<table class="tab-list">
						<thead>
							<tr class="tab-01">
								<td class="tab-02">번호</td>
								<td class="tab-02" colspan="1">점수</td>
								<td class="tab-02">등급</td>
								<td class="tab-02">날짜</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="4">
									<div class="line"></div>
								</td>
							</tr>
						</thead>
						<c:forEach var="list" items="${list }">

							<tbody>
								<tr class="tab-01">
									<td class="tab-03">${list.rnum }</td>
									<td class="tab-03" colspan="1">${list.score }</td>
									<td class="tab-03" style="color: blue;">${list.lv }</td>
									<td class="tab-03">${list.day.substring(0,10) }</td>
								</tr>
								<tr>
									<td class="line-wrap" colspan="4">
										<div class="line"></div>
									</td>
								</tr>
							</tbody>

						</c:forEach>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="5">
						<tr>&nbsp;
						</tr>
						<tr>
							<td colspan="5">
								<div align="center">${pageSkip}</div>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
		</c:if>
		<c:if test="${cnt == 6 }">
			<h4>회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요.</h4>
			<div class="del_notice">탈퇴 신청시 즉시 탈퇴 처리됩니다.</div>
			<div class="del_notice">회원정보 및 서비스와 관련된 포인트가 모두 삭제됩니다.</div>
			<div class="del_notice">탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.</div>
			<div class="del_notice">모든 데이터 복구는 불가능하므로 회원 탈퇴는 신중히 판단해주세요.</div>
			<div class="del_notice">게시물 삭제 등을 원하는 경우 반드시 삭제 처리 후 탈퇴를
				신청해주세요.</div>
			<br>
			<div class="del_notice" style="margin-bottom: 50px;">아래 확인 버튼을
				누르면 탈퇴가 진행됩니다.</div>

			<a href="User?cmd=user_info&cnt=7"><input class="join"
				type="button" value="확인"></a>
		</c:if>
		<c:if test="${cnt == 7 }">
			<form action="User?cmd=user_delete" name="userDelete" method="post">
				<h4>정말로 회원 탈퇴를 하시겠습니까 ?</h4>
				<h4>회원 탈퇴시 모든 데이터는 사라지며, 복구 할 수 없습니다.</h4>
				<h4>탈퇴를 위한 비밀번호를 입력하여 주세요.</h4>
				<br> <input class="input-text" type="password" name="pass"
					id="pass" placeholder="8~16자 영문, 숫자, 특수문자"><br> <br>
				<input class="join" type="button" value="탈퇴" onclick="sendDelete()">
			</form>
		</c:if>


	</div>

</body>
</html>

<%@ include file="/Include/footer.jsp"%>
