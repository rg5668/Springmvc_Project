<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

<form  action="hinsert"  method="post" name="f" enctype="multipart/form-data">
  
  <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>���� ���</b>
  </div>
  
  <input type="hidden" name="hotel_img" value="">
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">ȣ�ڻ������</a></font></td>
		
		<td >ȣ���ڵ�</td>
		<td><input type="text" name="hotel_code" id="hotel_code"></td>
		</tr>
		
		<tr>
		<td>ȣ���̸�</td>
		<td><input type="text" name="hotel_name" id="hotel_name"></td>
		</tr>
		
		<tr>
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel"></td>
		</tr>
		
		<tr>
		<td>�ּ�</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr"></td>
		</tr>
		
		<tr>
		<td>����</td>
		<td colspan="2">

		<select name="area_code" id="area_code" style="width: 100%">              
              <option value="20">����</option>
              <option value="31">��⵵</option>
              <option value="32">��õ</option>
              <option value="33">������</option>
              <option value="42">����</option>
              <option value="51">�λ�</option>
              <option value="53">�뱸</option>
              <option value="62">����</option>
              <option value="64">���ֵ�</option>
        </select>
		</td>
		</tr>
		
		<tr>
		<td>�����׸�</td>
		<td colspan="2">

		<select name="theme_code" id="theme_code" style="width: 100%">              
              <option value="1">��
              <option value="2">����
              <option value="3">����
              <option value="4">�ܿ�
        </select>
		</td>
		</tr>
		
		
		<tr>
		<td>�ܺοɼ�</td>
		<td colspan="2">

		<label><input type="checkbox" value="������" name="hotel_option1" id="hotel_option1">������</label>
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
		<td>���οɼ�</td>
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
		<textarea cols="50" rows="5" name="hotel_intro" id="hotel_intro"></textarea></td>
		</tr>
		
		
		

		<tr>
		<td colspan="3">
     	<a href="javascript:hinsert_submit()">
     	<input type="button" value="���ҵ��" class="w3-button w3-black w3-margin-bottom" style="width: 100%"></a></td>
     	</tr>
	
</table>
</form>

</body>
</html>