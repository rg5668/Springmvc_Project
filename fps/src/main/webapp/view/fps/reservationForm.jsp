<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ����</title>
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
										35.837143, 128.558612); // ��ġ�� ���� �浵
								var Y_point = 37.49910820531467; // Y ��ǥ
								var X_point = 127.0281094537545; // X ��ǥ
								var zoomLevel = 18; // ������ Ȯ�� ���� : ���ڰ� Ŭ���� Ȯ�������� ŭ
								var markerTitle = "KICķ�۽�"; // ���� ��ġ ��Ŀ�� ���콺�� �������� ��Ÿ���� ����
								var markerMaxWidth = 300; // ��Ŀ�� Ŭ�������� ��Ÿ���� ��ǳ���� �ִ� ũ��

								// ��ǳ�� ����
								var contentString = '<div>' + '<h2>KICķ�۽�</h2>'
										+ '<p>�ְ��� ����. KICķ�۽��Դϴ�.</p>' +

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
					<h1>���� Ȯ�μ�</h1>


					<div class="w3-display-container" style="height: 230px;">
						<h4>��������</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> �����ȣ<br> �����ڸ�<br> ������ ����ó<br> ���� ����<br>
						���� ����<br> ���� ����<br> ��� ����<br>
					</div>


					<div class="w3-display-container" style="height: 150px;">
						<h4>���� ����</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> ���Ҹ�<br> ���ǵ��<br> �ּ� <br>

					</div>


					<div class="w3-display-container" style="height: 150px;">
						<h4>���� ����</h4>
						<!-- <div class="w3-border-bottom"></div> -->
						<br> �������� ���� ���ݾ�<br> ����Ʈ ���ݾ�<br> PG �����ݾ�<br>
						��Ż� ���� <br>

					</div>
				</div>
			</td>
		</tr>
		<tr align="center">
			<td><button onclick="location='reservationConfirm.jsp'"
					class="w3-button w3-black">���� ����</button>
				<button onclick="location='cancelForm.jsp'"
					class="w3-button w3-black">���� ���</button></td>
		</tr>
	</table>

</body>


</html>