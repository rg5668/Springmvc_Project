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

<!-- ���� ��� ���Դϴ� -->
	<form action="cancel" name="f" method="post">
		<input type="hidden" name="num" value="${num}">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<caption><h2>���� ���</h2></caption>
			<tr>
				<td colspan="2">
					<div class="w3-card-4" align="center"
						style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>�ܲ� ����</h3>
						</header>

						<div class="w3-container">
							<p>2021�� 4�� 11�� ~ 2021�� 4�� 12��</p>
							<hr>
							<img src="/ActionPro/w3images/gangwondo.jpg" alt="Avatar">
							<p>
								��ȭ��ȣ : 010-1234-1234&emsp;
								
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">�� ����</button>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="2">��� ��ȣ�� �Է����ּ���</td>

			</tr>
			<tr>
				<td><input type="password" name="pass"></td>
				<td colspan="1"><input type="submit" value="���� ����ϱ�"></td>
			</tr>
			
		</table>
	</form>



</body>
</html>