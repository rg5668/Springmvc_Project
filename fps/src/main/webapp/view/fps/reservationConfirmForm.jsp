<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<div class="w3-container w3-margin-left">
	<div>
	<p style="font-size: 20px"><b>���೻��</b>
	<p>���� ������ Ȯ�� �� �� �ֽ��ϴ�.</p>
	</div>
	
</div>

	<div class="w3-bar" style="margin-bottom: 20px; width: 100%; background-color: black; color: white; font-size: 13px;">
		<button class="w3-bar-item w3-button" style="margin-left: 20px" onclick="openCity('London')">������</button>
		<button class="w3-bar-item w3-button" onclick="openCity('Paris')">�̿���
			����</button>
		<button class="w3-bar-item w3-button" onclick="openCity('Tokyo')">��ҵ�
			����</button>
	</div>

	<div id="London" class="w3-container city">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<tr>
				<td>
					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>���� ����</h3>
						</header>

						<div class="w3-container">
							<p>2021�� 4�� 11�� ~ 2021�� 4�� 12��</p>
							<hr>
							<img src="/ActionPro/w3images/incheon.jpg" alt="Avatar">
							<p>
								��ȭ��ȣ : 010-1234-1234&emsp;
								<button onclick="location='cancelForm.jsp'">���� ����ϱ�</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">�� ����</button>

					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>���� ����</h3>
						</header>

						<div class="w3-container">
							<p>2021�� 4�� 13�� ~ 2021�� 4�� 16��</p>
							<hr>
							<img src="/ActionPro/w3images/jeju.jpg" alt="Avatar">
							<p>
								��ȭ��ȣ : 010-1234-1234&emsp;
								<button onclick="location='cancelForm.jsp'">���� ����ϱ�</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">�� ����</button>

					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="Paris" class="w3-container city" style="display: none">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<tr>
				<td>

					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>�ܲ� ����</h3>
						</header>

						<div class="w3-container">
							<p>2021�� 4�� 11�� ~ 2021�� 4�� 12��</p>
							<hr>
							<img src="/ActionPro/w3images/gangwondo.jpg" alt="Avatar">
							<p>
								��ȭ��ȣ : 010-1234-1234&emsp;
								<button>�ı� �ۼ��ϱ�</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">�� ����</button>

					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="Tokyo" class="w3-container city" style="display: none">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<tr>
				<td>
					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>�߼� ����</h3>
						</header>

						<div class="w3-container">
							<p>2021�� 4�� 11�� ~ 2021�� 4�� 12��</p>
							<hr>
							<img src="/ActionPro/w3images/gwangju.jpg" alt="Avatar">
							<p>
								��ȭ��ȣ : 010-1234-1234&emsp;
								<button>�ٽ� ���� �ϱ�</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">�� ����</button>

					</div>
				</td>
			</tr>
		</table>
	</div>

	<script>
		function openCity(cityName) {
			var i;
			var x = document.getElementsByClassName("city");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			document.getElementById(cityName).style.display = "block";
		}
	</script>

</body>
</html>