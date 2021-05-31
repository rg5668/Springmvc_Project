<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/tab.css">
<meta charset="EUC-KR">


<title>결제</title>
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
			$('#base').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"원");//선택한 숙소의 값을 전송하는 부분
		$('#sale').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"원");
		$('#pay').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"원");
		$('#pay_check').submit(function() //값 전송시 체크하는 함수
				{
			if($("input[name='card']:checked").val()==1)//새로운 카드를 추가하는 경우
			{
				var cardnumstr="";
				 var size = $("input[name='cardnum']").length;
				 for(i=0;i<size;i++)
				{
					 cardnumstr=cardnumstr+$("input[name='cardnum']").eq(i).val()
				}
				 $('#card_num').val(cardnumstr.replace(",", ""));//해당값을 히든객체로 파라미터로 보냄
			}
			else if($("input[name='card']:checked").val()==2)//기존의 카드일경우
			{
				$('#card_num').val($("select[name='cardnum1']").val());//기존카드 정보를 히든객체로 파라미터로 보냄
			}
			});
	})
	
	function sendcoupon()//쿠폰을 적용하는 함수
	{
		var arr=new Array();
		arr=$("select[name=search_coupon]").val().split(',');//value는 1개밖에 못보내서 ,로 3개 구분하여 보냄
		if(arr=='no')
		{
			$('#sale').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"원");
			$('#pay').val((${hotel.price*diffDays}).toLocaleString('ko-KR')+"원 결제하기");
			return false;
		}
		if(${hotel.price*diffDays}-${hotel.price*diffDays}*arr[0]>=arr[1])
		{
			$('#sale').val((${hotel.price*diffDays}-arr[1]).toLocaleString('ko-KR')+"원");
			$('#pay').val((${hotel.price*diffDays}-arr[1]).toLocaleString('ko-KR')+"원 결제하기");
		}
		else if(${hotel.price*diffDays}-${hotel.price*diffDays}*arr[0]<arr[1])
		{
			$('#sale').val((${hotel.price*diffDays}*arr[0]).toLocaleString('ko-KR')+"원");
			$('#sale').val((${hotel.price*diffDays}*arr[0]).toLocaleString('ko-KR')+"원 결제하기");
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
				<td>체크인</td>
				<td rowspan="3"><img
					src="<%=request.getContextPath()%>/w3images/arrow.png"></td>
				<td>체크아웃</td>
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
			<h4>예약정보</h4>
			<table style="font-size: 13px">
				<tr>
					<td>예약자 이름</td><!-- 로그인 되어있다면 예약자의 이름과 전화번호를 자동으로 입력 아니면 입력할수있게 -->
					<c:if test="${empty name }">
						<td><input type="text" name="name" required="required"></td>
					</c:if>
					<c:if test="${not empty name }">
						<td><input type="text" value="${name}" name="name" readonly></td>
					</c:if>
				</tr>
				<tr>
					<td>예약자 휴대전화</td>
					<c:if test="${empty tel }">
						<td><input type="text" name="tel" required="required"></td>
					</c:if>
					<c:if test="${not empty tel }">
						<td><input type="text" value="${tel}" name="tel" readonly></td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty rescheck && rescheck eq res.res_seq }"><!-- 예약하기가 정상적으로 처리되었다면 세션을 통해 예약했는지 확인 -->
						<td colspan="2"><input type="submit" value="이미 예약되었습니다"
							class="w3-button w3-black" disabled></td>
					</c:if>
					<c:if test="${empty rescheck || rescheck ne res.res_seq }">
						<td colspan="2"><input type="submit" value="예약하기"
							class="w3-button w3-black"></td>
					</c:if>
				</tr>
			</table>
		</form>
		<br />
		<form action="<%=request.getContextPath()%>/hotel/payment"
			method="post" id="pay_check">
			<input type="hidden" name="res_seq" value="${rescheck }">
			<c:if test="${empty login}"><!-- 로그인이 되어있는지 체크 로그인 해야만 쿠폰사용가능 -->
				<h4>로그인시 쿠폰사용과 적립혜택을 받을 수 있습니다</h4>
				<a href="<%=request.getContextPath()%>/loginForm"><input
					type="button" value="로그인"></a>
			</c:if>
			<c:if test="${not empty login}">
				<h4>쿠폰리스트</h4>
				<div style="float: left; font-size: 13px;">
					<h6>사용가능한 쿠폰:</h6>
					<select name="search_coupon" style="height: 30px;"
						onchange="sendcoupon()">
						<option value="no" selected>쿠폰을 적용하지 않습니다</option>
						<c:forEach var="cpn" items="${memcoupon }">
							<c:if test="${cpn.cpn_check eq 'yes'}"><!-- 쿠폰이 사용가능한지 체크 -->
								<c:if test="${cpn.min_discount<hotel.price * diffDays}"><!-- 쿠폰이 적용가능한 쿠폰인지 체크 -->
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
				기존가격:<input id="base" type="text" readonly="readonly">
			</div>
			<br />
			<div
				style="clear: both; position: relative; left: 30%; font-size: 13px;">
				할인가격:<input id="sale" name="price" type="text" readonly="readonly">
			</div>
			<br /> <br />
			<h4>카드사</h4>
			<input type="hidden" id="card_num" name="card_num">
			<ul class="tabs" style="font-size: 13px;">

				<label><li class="tab-link current" data-tab="tab-1"><input
						type="radio" value="1" name="card" checked> 새로운 카드</li></label>

				<c:if test="${not empty login}">
					<label><li class="tab-link" data-tab="tab-2"><input
							type="radio" value="2" name="card">기존 카드 선택</li></label>
				</c:if>
			</ul>
			<br /> <br />
			<div id="tab-1" class="tab-content current"
				style="clear: both; width: 44%; margin-left: 5%; margin-bottom: 20px; font-size: 13px;">
				<div style="clear: both; float: inherit;">
					<input type="radio" name="company" value="국민">KB국민카드 <input
						type="radio" name="company" value="신한">신한카드 <input
						type="radio" name="company" value="기업">IBK기업은행 <input
						type="radio" name="company" value="농협">NH농협 <input
						type="radio" name="company" value="하나">하나카드 <input
						type="radio" name="company" value="우리">우리은행
				</div>

				<br /> 카드번호: <input type="text" placeholder="0000" name="cardnum"
					maxlength="4" style="width: 10%">- <input type="text"
					placeholder="0000" name="cardnum" maxlength="4" style="width: 10%">-
				<input type="text" placeholder="0000" name="cardnum" maxlength="4"
					style="width: 10%">- <input type="text" placeholder="0000"
					name="cardnum" maxlength="4" style="width: 10%"> 비밀번호: <input
					type="password" maxlength="4" style="width: 70px" name=""><br />
			</div>
			<div id="tab-2" class="tab-content"
				style="margin-bottom: 20px; font-size: 13px;">
				카드선택: <select name="cardnum1" style="width: 44%; height: 30px;">
					<c:forEach var="card" items="${memcard }">
						<option value="${card.card_num}">${card.company}:${card.card_num}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${empty rescheck || rescheck ne res.res_seq }">
				<input type="submit" value="예약부터 진행해주세요" disabled
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