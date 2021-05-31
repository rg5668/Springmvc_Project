<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<!-- 회원 탈퇴 폼입니다 -->
<div align="center">
	<img src="/ActionPro/w3images/logo.png" style="height: 70px; width : 70px; background-color: black; margin-top: 30px; margin-bottom: 10px">
	</div>
	
<h4 class="w3-center" style="margin-bottom: 10px"><b>회원 탈퇴</b></h4>

<p class="w3-center">비밀 번호를 입력해주세요</p>
	<form action="delete" name="f" method="post">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="user_id" value="${user_id}">
		<table  width="200" cellpadding="5" cellspacing="2" border="0" align="center">

			<tr>
			<td><input type="password" name="password"></td>
				<td colspan="1"><input type="submit" class="w3-black" value="탈퇴 하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>