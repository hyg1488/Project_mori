<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모리 :: 일본어 자가진단</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;600&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap');
    
    .japan-wrap {
        font-family: 'Noto Serif JP', serif;
        width : 850px;
        margin: 0px auto;
        font-size: 15px;
        font-weight: 400;
    }
    
    .japanese-message {
		font-family: 'Nanum Gothic', sans-serif;
    }

    ul {
        padding: 0;
        margin-top: 10px;
    }

    li {
        list-style: none;
    }
    
    .btn-wrap {
    	text-align: center;
    }
    
    #test-btn {
    	width: 80px;
        height: 36px;
        color: white;
        background-color: #3371d1;
        border: 1px solid #3371d1;
        border-radius: 4px;
        outline: none;
        box-shadow: 0px 2px 0 #dad8d8;
        font-family: 
    }


</style>

<script>
	function test_send() {
		test_frm.action = 'Japanese?cmd=result';
		test_frm.submit();
	}
</script>
    
</head>
<body>
	
	<%@ include file="/Include/topmenu.jsp" %>

    <div class="japan-wrap">
    	<div class="japanese-message">
    		* 해당 문제의 결과는 JLPT 혹은 JPT 성적과 직결되지 않습니다.
    	</div>
        <h1>問題</h1>
        <div class="question">
     		問題1,2,3では、(　　　)に入るのに最もよいものを、１・２・３・４から一つ選びなさい。
        </div>
        <br>
        
        <form method="post" name="test_frm">
	       	<c:forEach var="test1" items="${test1 }">
	       		<c:set var="count" value="${count+1 }"/>
	       		<input type="hidden" name="QR${count }" value="${test1.correct }">
		        <div>
	       		${count }.${test1.que }	       	
		        </div>
		        <div>
		            <ul>
		                <li>
		                    <input type="radio" name="Q${count }" id="Q${count }-1" value="1"> <label for="Q${count }-1">${test1.sel1 }</label>
		                </li>
		                <li>
		                    <input type="radio" name="Q${count }" id="Q${count }-2" value="2"> <label for="Q${count }-2">${test1.sel2 }</label>
		                </li>
		                <li>
		                    <input type="radio" name="Q${count }" id="Q${count }-3" value="3"> <label for="Q${count }-3">${test1.sel3 }</label>
		                </li>
		                <li>
		                    <input type="radio" name="Q${count }" id="Q${count }-4" value="4"> <label for="Q${count }-4">${test1.sel4 }</label>
		                </li>
		            </ul>
		
		        </div>
	       	</c:forEach>
	       	<div class="btn-wrap">
		       	<input type="button" value="提出" id="test-btn" onclick="test_send()">
	       	</div>
        </form>
    </div>
   	<%@ include file="/Include/footer.jsp" %>
</body>
</html>