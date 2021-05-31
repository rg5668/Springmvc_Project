<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">
<script>
$(document).ready(function() {
/* 	alert('${hotel4s.hotel_option1}') */
    values = '${hotel4s.hotel_option1}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    
    if(values.length==1)
    {
    	 $("input:checkbox[value="+values[0]+"]").prop("checked", true);
    }
    
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
    
    values = '${hotel4s.hotel_option2}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    
    if(values.length==1)
    {
    	 $("input:checkbox[value="+values[0]+"]").prop("checked", true);
    }
    
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }

    
} );
</script>
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
	open("pictureimgForm", "", op);
}

function doSomething() {
    var url = document.forms[0].elements['hotel_code'].value;
    
    return false;
}

</script>
<title>Insert title here</title>
</head>
<body>

<form  action="hupdate"  method="post" name="f"  enctype="multipart/form-data">
  
  <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>���� ����</b>
  </div>
  
  <input type="hidden" name="hotel_img" value="">
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="<%=request.getContextPath()%>/himg/${hotel4s.hotel_img}" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">ȣ�ڻ������</a></font></td>
		
		<td >ȣ���ڵ�</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"readonly></td>
		</tr>
		
		<tr>
		<td>ȣ���̸�</td>
		<td><input type="text" name="hotel_name" id="hotel_name" value="${hotel4s.hotel_name }"></td>
		</tr>
		
		<tr>
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel" value="${hotel4s.hotel_tel }"></td>
		</tr>
		
		<tr>
		<td>�ּ�</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr" value="${hotel4s.hotel_addr }"></td>
		</tr>
		
		<tr>
		<td>����</td>
		<td colspan="2">

		<select name="area_code" id="area_code" style="width: 100%">              
              <option value="20" <c:if test="${hotel4s.area_code eq '20' }">selected</c:if>>����</option>
              <option value="31" <c:if test="${hotel4s.area_code eq '31' }">selected</c:if>>��⵵</option>
              <option value="32" <c:if test="${hotel4s.area_code eq '32' }">selected</c:if>>��õ</option>
              <option value="33" <c:if test="${hotel4s.area_code eq '33' }">selected</c:if>>������</option>
              <option value="42" <c:if test="${hotel4s.area_code eq '42' }">selected</c:if>>����</option>
              <option value="51" <c:if test="${hotel4s.area_code eq '51' }">selected</c:if>>�λ�</option>
              <option value="53" <c:if test="${hotel4s.area_code eq '53' }">selected</c:if>>�뱸</option>
              <option value="62" <c:if test="${hotel4s.area_code eq '62' }">selected</c:if>>����</option>
              <option value="64" <c:if test="${hotel4s.area_code eq '64' }">selected</c:if>>���ֵ�</option>
        </select>
		</td>
		</tr>
		
		<tr>
		<td>�����׸�</td>
		<td colspan="2">

		<select name="theme_code" id="theme_code" style="width: 100%">              
              <option value="1" <c:if test="${hotel4s.theme_code eq '1' }">selected</c:if>>��</option>
              <option value="2" <c:if test="${hotel4s.theme_code eq '2' }">selected</c:if>>����</option>
              <option value="3" <c:if test="${hotel4s.theme_code eq '3' }">selected</c:if>>����</option>
              <option value="4" <c:if test="${hotel4s.theme_code eq '4' }">selected</c:if>>�ܿ�</option>
        </select>
		</td>
		</tr>
		
		
		
		
		<tr>
		<td>����ü�</td>
		<td colspan="2">
		<label><input type="checkbox" value="������" name="hotel_option1" id="hotel_option1" >������</label>
		<label><input type="checkbox" value="���뽺��" name="hotel_option1" id="hotel_option1">���뽺��</label>
		<label><input type="checkbox" value="�뷡��" name="hotel_option1" id="hotel_option1">�뷡��</label>
		<label><input type="checkbox" value="����������" name="hotel_option1" id="hotel_option1">����������</label>
		<label><input type="checkbox" value="�������" name="hotel_option1" id="hotel_option1">�������</label>
		<label><input type="checkbox" value="ī��" name="hotel_option1" id="hotel_option1">ī��</label>
		<label><input type="checkbox" value="������" name="hotel_option1" id="hotel_option1">������</label>
		<label><input type="checkbox" value="������" name="hotel_option1" id="hotel_option1">������</label>
		
		</td>
		</tr>
		
		<tr>
		<td>���ǽü�</td>
		<td colspan="2">

		<label><input type="checkbox" value="��������" name="hotel_option2" id="hotel_option2">��������</label>
		<label><input type="checkbox" value="������" name="hotel_option2" id="hotel_option2">������</label>
		<label><input type="checkbox" value="����̱�" name="hotel_option2" id="hotel_option2">����̱�</label>
		<label><input type="checkbox" value="����" name="hotel_option2" id="hotel_option2">����</label>
		<label><input type="checkbox" value="��ǿ�ǰ" name="hotel_option2" id="hotel_option2">��ǿ�ǰ</label>
		<label><input type="checkbox" value="tv" name="hotel_option2" id="hotel_option2">tv</label>
		<label><input type="checkbox" value="�����" name="hotel_option2" id="hotel_option2">�����</label>
		
		
		</td>
		</tr>
		
		<tr>
		<td>���ܼҰ�</td>
		<td colspan="2">
		<textarea cols="50" rows="5" name="hotel_intro" id="hotel_intro">${hotel4s.hotel_intro }</textarea></td>
		</tr>
		
		
		

		<tr>
		<td colspan="3"> 	
     	<input type="submit" value="���ҵ��" class="w3-button w3-black w3-margin-bottom" style="width: 100%">
     	</td>
     	</tr>
	
</table>
</form>

</body>
</html>