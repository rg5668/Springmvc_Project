<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<title>My page</title>
<body>

	<table style="font-size: 14px" align="center">
		<tr>
			<td><h2>������</h2></td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>�̸�</b>
				</h6></td>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>���̵�</b>
				</h6></td>
			<td>${mem.user_id}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>�������</b>
				</h6></td>
			<td>${mem.birth}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>�̸���</b>
				</h6></td>
			<td>${mem.email}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>��ȭ��ȣ</b>
				</h6></td>
			<td>${mem.tel}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>�ּ�</b>
				</h6></td>
			<td>${mem.addr}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a
				href="updateForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="update"
					value="ȸ�� ���� �����ϱ�"></a>
			<td colspan="2" align="center"><a
				href="deleteForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="delete"
					value="ȸ�� Ż��"></a>
		</tr>
	</table>
</body>
</html>
