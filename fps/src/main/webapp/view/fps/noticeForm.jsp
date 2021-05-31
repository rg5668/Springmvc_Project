<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<title>Notice</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">


<body class="w3-light-grey">

	<div class="w3-row">
		<!-- Sidebar/menu -->
		<nav class="w3-col s3 w3-padding" style="width: 20%">
			<div class="w3-bar-block">
				<div class="w3-container">
					<h3 class="w3-padding-16">
						<b>������</b>
					</h3>
				</div>
				<a href="<%=request.getContextPath()%>/view/fps/noticeForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">��������</a> <a
					href="<%=request.getContextPath()%>/view/fps/eventForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">�̺�Ʈ</a> <a
					href="<%=request.getContextPath()%>/view/fps/freQuestion.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">���ֹ�������</a> <a
					href="<%=request.getContextPath()%>/view/fps/QwriteForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">���ǻ���</a>
			</div>
		</nav>

		<div class="w3-col s9 w3-section">
			<span id="faq-title" style="font-size: 20px;">��������</span>
			<div>
				<br>
			</div>

			<!-- �۹�ȣ number, ������ subject, �۳��� content, ���� file1, �ۼ��� regdate, ��ȸ�� readcnt  -->
			<table class="w3-col s9 w3-table-all w3-section" style="width: 90%; margin-left: 5%">
				<!-- <caption class="w3-section w3-wide" style="font: 20px bold;">��������</caption> -->
				<tr>
					<th>�۹�ȣ</th>
					<th>������</th>
					<!-- <th>�۳���</th> -->
					<th>÷������</th>
					<th>�ۼ���</th>
					<th>��ȸ��</th>
				</tr>

				<tr>
					<td>1</td>
					<td>��������1</td>
					<td>����</td>
					<td>2020.04.29</td>
					<td>0</td>
				</tr>

				<tr>
					<td>0</td>
					<td>���������Դϴ�.</td>
					<td>����</td>
					<td>2021.04.28</td>
					<td>1</td>
				</tr>
			</table>
		</div>

	</div>

</body>
</html>
