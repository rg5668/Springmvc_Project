<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html><html><head><meta charset="EUC-KR"><title>회원 목록 조회</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mem.css"></head>
<script type="text/javascript">
   function del(user_id) {
	    if (confirm(user_id + "님을 탈퇴하시겠습니까?")) {
	       location.href="memdelete?user_id="+user_id;	     	
	    }   }  </script>
<body>
	<div class="w3-display-container w3-container" >
  		<p style="font-size: 20px"><b>FPS 회원 목록</b>
  	</div>
  

<table style="width: 90%; margin-bottom: 2%;" align="center">


 <tr><th>아이디</th><th>이름</th><th>생일</th><th>전화</th><th>이메일</th><th>주소</th><th>수정 및 탈퇴</th></tr>
<c:forEach var="m" items="${list}">

<tr>
  <td><a href="memberInfo?id=${m.user_id}">${m.user_id}</a></td>
  <td>${m.name}</td>
  <td>${m.birth}</td>
  <td>${m.tel}</td>
  <td>${m.email}</td>
  <td>${m.addr}</td>
  
  <td><a href="memupdateForm?user_id=${m.user_id}">
  <input type=button class="w3-button w3-black" value="수정"></a>
  
  <c:if test="${m.getUser_id() ne 'admin'}">
  <a href="javascript:del('${m.user_id}')">
  <input type=button class="w3-button w3-black" value="강제탈퇴"></a>
  </c:if>  
  </td></tr>
 
</c:forEach>
  
  </table></body></html> 
  