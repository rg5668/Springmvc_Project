<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<script>
	function board_submit() {
		var f = document.f;


		if (f.subject.value == "") {
			alert("제목을 입력하세요")
			f.subject.focus();
			return;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요")
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style>
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}

table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 50%;
	border-collapse: collapse;
}

.navpad {
	margin-left: 30px;
	margin-top: 20px;
}

.tabpad {
	width: 75%;
	margin-right: 0px;
	margin-top: 20px;
	float: right;
}

.faq-title {
	border: 2px solid black;
	border-style: none none solid none;
	font-size: 25px;
	font-weight: bold;
}
</style>
</head>
<body class="w3-light-grey">
	<div class="w3-row">
		<!-- Sidebar/menu -->
		<div class="tabpad">
			<div class="w3-col s9 w3-section">
				<br> <br>

				<form action="review" method="post" enctype="multipart/form-data" name="f">
				<input type="hidden" name="res_seq" value='${hj.res_seq}'>
					<table cellpadding="10" class="w3-col s9"
						style="width: 100%; margin-right: 0%; align: right">
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">호텔명</td>
							<td>${hj.hotel_name }</td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">평점</td>
							<td><select name="hotel_grade">
							<option value="5">★★★★★</option>
							<option value="4.5">★★★★☆</option>
							<option value="4">★★★★</option>
							<option value="3.5">★★★☆</option>
							<option value="3">★★★</option>
							<option value="2.5">★★☆</option>
							<option value="2">★★</option>
							<option value="1.5">★☆</option>
							<option value="1">★</option></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">제목</td>
							<td><input type="text" style="width: 100%" name="subject"></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">내용</td>
							<td style="width: 100%"><textarea rows="10" cols="70"
									name="content"></textarea></td>
						</tr>
						<tr style="width: 100%">
							<td colspan="2"><a href="javascript:board_submit()"
								class="w3-button w3-black" style="width: 100%">리뷰등록</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
</html>