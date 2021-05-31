<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="EUC-KR"><title>게시물 목록 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
* {font-family: 'Noto Sans KR', sans-serif; }
</style>
<script src="/maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/code.jquery.com/jquery-1.11.1.min.js"></script>


</head>
<body>
<!-- !PAGE CONTENT! -->


  <!-- Push down content on small screens -->
 
  
  <!-- Top header -->
<div class="main">
	<div class="go_main">
	<a href="<%=request.getContextPath() %>/mainForm">
		<img src="/fps/w3images/logo.png" style="height: 70px; width : 70px; background-color: black; margin-top: 30px">
	</a>
	</div>
   <div class="service-form" align="center">

	<form action="<%=request.getContextPath() %>/member/login" name="f" method="post">
	<table class="tab">
		<tr>
        	<td> <input type="text" class="user_id" name="user_id" placeholder=" 아이디">
        	</td></tr>
        
        <tr>
        <td><input type="password" class="password" name="password" placeholder=" 비밀번호"></td>
        </tr>
        
   	</table>
	<div align="center"></div>
 <button type="submit" name="login" class="w3-button w3-black" style="width: 36%; margin-top: 10px">로그인</button></form>
 <div class="btn-u" style="font-size: 12px; margin-top: 10px">
   <div class="w3-button w3-black" style="border-radius: 5px; width: 100px;"><a href="<%=request.getContextPath() %>/SignupForm">회원가입</a></div>
   <span>|</span>
   <div class="w3-button w3-black" style="border-radius: 5px; width: 100px;"><a href="<%=request.getContextPath() %>/id_findForm">아이디 찾기</a></div>
   <span>|</span>
   <div class="w3-button w3-black" style="border-radius: 5px; width: 100px;"><a href="<%=request.getContextPath() %>/pass_findForm">비밀번호 찾기</a></div>
   </div>
</div>
 



	</div></body>
</html>