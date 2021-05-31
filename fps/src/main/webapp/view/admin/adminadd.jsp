<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta charset="EUC-KR">

<script>
$(document).ready(function() {
/* 	alert('${hotel4s.hotel_option1}') */
    values = '${hotel4s.hotel_option1}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
    
    values = '${hotel4s.hotel_option2}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }

    
} );
</script>
<title>Insert title here</title>
</head>
<body>
	
	<div align="center" style="margin-bottom: 1%; margin-top: 1%;">
	<h3><b>${hotel4s.hotel_name }</b><br>���Ұ� ��� �Ϸ�Ǿ����ϴ�.</h3>
	</div>
	
	  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4">
		<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${hotel4s.hotel_code }"><img src="<%=request.getContextPath()%>/himg/${hotel4s.hotel_img}" style="width: 150px; height: 170px;">
		</a></td>
		
		<td >ȣ���ڵ�</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"></td>
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

		<select name="area_code" id="area_code" style="width: 100%" >              
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
		<td>����ü�</td>
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
		<textarea cols="50" rows="5" name="hotel_intro" id="hotel_intro" >${hotel4s.hotel_intro }</textarea></td>
		</tr>
		
		<tr>
		<td colspan="3">
     	<a href="<%=request.getContextPath() %>/admin/hinsertForm?hotel_code=${hotel4s.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="�����߰����"></a>
		<a href="<%=request.getContextPath() %>/admin/hsinsertForm?hotel_code=${hotel4s.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="���ǵ��"></a>
		<a href="<%=request.getContextPath() %>/admin/hlistForm">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="�Ϸ�"></a>
     	</tr>
     	
     	
</table>


</body>
</html>