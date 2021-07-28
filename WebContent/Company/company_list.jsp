<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/e7462ea469.js"
   crossorigin="anonymous"></script>
<title>모리 :: 기업 공고</title>

<style>
@import
   url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
   ;

@import
   url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap')
   ;

.container {
   margin-top: 50px;
   width: 900px;
   margin-left: auto;
   margin-right: auto;
   justify-self: center;
   display: grid;
   grid-template-columns: 33.3% 33.3% 33.3%;
   grid-template-rows: 145px 145px 145px;
   font-family: 'Nanum Gothic', sans-serif;
}

.container a {
   text-decoration: none;
}

.job-box {
   padding: 20px 30px;
   padding-top: 22px;
   border: 1px solid black;
   margin-right: 20px;
   margin-bottom: 20px;
   border-radius: 4px;
}

.job-box:hover {
   border: 3px solid rgba(0, 102, 255, 0.726);
   box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.158);
}

.com-loc {
   font-size: 12.5px;
   font-weight: bold;
   color: #f54337;
}

.com-line {
   margin: 10px auto;
   height: 1px;
   width: 100%;
   border-bottom: 1px solid black;
}

.com-name {
   color: black;
   margin-top: 14px;
   font-weight: bold;
}

.com-info {
   margin-top: 6px;
   font-size: 12px;
   color: #3371d1;
}

.bottom-area {
   width: 850px;
   margin: 0 auto;
}

.paging-area {
   text-align: center;
   font-family: 'Nanum Gothic', sans-serif;
}

.search-area {
   margin-top: 20px;
   text-align: center;
}

.comm-search {
   width: 280px;
   height: 40px;
}

.page-area {
   margin-top: 15px;
   text-align: center;
   font-size: 12px;
}

.bottom-area {
   margin-top: 25px;
}

.search-area {
   margin-left: 190px;
   height: 40px;
   margin-top: 15px;
   text-align: center;
}

.select-search {
   font-size: 12px;
   height: 31.2px;
   padding-left: 5px;
   font-family: 'Nanum Gothic', sans-serif;
   border: 1px solid #999;
   margin-top: 2px;
}

.company-search {
   outline: none;
   border: none;
   border-left: 4px solid black;
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
   border: 4px solid black;
   border-radius: none;
   background-color: black;
   color: aliceblue;
   width: 48px;
   height: 29px;
   font-family: 'Nanum Gothic', sans-serif;
}

.btn-comm-write {
   border: 1px solid #999;
   margin-left: 135px;
   margin-right: 20px;
   padding-bottom: 5px;
   padding-top: 1px;
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

.search-area2 {
   margin-right: 37px;
   height: 40px;
   margin-top: 15px;
   text-align: center;
}
</style>

</head>
<body>
   <%@ include file="/Include/topmenu.jsp"%>
   <div class="container">
      <c:forEach var="company" items="${list }">
         <a href="Company?cmd=company_view&idx=${company.idx }">
            <div class="job-box">
               <div class="com-loc">${company.loc }</div>
               <div class="com-line"></div>
               <div class="com-name">${company.name }</div>
               <div class="com-info">업종 : ${company.category } | 학력 제한 :
                  ${company.edulv }</div>
            </div>
         </a>
      </c:forEach>
      <c:if test="${empty list }">
         <div class="job-box">
            <div class="com-loc">미등록</div>
            <div class="com-line"></div>
            <div class="com-name">등록된 기업이 없습니다.</div>
            <div class="com-info">www.morikorea.com</div>
         </div>
      </c:if>

   </div>
   <div style="width: 800px; margin-left: auto; margin-right: auto;"
      class="bottom-area">
      <div class="paging-area">${pageSkip }</div>
      <c:if test="${!empty companyinfo }">
         <div class="search-area">
            <select class="select-search">
               <option>지역</option>
               <option>업종</option>
               <option>고용 형태</option>
            </select> <input class="company-search" type="text"><input
               class="btn-search" type="submit" value="검색"> <span
               class="btn-comm-write"> <a href="Company?cmd=company_write"
               style="text-decoration: none; color: black;"> <i
                  class="fas fa-edit"></i>공고 등록
            </a>
            </span>
         </div>
      </c:if>


      <c:if test="${empty companyinfo }">
         <form  name="com_search_frm" method="post" onsubmit="return false">
            <div class="search-area2">
               <select name="search" class="select-search">
                  <option value="loc">지역</option>
                  <option value="category">업종</option>
                  <option value="employtype">고용 형태</option>
               </select>
               <input name="key" class="company-search" type="text">
               <input class="btn-search" type="submit" value="검색" onclick="company()">
            </div>
         </form>
      </c:if>
   </div>

   <%@ include file="/Include/footer.jsp"%>
</body>
<script>
   function company() {
      if (com_search_frm.key.value == '') {
         alert('내용을 입력해 주세요.');
         com_search_frm.key.focus();
         return;
      }
      
      com_search_frm.action = 'Company?cmd=company_list';
      com_search_frm.submit();
   }
</script>

</html>