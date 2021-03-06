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

.input-text01 {
	width: 400px;
	height: 24px;
	padding: 0 0 0 12px;
	border: 1px solid grey;
	border-radius: 3px;
}

.input-text02 {
	width: 390px;
	height: 290px;
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

.countck {
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
			alert('?????? ????????? ?????? ?????? ????????? ?????????.');
			return false;
		} else {
		}
	}

	function company_send() {
		if (user_frm.userid.value == '') {
			alert('???????????? ????????? ?????????.');
			user_frm.userid.focus();
			return;
		} else if (user_frm.pass.value == '') {
			alert('??????????????? ????????? ?????????.');
			user_frm.pass.focus();
			return;
		} else if (user_frm.passck.value == '') {
			alert('???????????? ????????? ????????? ?????????.');
			user_frm.passck.focus();
			return;
		} else if (user_frm.pass.value != user_frm.passck.value) {
			alert('???????????? ????????? ???????????? ????????????.');
			user_frm.passck.focus();
			return;
		} else if (user_frm.username.value == '') {
			alert('????????? ????????? ?????????..');
			user_frm.username.focus();
			return;
		} else if (user_frm.email1.value == '') {
			alert('???????????? ????????? ?????????.');
			user_frm.email1.focus();
			return;
		} else if (user_frm.email2.value == '') {
			alert('???????????? ????????? ?????????.');
			user_frm.email2.focus();
			return;
		} else if (user_frm.tel2.value == '') {
			alert('???????????? ????????? ?????????.');
			user_frm.tel2.focus();
			return;
		}

		if (checkbox() == false) {
			return;
		}

		user_frm.action = 'User?cmd=user_insert';
		user_frm.submit();
	}

	function sendDelete() {
		userDelete.submit();
	}

	function question_send() {
		if (question.subject.value == '') {
			alert('????????? ????????? ?????????.');
			question.subject.focus();
			return;
		} else if (question.contents.value == '') {
			alert('?????? ????????? ?????????.');
			question.contents.focus();
			return;
		}
		
		question.submit();
	}
</script>

</head>
<body>

	<c:if test="${empty userinfo and empty companyinfo }">
		<script>
			alert("???????????? ????????? ????????? ?????????.");
			location.href = "Index";
		</script>
	</c:if>
	<div class="profile">
		<ul class="profile_ul">
			<c:if test="${cnt==0 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>?????????</strong></li>
			</c:if>
			<c:if test="${cnt!=0 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=0">?????????</a></li>
			</c:if>
			<c:if test="${cnt==1 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>??????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=1 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=1">??????
						??????</a></li>
			</c:if>
			<c:if test="${cnt==2 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>??????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=2 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=2">??????
						??????</a></li>
			</c:if>
			<c:if test="${cnt==3 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>??????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=3 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=3">??????
						??????</a></li>
			</c:if>
			<c:if test="${cnt==4 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>?????????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=4 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=4">?????????
						??????</a></li>
			</c:if>

			<c:if test="${cnt==5 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>??????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=5 }">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=5">??????
						??????</a></li>
			</c:if>
			<c:if test="${cnt==6 || cnt==7 }">
				<li class="profile_list" style="border-bottom: 2px solid black;"><strong>??????
						??????</strong></li>
			</c:if>
			<c:if test="${cnt!=6 and cnt!=7}">
				<li class="profile_list"><a href="User?cmd=company_info&cnt=6">??????
						??????</a></li>
			</c:if>
		</ul>

		<c:if test="${cnt == 0 }">
			<c:if test="${!empty companyinfo }">
				<table class="profile_table">
					<tr class="profile_tbl">
						<td colspan="6" rowspan="4" class="img"><img
							class="profile_img" src="User/Img/plzimg.png">
							<button>???????????????</button></td>
						<td class="profile_name">?????? ??????</td>
						<td class="profile_info">${companyinfo.name}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">?????????</td>
						<td class="profile_info">${companyinfo.companyid}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">?????????</td>
						<td class="profile_info">${companyinfo.email}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name">????????????</td>
						<td class="profile_info">${companyinfo.tell}</td>
					</tr>
				</table>

				<table class="profile_table">
					<tr class="profile_tbl">
						<td class="profile_name01">?????? ??????</td>
						<td class="profile_info01">${companyinfo.ceo}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">?????? ??????</td>
						<td class="profile_info01"><c:if
								test="${companyinfo.companyck == 0 }">?????????</c:if> <c:if
								test="${companyinfo.companyck == 1 }">??????</c:if></td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">??????</td>
						<td class="profile_info01">${companyinfo.address}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">????????????</td>
						<td class="profile_info01"><a
							href="http://${companyinfo.homepage}">${companyinfo.homepage}</a></td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">?????? ??????</td>
						<td class="profile_info01">?????????</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">????????????</td>
						<td class="profile_info01">${companyinfo.regdate.substring(0,10)}</td>
					</tr>
					<tr class="profile_tbl">
						<td class="profile_name01">???????????????</td>
						<td class="profile_info01">${companyinfo.lastdate.substring(0,10)}</td>
					</tr>


				</table>
			</c:if>
		</c:if>


		<c:if test="${cnt == 1 }">
			<c:if test="${!empty companyinfo }">
				<form method="POST" name="user_frm" action="User?cmd=user_insert">
					<table class="memberForm-tbl">
						<caption>?????? ??????</caption>
						<tbody>
							<tr>
								<th scope="row"><label for="userid">&nbsp;&nbsp;
										?????????</label></th>
								<td><span class="sero"></span> ${companyinfo.companyid }</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="username"><img
										src="User/Img/red_star_spot.png"> ?????? ??????</label></th>
								<td>${companyinfo.name}</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="pass"><img
										src="User/Img/red_star_spot.png"> ?????? ????????????</label></th>
								<td><input class="input-text" type="password" name="pass"
									id="pass" placeholder="8~16??? ??????, ??????, ????????????"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="passck"><img
										src="User/Img/red_star_spot.png"> ??? ????????????</label></th>
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
										src="User/Img/red_star_spot.png"> ??? ???????????? ??????</label></th>
								<td><input class="input-text" type="password" name="passck"
									id="passck"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="email1"><img
										src="User/Img/red_star_spot.png"> ?????????</label></th>
								<td>${companyinfo.email }</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="tel">?????????</label></th>
								<td><select name="tel" id="tel">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
										<input class="input-tel" name="tel2" type="text"
										value="${companyinfo.tell.substring(4,13) }">
								</select> <br> <small class="email-info-box"> ???????????? '-' ??????
										????????? ?????????. </small></td>

							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="job"><img
										src="User/Img/red_star_spot.png"> ????????????</label></th>
								<td><input class="input-text" type="text" name="homepage"
									id="passck" value="${companyinfo.homepage }"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="hobby"><img
										src="User/Img/red_star_spot.png"> ??????</label></th>
								<td><input class="input-text" type="text" name="address"
									id="passck" value="${companyinfo.address }"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="join-btn-wrap">
										<input class="join" type="button" value="??????"
											onclick="company_send()">
									</div>
								</td>
							</tr>
						</tbody>

					</table>
				</form>
			</c:if>
		</c:if>


		<c:if test="${cnt == 2 }">
			-?????? ????????? -
		</c:if>

		<c:if test="${cnt == 3 }">
			<c:if test="${empty list }">
				- ????????? ?????? ???????????? - 
			</c:if>
			<c:if test="${!empty list }">
			
			* ?????? ${totcount } ?????? ?????? ?????? ?????????????????????.
			<div class="countck"></div>
				<div class="comm-wrap">
					<table class="tab-list">
						<thead>
							<tr class="tab-01">
								<td class="tab-02">?????? ??????</td>
								<td class="tab-02" colspan="1">??????</td>
								<td class="tab-02">????????????</td>
								<td class="tab-02">??????</td>
								<td class="tab-02">??????</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="5">
									<div class="line"></div>
								</td>
							</tr>
						</thead>
						<c:forEach var="list" items="${list }">

							<tbody>
								<tr class="tab-01">
									<td class="tab-03"><a href="">${list.idx }</a></td>
									<td class="tab-03" colspan="1"><a href="">
									${list.category}</a></td>
									<td class="tab-03">${list.employtype }</td>
									<td class="tab-03">${list.loc }</td>
									<td class="tab-03">${list.salary }</td>
								</tr>
								<tr>
									<td class="line-wrap" colspan="5">
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
			- ?????? ????????? ???????????? -
		</c:if>
		<c:if test="${cnt == 5}">
			* ????????? ????????? ???????????? ???????????? ?????? ????????????.
			<div class="countck"></div>
			<div class="comm-wrap">
				<form method="POST" name="question" action="User?cmd=question">
					<table class="tab-list">
						<tbody>
							<tr>
								<th scope="row"><label for="userid">&nbsp;&nbsp;
										?????????</label></th>
								<td><span class="sero"></span> ${companyinfo.companyid }</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="username">&nbsp;&nbsp;
										?????? ??????</label></th>
								<td>${companyinfo.name}</td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="username"><img
										src="User/Img/red_star_spot.png">&nbsp;&nbsp; ??????</label></th>
								<td><input type="text" name="subject" id="passck"
									class="input-text01"></td>
							</tr>
							<tr>
								<td class="line-wrap" colspan="2">
									<div class="line"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="username"><img
										src="User/Img/red_star_spot.png">&nbsp;&nbsp; ?????? ??????</label></th>
								<td><textarea name="contents" id="passck"
										class="input-text02" style="resize: none; padding: 10px;"></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="join-btn-wrap">
										<input class="join" type="button" value="??????"
											onclick="question_send()" style="margin-bottom: 20px">
									</div>
								</td>
							</tr>
						</tbody>

					</table>
				</form>
			</div>

		</c:if>
		<c:if test="${cnt == 6 }">
			<h4>??????????????? ???????????? ?????? ?????? ????????? ??? ??????????????????.</h4>
			<div class="del_notice">?????? ????????? ?????? ?????? ???????????????.</div>
			<div class="del_notice">???????????? ??? ???????????? ????????? ???????????? ?????? ???????????????.</div>
			<div class="del_notice">?????? ??? ????????? ??????????????? ?????? ?????? ?????? ????????? ???????????????.</div>
			<div class="del_notice">?????? ????????? ????????? ?????????????????? ?????? ????????? ????????? ??????????????????.</div>
			<div class="del_notice">????????? ?????? ?????? ????????? ?????? ????????? ?????? ?????? ??? ?????????
				??????????????????.</div>
			<br>
			<div class="del_notice" style="margin-bottom: 50px;">?????? ?????? ?????????
				????????? ????????? ???????????????.</div>

			<a href="User?cmd=company_info&cnt=7"><input class="join"
				type="button" value="??????"></a>
		</c:if>
		<c:if test="${cnt == 7 }">
			<form action="User?cmd=company_delete" name="userDelete"
				method="post">
				<h4>????????? ?????? ????????? ?????????????????? ?</h4>
				<h4>?????? ????????? ?????? ???????????? ????????????, ?????? ??? ??? ????????????.</h4>
				<h4>????????? ?????? ??????????????? ???????????? ?????????.</h4>
				<br>
				<input class="input-text" type="password" name="pass" id="pass"
					placeholder="8~16??? ??????, ??????, ????????????"><br>
				<br> <input class="join" type="button" value="??????"
					onclick="sendDelete()">
			</form>
		</c:if>


	</div>

</body>
</html>

<%@ include file="/Include/footer.jsp"%>