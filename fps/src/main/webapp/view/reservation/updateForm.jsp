<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	function input_check(f) {
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center"></div>
	<h4 class="w3-center" style="margin-bottom: 10px">
		<b>회원 정보 수정하기</b>
	</h4>
	<form action="update"
		name="f" method="post" onsubmit="return input_check(this)" >
		<table width="500" cellpadding="5" cellspacing="2" border="0"
			align="center" class="w3-center">

			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" name="password"></td>
			</tr>
			
			<tr>
				<td><b>아이디</b></td>
				<td><input type="text" name="user_id" value="${mem.user_id}" readonly></td>
			</tr>
			<tr>
				<td><b>이름</b></td>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td><b>생년월일</b></td>
				<td><input type="text" name="birth" value="${mem.birth}"></td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td><input type="text" name="email" value="${mem.email}"></td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><input type="text" name="tel" value="${mem.tel}"></td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td><input type="text" name="addr" value="${mem.addr}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정"></td>
			</tr>
		</table>

	</form>
</body>
</html>