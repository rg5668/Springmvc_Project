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
			<td colspan="2" align="center"><img width="100%" height="100%"
				src="<%=request.getContextPath() %>/${res.hotel_img}">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<h1>���� Ȯ�μ�</h1>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<h4>��������</h4>
			</td>
		</tr>

		<tr>
			<td width="250px">�����ȣ</td>
			<td>${res.res_seq}</td>
		</tr>
		<tr>
			<td>�����ڸ�</td>
			<td align="left" valign="top">${res.name}</td>
		</tr>
		<tr>
			<td>������ ����ó</td>
			<td>${res.tel}</td>
		</tr>
		<tr>
			<td>���� ����</td>
			<td>����</td>
		</tr>
		<tr>
			<td>���� ����</td>
			<td>${res.sdate}</td>
		</tr>

		<tr>
			<td>��� ����</td>
			<td>${res.edate}</td>
		</tr>
		<tr>
			<td colspan="2">
				<h4>��������</h4>
			</td>
		</tr>
		<tr>
			<td>���Ҹ�</td>
			<td>${res.hotel_name}</td>
		</tr>
		<tr>
			<td>���ǵ��</td>
			<td>${res.room_name}</td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td>${res.hotel_addr}</td>
		</tr>
	
	</table>

</body>


</html>