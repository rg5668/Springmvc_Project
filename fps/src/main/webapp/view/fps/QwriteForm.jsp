<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/writeForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<script>
	function board_submit() {
		var f = document.f;
		if (f.name.value == "") {
			alert("�̸��� �Է��ϼ���")
			f.name.focus();
			return;
		}
		if (f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���")
			f.pass.focus();
			return;
		}

		if (f.subject.value == "") {
			alert("������ �Է��ϼ���")
			f.subject.focus();
			return;
		}

		if (f.content.value == "") {
			alert("������ �Է��ϼ���")
			f.content.focus();
			return;
		}
		f.submit();
	}

	function myAccFunc() {
		var x = document.getElementById("demoAcc");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-grey";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-grey", "");
		}
	}
	function myAccFunc2() {
		var x = document.getElementById("demoAcc2");
		if (x.className.indexOf("w3-hide") == -1) {
			x.className += "";
		} else {
			x.className = x.className.replace(" w3-hide", " w3-show");
		}
	}
</script>
<style>
#faq-title {
	font-size: 20px;
}

.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}

.area1 {
	height: 700px;
	margin: 10px;
	padding: 20px;
	width: 70%;
	position: relative;
	border-radius: 5px;
	left: 25%;
}

table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 50%;
	border-collapse: collapse;
}
</style>
</head>
<body>
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
					href="<%=request.getContextPath()%>/view/fps/Qlist.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">���ǻ���</a>
			</div>
		</nav>

		<div class="w3-col s9 w3-section">
			<span id="faq-title">Q & A</span>
			<div>
				<br>
			</div>

			<form action="write" method="post" enctype="multipart/form-data"
				name="f">
				<table style="width: 105%; text-align: center; ">
					<tr>
						<td style="width: 100%">�۾���</td>
						<td ><input type="text" style="width: 100%" name="name"></td>
						
						
					</tr>
					<tr style="width: 100%">
						<td>��й�ȣ</td>
						<td><input type="password" style="width: 100%" name="pass"></td>
					</tr>
					<tr style="width: 100%">
						<td>����</td>
						<td><input type="text" style="width: 100%" name="subject"></td>
					</tr>
					<tr style="width: 100%">
						<td>����</td>
						<td><textarea rows="10" cols="103" name="content"></textarea></td>
					</tr>
					<tr style="width: 100%">
						<td>÷������</td>
						<td><input type="file" name="file1" ></td>
					</tr>
					<tr style="width: 100%">
						<td colspan="2"><a href="javascript:board_submit()" class="w3-button w3-black" style="width: 100%">�Խù����</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


</body>
</html>