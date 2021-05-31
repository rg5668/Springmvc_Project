<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<title>QnA</title>
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
		<nav class="w3-col s3 w3-large w3-padding"
			style="width: 200px; font-weight: bold;">

			<div class="w3-bar-block">
				<div class="w3-container">
    				<h3 class="w3-padding-32"><b>고객센터</b></h3>
  				</div>
			
				<a href="<%=request.getContextPath()%>/view/fps/noticeForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">공지사항</a> 
				<a href="<%=request.getContextPath()%>/view/fps/eventForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">이벤트</a> 
				<a href="<%=request.getContextPath()%>/view/fps/askForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">문의사항</a> 
				<a href="<%=request.getContextPath()%>/view/fps/qnaForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">자주묻는질문</a> 
			</div>
		</nav>

		
		<table class="w3-col s9 w3-table-all w3-section">
			<caption class="w3-section w3-wide" style="font: 20px bold;">자주묻는질문</caption>
			<tr>
				<th>
					<div class="w3-container">
						<button onclick="openSection('Question')" class="w3-btn w3-block w3-black w3-left-align">
							자주 묻는 질문 1
						</button>
					
						<div id="Question" class="w3-container w3-hide">
						  <h4> 질문 ... </h4>
						  <p> 답 ...</p>
						</div>
					</div>
					
					
				</th>
			</tr>
		</table>

	</div>


	<script>
		function openSection(id) {
		  var x = document.getElementById(id);
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else { 
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
	</script>
</body>
</html>
