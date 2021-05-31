<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ����</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">

<style>
.answer {
	display: none;
	padding-bottom: 30px;
}

.faq-content {
	border-bottom: 1px solid #e0e0e0;
}

.question {
	font-size: 19px;
	padding: 30px 0;
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	width: 100%;
	text-align: left;
}

.question:hover {
	color: #2962ff;
}

[id$="-toggle"] {
	margin-right: 15px;
}
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}
.navpad{margin-left:30px;
		margin-top: 20px;}
		
.tabpad{width: 75%;
		margin-right:0px;
		margin-top: 20px;
		float: right;
		font-size: 12px;
		
		}

.faq-title{
border: 2px solid black;
border-style: none none solid none;
font-size: 25px;
font-weight: bold;
}

h3{
font-weight: bold;
}

ul li {
	list-style-type: none;
}

</style>
</head>
<body class="w3-light-grey">
	<div class="w3-row">
		<!-- Sidebar/menu -->
		<div class="navpad">
		<nav class="w3-col s3 w3-padding" style="width: 17%">
			<div class="w3-bar-block">
				<div class="w3-container">
					<h4 class="w3-padding-16">
						<b>������</b>
					</h4>
				</div>
				<a href="<%=request.getContextPath()%>/board/listForm?board_code=1"
					class="w3-bar-item w3-button w3-white w3-hover-gray">��������</a> <a
					href="<%=request.getContextPath()%>/board/listForm?board_code=2"
					class="w3-bar-item w3-button w3-white w3-hover-gray">�̺�Ʈ</a> <a
					href="<%=request.getContextPath()%>/board/freQuestionForm?board_code=5"
					class="w3-bar-item w3-button w3-white w3-hover-gray">���ֹ�������</a> <a
					href="<%=request.getContextPath()%>/board/listForm?board_code=3"
					class="w3-bar-item w3-button w3-white w3-hover-gray">���ǻ���</a>
			</div>
		</nav></div>
<div class="tabpad">
		<div class="w3-col s8 w3-section">
			<div class = "faq-title" style="text-align: right">
			<h3>���ֹ�������(FAQ)</h3></div>
			<br><br>
			<div class="w3-container" style="width: 100%;">
				<div class="w3-bar w3-black ">
					<button class="w3-bar-item w3-button" style="margin-left: 20px"
						onclick="openCity('Demo1')">Best Help Question & Answer</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo2')">���๮��</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo3')">�̿빮��</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo4')">��������</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo5')">�����Ƽ��</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo6')">ȸ������</button>
				</div>

				<div id="Demo1" class="w3-container cate">
					<div class="faq-content">
						<button class="question" id="que-1">
							<span id="que-1-toggle">+</span><span>������ ����ϰ� �;��.</span>
						</button>
						<div class="answer" id="ans-1">
							������Ҵ� �� �ϴ� ������ > ����/���ų������� ���� �����մϴ�.<br> ����/���� ���� ��� �ȳ���
							���/ȯ�� ������ ���� ó���Ǹ�, ��Ҽ����ᰡ �߻��� ��� ��Ҽ����Ḧ ������ �ݾ����� ȯ�� ó���˴ϴ�.<br>
							�Ϻ� ���ҿ� ���� ��Ұ� ������ �����̳� �ۿ��� ��Ұ� �Ұ��� �� ������ �� ��쿡�� �����ͷ� ��û�� �ֽñ�
							�ٶ��ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-2">
							<span id="que-2-toggle">+</span><span>��Ȯ�� �� ��ġ Ȯ���� �ȵſ�.</span>
						</button>
						<div class="answer" id="ans-2">
							FPS�� ��ġ��� ���񽺷� ��Ȯ�� ��ġ�� �νĵǾ�� �������� �̿��� �����մϴ�. <br> �ܸ����� GPS��
							���� �� ��ġ ���� ��, �ܸ��� ���¿� ���� ��ġ �νĿ� ���ܻ����� �߻��� �� ������,<br> GPS
							�缳���� ���� ��Ȯ�ϰ� Ȯ���� �ֽñ� �ٶ��ϴ�.<br> ���� ���� ������ ��� ������ ���, �ܸ�����
							����Ʈ���� ������Ʈ �Ǵ� ������ ȯ�� Ȯ�� �� ���� ������ ���� �� �缳ġ ��Ź�帳�ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-13">
							<span id="que-13-toggle">+</span><span>ȸ������ ������ ��� �ϳ���?</span>
						</button>
						<div class="answer" id="ans-13">
							�� �ϴ� ������ > �� ���� �������� ȸ�������� ������ �� �ֽ��ϴ�. <br> �г��� ���� ��, �̹�
							������� �г������δ� ������ ������, �ֱ� 30�� ���� 1ȸ�� ���� �����մϴ�.<br> * ȸ������ :
							�г���, �����ڸ�, �޴��� ��ȣ, ��й�ȣ(�̸��� �α��� �ÿ��� ���� ����)
						</div>
					</div>
				</div>

				<div id="Demo2" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-3">
							<span id="que-3-toggle">+</span><span>������ ����ϰ� �;��.</span>
						</button>
						<div class="answer" id="ans-3">
							������Ҵ� �� �ϴ� ������ > ����/���ų������� ���� �����մϴ�.<br> ����/���� ���� ��� �ȳ���
							���/ȯ�� ������ ���� ó���Ǹ�, ��Ҽ����ᰡ �߻��� ��� ��Ҽ����Ḧ ������ �ݾ����� ȯ�� ó���˴ϴ�.<br>
							�Ϻ� ���ҿ� ���� ��Ұ� ������ �����̳� �ۿ��� ��Ұ� �Ұ��� �� ������ �� ��쿡�� �����ͷ� ��û�� �ֽñ�
							�ٶ��ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-4">
							<span id="que-4-toggle">+</span><span>������ �� ��������ϰ� �;��.</span>
						</button>
						<div class="answer" id="ans-4">
							���� ����߿��� FPS �����Ϳ� ������� ��û���ֽñ� �ٶ��ϴ�.<br> ��, ����Ȯ���� �� ��� �����ᰡ
							�߻��ϰų� ������Ұ� �Ұ��� �� �ֽ��ϴ�.
						</div>
					</div>
				</div>


				<div id="Demo3" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-5">
							<span id="que-5-toggle">+</span><span>��Ȯ�� �� ��ġ Ȯ���� �ȵſ�.</span>
						</button>
						<div class="answer" id="ans-5">
							FPS�� ��ġ��� ���񽺷� ��Ȯ�� ��ġ�� �νĵǾ�� �������� �̿��� �����մϴ�. <br> �ܸ����� GPS��
							���� �� ��ġ ���� ��, �ܸ��� ���¿� ���� ��ġ �νĿ� ���ܻ����� �߻��� �� ������,<br> GPS
							�缳���� ���� ��Ȯ�ϰ� Ȯ���� �ֽñ� �ٶ��ϴ�.<br> ���� ���� ������ ��� ������ ���, �ܸ�����
							����Ʈ���� ������Ʈ �Ǵ� ������ ȯ�� Ȯ�� �� ���� ������ ���� �� �缳ġ ��Ź�帳�ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-6">
							<span id="que-6-toggle">+</span><span>����� ���Ҹ� ����ϰ� �;��.</span>
						</button>
						<div class="answer" id="ans-6">
							FPS ���� ���� ���Ͻ� ��� ���ູ���ͷ� ������ �ֽø� ģ���ϰ� �ȳ��帮�ڽ��ϴ�.<br> �� ��ȭ����
							: 02-538-3644 (���ð� : ���� 9��~���� 3��/���ɽð� 12��~13�� ����)
						</div>
					</div>
				</div>

				<div id="Demo4" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-7">
							<span id="que-7-toggle">+</span><span>��밡���� ī�� ������ �����.</span>
						</button>
						<div class="answer" id="ans-7">
							FPS ���� ���� ���� �� ��� ������ ī�� ������ PG��(���ڰ��� �����)���� ���ϴ� �κ��̹Ƿ�<br>
							�Ϻ� ī��� ���������� �Ұ��� �� �ֽ��ϴ�. IBK������� ī���� ��� ��Ͽ��� �񾾸� �����Ͻø� ���� �����Ͽ���
							�̿뿡 ���� ��Ź�帳�ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-8">
							<span id="que-8-toggle">+</span><span>������(�ŷ�������) �߱޹ް� �;��.</span>
						</button>
						<div class="answer" id="ans-8">
							���������� ���������� ����Ǿ� �ִ� ������(�ŷ�������)�� FPS �����ͷ� �����Ͻø� �߱��� �����մϴ�.<br>
							���೻��, �������� ������ �̸��� �ּ�(�Ǵ� FAX��ȣ)�� 1:1���� �Ǵ� īī�� ��������� �����ֽñ� �ٶ��,<br>
							�߱� �Ϸ������ ������ ���� �ִ� 1~2�� �ҿ�ǿ��� �ð� ���� ��Ź�帳�ϴ�.
						</div>
					</div>
				</div>

				<div id="Demo5" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-9">
							<span id="que-9-toggle">+</span><span>Ƽ���� ����ϰ� �;��.</span>
						</button>
						<div class="answer" id="ans-9">
							�̻�� Ƽ���� �ۿ��� ���� ��� �����մϴ�. <br> ��, ��¥�� ������ ��ǰ�� ���� ��Ұ� �Ұ��ϸ� ��ǰ��
							���� ��� �����ᰡ �߻��� �� ������ <br> ���� �� ���/ȯ�� ������ Ȯ�����ֽñ� �ٶ��ϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-10">
							<span id="que-10-toggle">+</span><span>��ȿ�Ⱓ�� �������� Ƽ���� �������
								���߾��.</span>
						</button>
						<div class="answer" id="ans-10">
							��ǰ�� ���� ��Ҽ����� ���� �� ȯ�� �Ǵ� 100% ������ �������� ȯ�ҵ˴ϴ�.<br> ��ȿ�Ⱓ ������
							������ ��ǰ�� ��� ��ȿ�Ⱓ ���� �� 90% ȯ�ҵ˴ϴ�.<br> ��ǰ ������ �� ���/ȯ�� ������
							Ȯ�����ֽñ� �ٶ��, ȯ���� ��ȿ�Ⱓ ���� �� 2~3 ������ ������ �ڵ� ���޵ǿ��� ���� ��Ź�帳�ϴ�.
						</div>
					</div>
				</div>

				<div id="Demo6" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-11">
							<span id="que-11-toggle">+</span><span>������ ���� ���� ���̵� ���� ��
								�ֳ���?</span>
						</button>
						<div class="answer" id="ans-11">
							FPS�� �� ���� ���� ���� ���̵� ����� ���� ����մϴ�.<br> ��, ���� ���̵� ������ ����Ʈ��
							����, ���ų��� ���� ���� �Ǵ� �絵�� �Ұ��ϸ�, ������ ���̵𿡼��� Ȯ�� �����մϴ�.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-12">
							<span id="que-12-toggle">+</span><span>ȸ������ ������ ��� �ϳ���?</span>
						</button>
						<div class="answer" id="ans-12">
							�� �ϴ� ������ > �� ���� �������� ȸ�������� ������ �� �ֽ��ϴ�. <br> �г��� ���� ��, �̹�
							������� �г������δ� ������ ������, �ֱ� 30�� ���� 1ȸ�� ���� �����մϴ�.<br> * ȸ������ :
							�г���, �����ڸ�, �޴��� ��ȣ, ��й�ȣ(�̸��� �α��� �ÿ��� ���� ����)
						</div>
					</div>
				</div>
			</div>

	</div>	
		</div>
	</div>		
</div>

	<script>

	function openCity(cityName) {
		var i;
		var x = document.getElementsByClassName("cate");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(cityName).style.display = "block";
	}
	
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
  
  </script>
</body>
</html>