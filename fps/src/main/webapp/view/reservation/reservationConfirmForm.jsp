<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>

	<div class="w3-container w3-margin-left">
		<div>
			<p style="font-size: 20px">
				<b>���೻��</b>
			<p>���� ������ Ȯ�� �� �� �ֽ��ϴ�.</p>
		</div>

	</div>

	<div class="w3-bar"
		style="margin-bottom: 20px; width: 100%; background-color: black; color: white; font-size: 13px;">
		<button class="w3-bar-item w3-button" style="margin-left: 20px"
			onclick="openCity('1')">������</button>
		<button class="w3-bar-item w3-button" onclick="openCity('2')">������
			����</button>
			<button class="w3-bar-item w3-button" onclick="openCity('3')">�̿���
			����</button>
		<button class="w3-bar-item w3-button" onclick="openCity('4')">��ҵ�
			����</button>
	</div>


	<c:forEach var="b" items="${res}">
		<c:if test="${b.res_status eq '����'}">

			<div class="1 w3-container city">
				<table width="800" cellpadding="5" cellspacing="2" border="0"
					align="center">
					<tr>
						<td>
							<div class="w3-card-4 w3-section"
								style="height: 100%; width: 100%">

								<header class="w3-container w3-light-grey">
									<h3>${b.hotel_name }</h3>
								</header>

								<div class="w3-container">
									<p>${b.sdate}~${b.edate}</p>
									<hr>
									<img width="100%" height="100%"
										src="<%=request.getContextPath()  %>/${b.hotel_img}"
										alt="Avatar">
									<p>
										��ȭ��ȣ : ${b.tel}&emsp;
										<button class="w3-button w3-black">
											<a href="cancelForm?user_id=${login}&res_seq=${b.res_seq}">�������</a>
										</button>
									</p>
								</div>

								<button class="w3-button w3-block w3-dark-grey">
									<a href="reservationForm?user_id=${login}&res_seq=${b.res_seq}">��
										����</a>
								</button>

							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</c:forEach>

	<c:forEach var="b" items="${res}">
		<c:if test="${b.res_status eq '����'}">
			<div class="2 w3-container city" style="display: none">
				<table width="800" cellpadding="5" cellspacing="2" border="0"
					align="center">
					<tr>
						<td>

							<div class="w3-card-4 w3-section"
								style="height: 100%; width: 100%">

								<header class="w3-container w3-light-grey">
									<h3>${b.hotel_name }</h3>
								</header>

								<div class="w3-container">
									<p>${b.sdate}~${b.edate}</p>
									<hr>
									<img width="100%" height="100%"
										src="<%=request.getContextPath()  %>/${b.hotel_img}"
										alt="Avatar">
									<p>
										��ȭ��ȣ : ${b.tel}&emsp;
									</p>
								</div>
								<button class="w3-button w3-block w3-dark-grey">
									<a href="reservationForm?user_id=${login}&res_seq=${b.res_seq}">��
										����</a>
								</button>

							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</c:forEach>
	
	<c:forEach var="b" items="${res}">
		<c:if test="${b.res_status eq '�Ϸ�'}">
			<div class="3 w3-container city" style="display: none">
				<table width="800" cellpadding="5" cellspacing="2" border="0"
					align="center">
					<tr>
						<td>

							<div class="w3-card-4 w3-section"
								style="height: 100%; width: 100%">

								<header class="w3-container w3-light-grey">
									<h3>${b.hotel_name }</h3>
								</header>

								<div class="w3-container">
									<p>${b.sdate}~${b.edate}</p>
									<hr>
									<img width="100%" height="100%"
										src="<%=request.getContextPath()  %>/${b.hotel_img}"
										alt="Avatar">
									<p>
										��ȭ��ȣ : ${b.tel}&emsp;
										<button class="w3-button w3-black">
											<a href="reviewForm?res_seq=${b.res_seq}">�ı��ۼ�</a>
										</button>
									</p>
								</div>
								<button class="w3-button w3-block w3-dark-grey">
									<a href="reservationForm?user_id=${login}&res_seq=${b.res_seq}">��
										����</a>
								</button>

							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</c:forEach>

	<c:forEach var="b" items="${res}">
		<c:if test="${b.res_status eq '���'}">
			<div class="4 w3-container city" style="display: none">
				<table width="800" cellpadding="5" cellspacing="2" border="0"
					align="center">
					<tr>
						<td>
							<div class="w3-card-4 w3-section"
								style="height: 100%; width: 100%">

								<header class="w3-container w3-light-grey">
									<h3>${b.hotel_name }</h3>
								</header>

								<div class="w3-container">
								<p>������� : ${b.res_date}</p>
									<p>${b.sdate}~${b.edate}</p>
									<hr>
									<img width="100%" height="100%"
										src="<%=request.getContextPath()  %>${b.hotel_img}"
										alt="Avatar">
									<p>
										��ȭ��ȣ : ${b.tel}&emsp;
									</p>
								</div>
								<button class="w3-button w3-block w3-dark-grey">
									<a href="reservationForm?user_id=${login}&res_seq=${b.res_seq}">��
										����</a>
								</button>


							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</c:forEach>
	<script>
		function openCity(cityName) {
			if (cityName == '1') {
				$('.1').show();
				$('.2').hide();
				$('.3').hide();
				$('.4').hide();
			}
			if (cityName == '2') {
				$('.1').hide();
				$('.2').show();
				$('.3').hide();
				$('.4').hide();
			}
			if (cityName == '3') {
				$('.1').hide();
				$('.2').hide();
				$('.3').show();
				$('.4').hide();
			}
			if (cityName == '4') {
				$('.1').hide();
				$('.2').hide();
				$('.3').hide();
				$('.4').show();
			}
		}
	</script>

</body>
</html>