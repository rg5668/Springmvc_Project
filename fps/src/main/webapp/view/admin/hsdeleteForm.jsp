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
		alert("ȣ���ڵ带 �Է��ϼ���.");
		f.hotel_code.focus();
		return;
	} else if (f.hotel_name.value=="") {
		alert("�̸��� �Է��ϼ���.")
		f.hotel_name.focus();
		return;
	} else if (f.hotel_tel.value=="") {
		alert("��ȣ�� �Է��ϼ���.")
		f.hotel_tel.focus();
		return;
	} else if (f.hotel_addr.value=="") {
		alert("�ּҸ� �Է��ϼ���.")
		f.hotel_addr.focus();
		return;
	}  else if (f.hotel_intro.value=="") {
		alert("������ �Է��ϼ���.")
		f.hotel_intro.focus();
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

$(document).ready(function() {

    values = '${hotel_option1}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
    
    values = '${hotel_option2}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
} );
</script>
<title>Insert title here</title>
</head>
<body>

<form  action="hsdelete"  method="post" name="f"  enctype="multipart/form-data">
  
  <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>���� ����</b>
  </div>
  
  <input type="hidden" name="room_img" value="">
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="<%=request.getContextPath()%>/himg/${hsub.room_img}" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">���ǻ���</a></font></td>
		
		<td >ȣ���ڵ�</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hsub.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>���ڵ�</td>
		<td><input type="text" name="room_code" id="room_code" value="${hsub.room_code }"readonly></td>
		</tr>
		
		<tr>
		<td>���̸�</td>
		<td><input type="text" name="room_name" id="room_name" value="${hsub.room_name }"readonly></td>
		</tr>
		
		<tr>
		<td>����</td>
		<td><input type="text" name="price" id="price" value="${hsub.price }"readonly></td>
		</tr>
		
		<tr>
		<td colspan="3"> 	
     	<input type="submit" value="���һ���" class="w3-button w3-black w3-margin-bottom" style="width: 100%">
     	</td>
     	</tr>
	
</table>
</form>

</body>
</html>