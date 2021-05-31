<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙소 상세 정보</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyBGHpSWQOFNowv7q8Ygtn62r9tWyVlBXCw"></script>
<style>
#map_ma {
	width: 100%;
	height: 400px;
	clear: both;
	border: solid 1px red;
}
</style>
</head>
<body>
	<table width="700" cellpadding="5" cellspacing="2" border="0"
		align="center">
		<tr>
			<td>
				<div id="map_ma"></div> <script type="text/javascript">
					$(document).ready(
							function() {
								var myLatlng = new google.maps.LatLng(
										35.837143, 128.558612); // 위치값 위도 경도
								var Y_point = 37.49910820531467; // Y 좌표
								var X_point = 127.0281094537545; // X 좌표
								var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
								var markerTitle = "KIC캠퍼스"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
								var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

								// 말풍선 내용
								var contentString = '<div>' + '<h2>KIC캠퍼스</h2>'
										+ '<p>최고의 숙소. KIC캠퍼스입니다.</p>' +

										'</div>';
								var myLatlng = new google.maps.LatLng(Y_point,
										X_point);
								var mapOptions = {
									zoom : zoomLevel,
									center : myLatlng,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								}
								var map = new google.maps.Map(document
										.getElementById('map_ma'), mapOptions);
								var marker = new google.maps.Marker({
									position : myLatlng,
									map : map,
									title : markerTitle
								});
								var infowindow = new google.maps.InfoWindow({
									content : contentString,
									maxWizzzdth : markerMaxWidth
								});
								google.maps.event.addListener(marker, 'click',
										function() {
											infowindow.open(map, marker);
										});
							});
				</script>
			</td>
		</tr>
		<tr>
			<td>
				<div class="w3-container w3-margin">
					<h1>예약 확인서</h1>


					<div class="w3-display-container" style="height: 230px;">
						<h4>예약정보</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> 예약번호<br> 예약자명<br> 예약자 연락처<br> 예약 일자<br>
						투숙 유형<br> 투숙 일자<br> 퇴실 일자<br>
					</div>


					<div class="w3-display-container" style="height: 150px;">
						<h4>숙소 정보</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> 숙소명<br> 객실등급<br> 주소 <br>

					</div>


					<div class="w3-display-container" style="height: 150px;">
						<h4>결제 내역</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> 결제수단 쿠폰 사용금액<br> 포인트 사용금액<br> PG 결제금액<br>
						통신사 할인 <br>

					</div>
				</div>
			</td>
		</tr>
		<tr align="center">
			<td><button onclick="location='reservationConfirm.jsp'"
					class="w3-button w3-black">예약 내역</button>
				<button onclick="location='cancelForm.jsp'"
					class="w3-button w3-black">예약 취소</button></td>
		</tr>
	</table>

</body>


</html>