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
		<input type="hidden" name="res_seq" value="${res.res_seq}">
		<input type="hidden" name="user_id" value="${res.user_id}">
		<table width="200" cellpadding="5" cellspacing="2" border="0"
			align="center">
			<caption><h2>예약 취소</h2></caption>
			<tr>
				<td colspan="2">
					<div class="w3-card-4" align="center"
						style="height: 100%; width: 100%">

						<header class="w3-container w3-light-grey">
							<h3>${res.hotel_name}</h3>
						</header>

						<div class="w3-container">
							<p>${res.sdate} ~ ${res.edate}</p>
							<hr>
							
						</div>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="2">위 예약을 취소합니까?</td>
			</tr>
			<tr>
				<td colspan="1"><input class="w3-button w3-black" type="submit" value="예약 취소하기"></td>
			</tr>
			
		</table>
	</form>



</body>
</html>