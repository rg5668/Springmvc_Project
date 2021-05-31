<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<title>W3.CSS</title>
<body>

<div class="w3-container w3-margin-left w3-margin-top">
<p style="font-size: 20px"><b>내정보</b>
</div>
	<table style="font-size: 14px" align="center">
		
		<tr>
			<td style="width: 120px;"><h6><b>이름</b></h6></td>
			<td>김갑수</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>아이디</b></h6></td>
			<td>test01</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>성별</b></h6></td>
			<td>남성</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>이메일</b></h6></td>
			<td>abc@naver.com</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>생년월일</b></h6></td>
			<td>2000년 01월 01일</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>전화번호</b></h6></td>
			<td>010 - 1234 - 1234</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6><b>주소</b></h6></td>
			<td>경기도 성남시 XXX구 XXX동</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button
					onclick="location='updateForm.jsp'" class="w3-button w3-black"
					style="width: 200px;">회원 정보 수정하기</button>
				<button onclick="location='deleteForm.jsp'"
					class="w3-button w3-black" style="width: 200px;">회원 탈퇴 하기</button></td>
		</tr>
	</table>
</body>
</html>
