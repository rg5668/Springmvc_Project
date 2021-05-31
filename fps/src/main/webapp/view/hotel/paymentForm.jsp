<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/tab.css">
<meta charset="EUC-KR">


<title>����</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			})
			$('#base').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"��");//������ ������ ���� �����ϴ� �κ�
		$('#sale').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"��");
		$('#pay').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"��");
		$('#pay_check').submit(function() //�� ���۽� üũ�ϴ� �Լ�
				{
			if($("input[name='card']:checked").val()==1)//���ο� ī�带 �߰��ϴ� ���
			{
				var cardnumstr="";
				 var size = $("input[name='cardnum']").length;
				 for(i=0;i<size;i++)
				{
					 cardnumstr=cardnumstr+$("input[name='cardnum']").eq(i).val()
				}
				 $('#card_num').val(cardnumstr.replace(",", ""));//�ش簪�� ���簴ü�� �Ķ���ͷ� ����
			}
			else if($("input[name='card']:checked").val()==2)//������ ī���ϰ��
			{
				$('#card_num').val($("select[name='cardnum1']").val());//����ī�� ������ ���簴ü�� �Ķ���ͷ� ����
			}
			});
	})
	
	function sendcoupon()//������ �����ϴ� �Լ�
	{
		var arr=new Array();
		arr=$("select[name=search_coupon]").val().split(',');//value�� 1���ۿ� �������� ,�� 3�� �����Ͽ� ����
		if(arr=='no')
		{
			$('#sale').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"��");
			$('#pay').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"�� �����ϱ�");
			return false;
		}
		if(${hotel.price*diffDays}-${hotel.price*diffDays}*arr[0]>=arr[1])
		{
			$('#sale').val((${hotel.price*diffDays}-arr[1]).toLocaleString('ko-KR')+"��");
			$('#pay').val((${hotel.price*diffDays}-arr[1]).toLocaleString('ko-KR')+"�� �����ϱ�");
		}
		else if(${hotel.price*diffDays}-${hotel.price*diffDays}*arr[0]<arr[1])
		{
			$('#sale').val((${hotel.price*diffDays}*arr[0]).toLocaleString('ko-KR')+"��");
			$('#sale').val((${hotel.price*diffDays}*arr[0]).toLocaleString('ko-KR')+"�� �����ϱ�");
		}
	}

	
</script>
<body>
	<div style="position: relative; left: 30%; margin-top: 20px">
		<h4>
			<b>${hotel.hotel_name}</b>
		</h4>
		<table style="font-size: 13px">
			<tr>
				<td>üũ��</td>
				<td rowspan="3"><img
					src="<%=request.getContextPath()%>/w3images/arrow.png"></td>
				<td>üũ�ƿ�</td>
			</tr>
			<tr>
				<td>${gd.sdate }</td>
				<td>${gd.edate }</td>
			</tr>
			<tr>
				<td>14:00</td>
				<td>11:00</td>
			</tr>
		</table>
		<br />
		<form action="<%=request.getContextPath()%>/hotel/reservation"
			method="post">
			<input type="hidden" name="sdate" value="${gd.sdate }"> <input
				type="hidden" name="edate" value="${gd.edate }"> <input
				type="hidden" name="guest" value="${gd.guest }"> <input
				type="hidden" name="room_code" value="${hotel.room_code }">
			<input type="hidden" name="user_id">
			<h4>��������</h4>
			<table style="font-size: 13px">
				<tr>
					<td>������ �̸�</td><!-- �α��� �Ǿ��ִٸ� �������� �̸��� ��ȭ��ȣ�� �ڵ����� �Է� �ƴϸ� �Է��Ҽ��ְ� -->
					<c:if test="${empty name }">
						<td><input type="text" name="name" required="required"></td>
					</c:if>
					<c:if test="${not empty name }">
						<td><input type="text" value="${name}" name="name" readonly></td>
					</c:if>
				</tr>
				<tr>
					<td>������ �޴���ȭ</td>
					<c:if test="${empty tel }">
						<td><input type="text" name="tel" required="required"></td>
					</c:if>
					<c:if test="${not empty tel }">
						<td><input type="text" value="${tel}" name="tel" readonly></td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty rescheck && rescheck eq res.res_seq }"><!-- �����ϱⰡ ���������� ó���Ǿ��ٸ� ������ ���� �����ߴ��� Ȯ�� -->
						<td colspan="2"><input type="submit" value="�̹� ����Ǿ����ϴ�"
							class="w3-button w3-black" disabled></td>
					</c:if>
					<c:if test="${empty rescheck || rescheck ne res.res_seq }">
						<td colspan="2"><input type="submit" value="�����ϱ�"
							class="w3-button w3-black"></td>
					</c:if>
				</tr>
			</table>
		</form>
		<br />
		<form action="<%=request.getContextPath()%>/hotel/payment"
			method="post" id="pay_check">
			<input type="hidden" name="res_seq" value="${rescheck }">
			<c:if test="${empty login}"><!-- �α����� �Ǿ��ִ��� üũ �α��� �ؾ߸� ������밡�� -->
				<h4>�α��ν� �������� ���������� ���� �� �ֽ��ϴ�</h4>
				<a href="<%=request.getContextPath()%>/loginForm"><input
					type="button" value="�α���"></a>
			</c:if>
			<c:if test="${not empty login}">
				<h4>��������Ʈ</h4>
				<div style="float: left; font-size: 13px;">
					<h6>��밡���� ����:</h6>
					<select name="search_coupon" style="height: 30px;"
						onchange="sendcoupon()">
						<option value="no" selected>������ �������� �ʽ��ϴ�</option>
						<c:forEach var="cpn" items="${memcoupon }">
							<c:if test="${cpn.cpn_check eq 'yes'}"><!-- ������ ��밡������ üũ -->
								<c:if test="${cpn.min_discount<hotel.price * diffDays}"><!-- ������ ���밡���� �������� üũ -->
									<option
										value="${cpn.discount },${cpn.max_discount},${cpn.cpn_seq}">${cpn.cpn_content }</option>
								</c:if>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</c:if>
			<div
				style="clear: both; position: relative; left: 30%; font-size: 13px;">
				��������:<input id="base" type="text" readonly="readonly">
			</div>
			<br />
			<div
				style="clear: both; position: relative; left: 30%; font-size: 13px;">
				���ΰ���:<input id="sale" name="price" type="text" readonly="readonly">
			</div>
			<br /> <br />
			<h4>ī���</h4>
			<input type="hidden" id="card_num" name="card_num">
			<ul class="tabs" style="font-size: 13px;">

				<label><li class="tab-link current" data-tab="tab-1"><input
						type="radio" value="1" name="card" checked> ���ο� ī��</li></label>

				<c:if test="${not empty login}">
					<label><li class="tab-link" data-tab="tab-2"><input
							type="radio" value="2" name="card">���� ī�� ����</li></label>
				</c:if>
			</ul>
			<br /> <br />
			<div id="tab-1" class="tab-content current"
				style="clear: both; width: 44%; margin-left: 5%; margin-bottom: 20px; font-size: 13px;">
				<div style="clear: both; float: inherit;">
					<input type="radio" name="company" value="����">KB����ī�� <input
						type="radio" name="company" value="����">����ī�� <input
						type="radio" name="company" value="���">IBK������� <input
						type="radio" name="company" value="����">NH���� <input
						type="radio" name="company" value="�ϳ�">�ϳ�ī�� <input
						type="radio" name="company" value="�츮">�츮����
				</div>

				<br /> ī���ȣ: <input type="text" placeholder="0000" name="cardnum"
					maxlength="4" style="width: 10%">- <input type="text"
					placeholder="0000" name="cardnum" maxlength="4" style="width: 10%">-
				<input type="text" placeholder="0000" name="cardnum" maxlength="4"
					style="width: 10%">- <input type="text" placeholder="0000"
					name="cardnum" maxlength="4" style="width: 10%"> ��й�ȣ: <input
					type="password" maxlength="4" style="width: 70px" name=""><br />
			</div>
			<div id="tab-2" class="tab-content"
				style="margin-bottom: 20px; font-size: 13px;">
				ī�弱��: <select name="cardnum1" style="width: 44%; height: 30px;">
					<c:forEach var="card" items="${memcard }">
						<option value="${card.card_num}">${card.company}:${card.card_num}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${empty rescheck || rescheck ne res.res_seq }">
				<input type="submit" value="������� �������ּ���" disabled
					class="w3-button w3-black" style="width: 50%; height: 40px">
			</c:if>
			<c:if test="${ not empty rescheck && rescheck eq res.res_seq }">
				<input type="submit" id="pay" class="w3-button w3-black"
					style="width: 50%; height: 40px">
			</c:if>
		</form>
	</div>
</body>
</html>