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
	<p style="font-size: 20px"><b>예약내역</b>
	<p>예약 내용을 확인 할 수 있습니다.</p>
	</div>
	
</div>

	<div class="w3-bar" style="margin-bottom: 20px; width: 100%; background-color: black; color: white; font-size: 13px;">
		<button class="w3-bar-item w3-button" style="margin-left: 20px" onclick="openCity('London')">예약중</button>
		<button class="w3-bar-item w3-button" onclick="openCity('Paris')">이용한
			내역</button>
		<button class="w3-bar-item w3-button" onclick="openCity('Tokyo')">취소된
			내역</button>
	</div>

	<div id="London" class="w3-container city">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<tr>
				<td>
					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>해피 숙박</h3>
						</header>

						<div class="w3-container">
							<p>2021년 4월 11일 ~ 2021년 4월 12일</p>
							<hr>
							<img src="/ActionPro/w3images/incheon.jpg" alt="Avatar">
							<p>
								전화번호 : 010-1234-1234&emsp;
								<button onclick="location='cancelForm.jsp'">예약 취소하기</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">상세 보기</button>

					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="w3-card-4 w3-section" style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>축하 숙박</h3>
						</header>

						<div class="w3-container">
							<p>2021년 4월 13일 ~ 2021년 4월 16일</p>
							<hr>
							<img src="/ActionPro/w3images/jeju.jpg" alt="Avatar">
							<p>
								전화번호 : 010-1234-1234&emsp;
								<button onclick="location='cancelForm.jsp'">예약 취소하기</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">상세 보기</button>

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
							<h3>꿀꿀 숙박</h3>
						</header>

						<div class="w3-container">
							<p>2021년 4월 11일 ~ 2021년 4월 12일</p>
							<hr>
							<img src="/ActionPro/w3images/gangwondo.jpg" alt="Avatar">
							<p>
								전화번호 : 010-1234-1234&emsp;
								<button>후기 작성하기</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">상세 보기</button>

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
							<h3>추석 숙박</h3>
						</header>

						<div class="w3-container">
							<p>2021년 4월 11일 ~ 2021년 4월 12일</p>
							<hr>
							<img src="/ActionPro/w3images/gwangju.jpg" alt="Avatar">
							<p>
								전화번호 : 010-1234-1234&emsp;
								<button>다시 예약 하기</button>
							</p>
						</div>

						<button class="w3-button w3-block w3-dark-grey"
							onclick="location='reservationForm.jsp'">상세 보기</button>

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