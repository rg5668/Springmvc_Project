<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.outer {
	width: 800px;
	height: 800px;
	background: #3c40c6;
}

.inner {
	width: 400px;
	height: 400px;
	background: #ff5e57;
}
</style>
</head>
<body>

<!-- 예약 취소 폼입니다 -->
	<form action="cancel" name="f" method="post">
		<input type="hidden" name="num" value="${num}">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<caption><h2>예약 취소</h2></caption>
			<tr>
				<td colspan="2">
					<div class="w3-card-4" align="center"
						style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>꿀꿀 숙박</h3>
						</header>

						<div class="w3-container">
							<p>2021년 4월 11일 ~ 2021년 4월 12일</p>
							<hr>
							<img src="/ActionPro/w3images/gangwondo.jpg" alt="Avatar">
							<p>
								전화번호 : 010-1234-1234&emsp;
								
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">상세 보기</button>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="2">비밀 번호를 입력해주세요</td>

			</tr>
			<tr>
				<td><input type="password" name="pass"></td>
				<td colspan="1"><input type="submit" value="예약 취소하기"></td>
			</tr>
			
		</table>
	</form>



</body>
</html>