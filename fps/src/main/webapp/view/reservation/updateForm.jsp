<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	function input_check(f) {
		if (f.password.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			f.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center"></div>
	<h4 class="w3-center" style="margin-bottom: 10px">
		<b>ȸ�� ���� �����ϱ�</b>
	</h4>
	<form action="update"
		name="f" method="post" onsubmit="return input_check(this)" >
		<table width="500" cellpadding="5" cellspacing="2" border="0"
			align="center" class="w3-center">

			<tr>
				<td><b>��й�ȣ</b></td>
				<td><input type="password" name="password"></td>
			</tr>
			
			<tr>
				<td><b>���̵�</b></td>
				<td><input type="text" name="user_id" value="${mem.user_id}" readonly></td>
			</tr>
			<tr>
				<td><b>�̸�</b></td>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td><b>�������</b></td>
				<td><input type="text" name="birth" value="${mem.birth}"></td>
			</tr>
			<tr>
				<td><b>�̸���</b></td>
				<td><input type="text" name="email" value="${mem.email}"></td>
			</tr>
			<tr>
				<td><b>��ȭ��ȣ</b></td>
				<td><input type="text" name="tel" value="${mem.tel}"></td>
			</tr>
			<tr>
				<td><b>�ּ�</b></td>
				<td><input type="text" name="addr" value="${mem.addr}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="ȸ������"></td>
			</tr>
		</table>

	</form>
</body>
</html>