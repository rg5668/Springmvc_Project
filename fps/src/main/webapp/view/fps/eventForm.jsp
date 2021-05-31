<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<title>Event</title>
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
						<b>고객센터</b>
					</h3>
				</div>
				<a href="<%=request.getContextPath()%>/view/fps/noticeForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">공지사항</a> <a
					href="<%=request.getContextPath()%>/view/fps/eventForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">이벤트</a> <a
					href="<%=request.getContextPath()%>/view/fps/freQuestion.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">자주묻는질문</a> <a
					href="<%=request.getContextPath()%>/view/fps/QwriteForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">문의사항</a>
			</div>
		</nav>


		<div class="w3-col s9 w3-section">
			<span id="faq-title" style="font-size: 20px;">이벤트</span>
			<div>
				<br>
			</div>
			<table class="w3-col s9 w3-table-all w3-section" style="width: 90%; margin-left: 5%">
				<!-- <caption class="w3-section w3-wide" style="font: 20px bold;">이벤트</caption> -->
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<!-- <th>글내용</th> -->
					<th>시작일</th>
					<th>만료일</th>
				</tr>

				<tr>
					<td>1</td>
					<td>이벤트1</td>
					<td>2021.04.01</td>
					<td>2021.04.20</td>
				</tr>

				<tr>
					<td>0</td>
					<td>이벤트.</td>
					<td>2021.01.01</td>
					<td>2021.04.01</td>
				</tr>

			</table>
		</div>
	</div>

</body>
</html>
