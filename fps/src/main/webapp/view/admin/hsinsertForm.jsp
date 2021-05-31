<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">

<meta charset="UTF-8">
<script>
function hsinsert_submit() {
	
	
	var f = document.f;
	
	
	if (f.room_code.value=="") {
		alert("룸코드를 입력하세요.")
		f.room_code.focus();
		return;
	} else if (f.room_name.value=="") {
		alert("룸이름을 입력하세요.")
		f.room_name.focus();
		return;
	} else if (f.price.value=="") {
		alert("가격을 입력하세요.")
		f.price.focus();
		return;
	}  else if (f.guest.value=="") {
		alert("인원을 입력하세요.")
		f.guest.focus();
		return;
	} 
	
	f.submit();
}

function win_upload() {
	var op = "width=500, height=150, left=50, top=150";
	open("subpictureimgForm", "", op);
}

function doSomething() {
    var url = document.forms[0].elements['hotel_code'].value;
    
    return false;
}
</script>
<title>Insert title here</title>
</head>
<body>
  
    <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>객실 등록</b>
  </div>
  
  <input type="hidden" name="room_img" value="">
  
   <table style="width:60%; margin-bottom: 2%;" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="<%=request.getContextPath()%>/himg/${hotel4s.hotel_img}" width="150" height="170"></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>호텔이름</td>
		<td><input type="text" name="hotel_name" id="hotel_name" value="${hotel4s.hotel_name }"></td>
		</tr>
		
		<tr>
		<td>전화번호</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel" value="${hotel4s.hotel_tel }"></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr" value="${hotel4s.hotel_addr }"></td>
		</tr>

	
</table>
  
<!--   <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>객실 등록</b>
  </div> -->
  
  
  
<form  action="hsinsert"  method="get" name="f"  enctype="multipart/form-data">
  <input type="hidden" name="room_img" value="">
  
  <table style="width:60%; margin-bottom: 5%;" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="5" valign="bottom"><img src="" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">객실사진등록</a></font></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>룸코드</td>
		<td><input type="text" name="room_code" id="room_code"></td>
		</tr>
		
		<tr>
		<td>방이름</td>
		<td><input type="text" name="room_name" id="room_name"></td>
		</tr>
		
		<tr>
		<td>가격(1박기준)</td>
		<td><input type="text" name="price" id="price"></td>
		</tr>
		
				
		<tr>
		<td>인원</td>
		<td><input type="text" name="guest" id="guest"></td>
		</tr>
		

		<tr>
		<td colspan="3">
     	<a href="javascript:hsinsert_submit()">
     	<input type="button" value="객실등록" class="w3-button w3-black w3-margin-bottom" style="width: 100%"></a>
     	
     	<%-- <a href="hsinsertForm?hotel_code=${hotel4s.hotel_code }">
     	<input type="button" value="객실추가등록" class="w3-button w3-black w3-margin-bottom" style="width: 49%">
     	</a> --%>
     	</td>
     	</tr>
	
</table>
</form>

</body>
</html>