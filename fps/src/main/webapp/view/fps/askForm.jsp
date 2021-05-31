<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<title>Ask</title>
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
    				<h3 class="w3-padding"><b>������</b></h3>
  				</div>
			
				<a href="<%=request.getContextPath()%>/view/fps/noticeForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">��������</a> 
				<a href="<%=request.getContextPath()%>/view/fps/eventForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">�̺�Ʈ</a> 
				<a href="<%=request.getContextPath()%>/view/fps/askForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">���ǻ���</a> 
				<a href="<%=request.getContextPath()%>/view/fps/qnaForm.jsp"
					class="w3-bar-item w3-button w3-hover-white">���ֹ�������</a> 
			</div>
		</nav>
		

		<table class="w3-col s9 w3-table-all w3-section">
			<caption class="w3-section w3-wide" style="font: 20px bold;">���ǻ���</caption>
			
			<tr>
				<th>
					<form>
						<div class="w3-section">
        					<label>�̸�</label>
        					<input class="w3-input w3-border" type="text" name="Name" required>
      					</div>
				        <div class="w3-section">
				        	<label>�̸���</label>
				        	<input class="w3-input w3-border" type="text" name="Email" required>
				        </div>
				        <div class="w3-section">
					        <label>���ǻ���</label>
					        <!-- <input class="w3-input w3-border" type="text" name="Message" required> -->
					        <textarea rows="10" cols="30" class="w3-input w3-border" name="Message" required></textarea>
				        </div>
      					<button type="submit" class="w3-button w3-block w3-padding-large w3-black w3-margin-bottom">�����ϱ�</button>						
					</form>
				</th>
			</tr>

		</table>

	</div>

</body>
</html>
