<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">

<meta charset="UTF-8">
<script>
function hinsert_submit() {
	
	
	var f = document.f;
	
	
	if(f.hotel_code.value=="") {
		alert("호텔코드를 입력하세요.");
		f.hotel_code.focus();
		return;
	} else if (f.hotel_name.value=="") {
		alert("이름을 입력하세요.")
		f.hotel_name.focus();
		return;
	} else if (f.hotel_tel.value=="") {
		alert("번호를 입력하세요.")
		f.hotel_tel.focus();
		return;
	} else if (f.hotel_addr.value=="") {
		alert("주소를 입력하세요.")
		f.hotel_addr.focus();
		return;
	}  else if (f.hotel_intro.value=="") {
		alert("내용을 입력하세요.")
		f.hotel_intro.focus();
		return;
	} 
	
	f.submit();
}

function win_upload() {
	var op = "width=500, height=150, left=50, top=150";
	open("pictureimgForm", "", op);
}

function doSomething() {
    var url = document.forms[0].elements['hotel_code'].value;
    
    return false;
}

$(document).ready(function() {

    values = '${hotel_option1}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }
    
    values = '${hotel_option2}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }
} );
</script>
<title>Insert title here</title>
</head>
<body>

<form  action="hdelete"  method="post" name="f"  enctype="multipart/form-data">
  
  <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>숙소 삭제</b>
  </div>
  
  <input type="hidden" name="hotel_img" value="">
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="<%=request.getContextPath()%>/himg/${hotel4s.hotel_img}" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">호텔사진</a></font></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>호텔이름</td>
		<td><input type="text" name="hotel_name" id="hotel_name" value="${hotel4s.hotel_name }"readonly></td>
		</tr>
		
		<tr>
		<td>전화번호</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel" value="${hotel4s.hotel_tel }"readonly></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr" value="${hotel4s.hotel_addr }"readonly></td>
		</tr>
		
		<tr>
		<td colspan="3"> 	
     	<input type="submit" value="숙소삭제" class="w3-button w3-black w3-margin-bottom" style="width: 100%">
     	</td>
     	</tr>
	
</table>
</form>

</body>
</html>