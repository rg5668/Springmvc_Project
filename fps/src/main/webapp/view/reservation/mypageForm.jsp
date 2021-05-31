<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<title>My page</title>
<body>

	<table style="font-size: 14px" align="center">
		<tr>
			<td><h2>내정보</h2></td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>이름</b>
				</h6></td>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>아이디</b>
				</h6></td>
			<td>${mem.user_id}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>생년월일</b>
				</h6></td>
			<td>${mem.birth}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>이메일</b>
				</h6></td>
			<td>${mem.email}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>전화번호</b>
				</h6></td>
			<td>${mem.tel}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>주소</b>
				</h6></td>
			<td>${mem.addr}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a
				href="updateForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="update"
					value="회원 정보 수정하기"></a>
			<td colspan="2" align="center"><a
				href="deleteForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="delete"
					value="회원 탈퇴"></a>
		</tr>
	</table>
</body>
</html>
