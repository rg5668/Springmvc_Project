<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">

<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

 
  <div align="center" style="margin-bottom: 1%; margin-top: 1%;">
	<h3><b>${hsub.room_name }</b><br>객실 등록 완료되었습니다.</h3>
	</div>
  
 
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="<%=request.getContextPath()%>/himg/${hsub.room_img}" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">객실사진</a></font></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hsub.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>룸코드</td>
		<td><input type="text" name="room_code" id="room_code" value="${hsub.room_code }"readonly></td>
		</tr>
		
		<tr>
		<td>방이름</td>
		<td><input type="text" name="room_name" id="room_name" value="${hsub.room_name }"readonly></td>
		</tr>
		
		<tr>
		<td>가격</td>
		<td><input type="text" name="price" id="price" value="${hsub.price }"readonly></td>
		</tr>
		
		<tr>
		<td colspan="3">
		<a href="<%=request.getContextPath() %>/admin/hsinsertForm?hotel_code=${hsub.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 49%;" value="객실추가등록"></a>
		<a href="<%=request.getContextPath() %>/admin/hslistForm?hotel_code=${hsub.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 49%;" value="완료"></a>
     	</tr>
	
</table>


</body>
</html>