<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모리 :: 기업 회원 가입</title>
   	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Serif+KR:wght@900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap');

    body {
        margin: 0;
        background-color:  rgb(251,251,251);
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

    .btn,.join{
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

    .btn, .join, .cancle {cursor: pointer;}


</style>
    
<script>

	$(document).ready(function(){
		$('#userid').on('keyup', function(){
			$.ajax({
				type:'POST',
				url:'idcheck',
				data :{
					'userid' : $('#userid').val()
				},
				success:function(data){
					if(data==1) {
						$('#id_check').text('이미 사용중인 아이디입니다.')
						$('#id_check').css('color', 'red')						
					}else if (data == 0){
						$('#id_check').css('color', 'blue')
						$('#id_check').text('사용 가능한 아이디입니다.')						
					}else if (data == 3) {
						$('#id_check').text('아이디가 너무 짧습니다.')
						$('#id_check').css('color', 'red')
					}
				}
			})
		})
	})
	
	
	function email() {
        if (company_frm.email3.value !='1') {
            company_frm.email2.value = company_frm.email3.value;
            document.getElementById('email2').readOnly = true;
        }else {
            company_frm.email2.value = '';
            document.getElementById('email2').readOnly = false;
        }
    }

    function company_send() {
        if (company_frm.userid.value=='') {
            alert('아이디을 입력해 주세요.');
            company_frm.userid.focus();
            return;
        }else if (company_frm.pass.value=='') {
            alert('비밀번호를 입력해 주세요.');
            company_frm.pass.focus();
            return;
        }else if (company_frm.passck.value=='') {
            alert('비밀번호 확인을 입력해 주세요.');
            company_frm.passck.focus();
            return;
        }else if (company_frm.pass.value != company_frm.passck.value) {
            alert('비밀번호 확인이 일치하지 않습니다.');
            company_frm.passck.focus();
            return;
        }else if (company_frm.companyname.value=='') {
            alert('기업명을 입력해 주세요..');
            company_frm.companyname.focus();
            return;
        }else if (company_frm.ceooname.value=='') {
            alert('대표명을 입력해 주세요..');
            company_frm.ceoname.focus();
            return;

        }else if (company_frm.email1.value=='') {
            alert('이메일을 입력해 주세요.');
            company_frm.email1.focus();
            return;
        }else if (company_frm.email2.value=='') {
            alert('이메일을 입력해 주세요.');
            company_frm.email2.focus();
            return;
        }else if (company_frm.tel2.value=='') {
            alert('관리자 연락처를 입력해 주세요.');
            company_frm.tel2.focus();
            return;
        }else if (company_frm.addr.value=='') {
        	alert('주소를 입력해 주세요.');
            company_frm.addr.focus();
            return;
        }

        company_frm.action='Company?cmd=company_insert_pro';
        company_frm.submit();
    }

    function cancle() {
        var con = confirm('작성하신 내용이 사라집니다.\n이전 페이지로 이동하시겠습니까?')

        if (con == true) {
            history.back();
        }
    }
</script>
</head>
<body>
	
	<%@ include file="/Include/topmenu.jsp" %>
	
    <div class="memberForm-tbl-wrap">
        <div class="memberForm-top">
            <h2>기업 회원가입</h2>
        </div>
        <form name="company_frm" method="POST" onsubmit="return false">
            <table class="memberForm-tbl">
                <caption>기업 정보</caption>
                <tbody>
                    <tr>
                        <th scope="row"><label for="userid"><img src="Company/Img/red_star_spot.png"> 아이디</label></th>
                        <td>
                            <input class="input-text" type="text" name="userid" id="userid" placeholder="6~16자 영문, 숫자">
                            <small id="id_check" style="margin-left: 10px; color: red"></small>
                        </td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="pass"><img src="Company/Img/red_star_spot.png"> 비밀번호</label></th>
                        <td><input class="input-text" type="password" name="pass" id="pass" placeholder="8~16자 영문, 숫자, 특수문자"></td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="passck"><img src="Company/Img/red_star_spot.png"> 비밀번호 확인</label></th>
                        <td><input class="input-text" type="password" name="passck" id="passck"></td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="companyname"><img src="Company/Img/red_star_spot.png"> 기업명</label></th>
                        <td><input class="input-text" type="text" name="companyname" id="companyname"></td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><img src="Company/Img/red_star_spot.png"><label for="ceoname"> 대표명</label></th>
                        <td><input class="input-text" type="text" name="ceooname" id="ceoname"></td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr style="height: 70px;">
                        <th scope="row"><label for="email1"><img src="Company/Img/red_star_spot.png"> 관리자 이메일</label></th>
                        <td>
                            <input class="input-text" type="text" name="email1" id="email1">
                            <span>@</span>
                            <input class="input-text" type="text" name="email2" id="email2">
                            <select name="email3" id="email3" onchange="email()">
                                <option value='1'>직접입력</option>
                                <option value='naver.com'>naver.com</option>
                                <option value='gmail.com'>gmail.com</option>
                                <option value='nate.com'>nate.com</option>
                                <option value='hanmail.net'>hanmail.net</option>
                            </select>
                            <br>
                            <small class="email-info-box">
                                * 비밀번호 분실 시 확인을 위한 메일 주소입니다.
                            </small>
                        </td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="tel"> 관리자 연락처</label></th>
                        <td>
                            <select name="tel" id="tel">
                                <option>010</option>
                                <option>011</option>
                                <option>016</option>
                                <option>017</option>
                                <option>018</option>
                                <option>019</option>
                            </select>
                            <input class="input-tel" type="text" name="tel2">
                            <br>
                            <small class="email-info-box">
                                * 연락처는 '-' 없이 입력해 주세요.
                            </small>
                        </td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="addr"><img src="Company/Img/red_star_spot.png"> 주소</label></th>
                        <td>
                            <input class="input-addr" type="text" name="addr" id="addr">
                            <br>
                            <small class="email-info-box">
                                * 영어 주소를 입력해 주세요.
                            </small>
                        </td>
                    </tr>
                    <tr>
                        <td class="line-wrap" colspan="2">
                            <div class="line"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="homepage">&nbsp; 홈페이지</label></th>
                        <td>
                            <input class="input-addr" type="text" name="homepage" id="homepage">
                            <br>
                            <small class="email-info-box">
                            </small>
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
                                <input class="join" type="button" value="회원가입" onclick="company_send()">
                                <input class="cancle" type="button" value="취소" onclick="cancle()">
                            </div>
                        </td>
                    </tr>
    
                </tbody>
    
            </table>
        </form>

    </div>
	
	<%@ include file="/Include/footer.jsp" %>
</body>
</html>