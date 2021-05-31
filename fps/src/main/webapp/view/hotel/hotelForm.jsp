<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '���� ��',
    nextText: '���� ��',
    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    showMonthAfterYear: true,
    yearSuffix: '��',
   
});


$(document).ready(function() {

	$( "#datepicker" ).datepicker({ minDate: 0});
	datemin=$("#datepicker").datepicker("getDate");
	datemax=$("#datepicker").datepicker("getDate");
	$( "#datepicker1" ).datepicker({ minDate:0});

    values = '${hotel_option1}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
    
    values = '${hotel_option2}'.split('/');//�ɼ� ��Ʈ���� �迭�� �и�
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//üũ�� �ɼ� ���ε�ÿ��� ����
    }
    
    $("select[name=search_option]").val("${search_option}").prop("selected", true);//���Ŀɼ� ���ε�ÿ��� ����
    $("select[name=area_code]").val("${area_code}").prop("selected", true);//������ ���ε�ÿ��� ����
    
} );
function chancal()
{
	datemin=$("#datepicker").datepicker("getDate");
	datemax=$("#datepicker").datepicker("getDate");
datemin.setDate(datemin.getDate()+1);
datemax.setDate(datemax.getDate()+8);
$('#datepicker1').datepicker('option', {
	minDate:datemin,
	maxDate:datemax
  })

}
function sendOption(obj)//selectü�������� submit���
{
	obj.submit();
}
function sendHotel(hotel_code)//������ �Լ��� ���� ���� post�������� ����
{
	var form = document.createElement('form'); // ����ü ����
    var parm = new Array();
    var input = new Array();
    parm.push( ['hotel_code', hotel_code] );
    parm.push( ['guest',${gd.guest}] );
    parm.push( ['sdate','${gd.sdate}']  );
    parm.push( ['edate', '${gd.edate}'] );


    for (var i = 0; i < parm.length; i++) {
        input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', parm[i][0]);
        input[i].setAttribute("value", parm[i][1]);
        form.appendChild(input[i]);
    }
	
	form.setAttribute('method', 'post'); //get,post ����
	form.setAttribute('action', "<%=request.getContextPath() %>/hotel/hotelSubForm"); //������ url
	document.body.appendChild(form);
	form.submit();
}

</script>
<meta charset="EUC-KR">
<title>���� ����Ʈ</title>
</head>
<body>
      <form action="<%=request.getContextPath() %>/hotel/hotelForm" method="post">

        <div class="w3-row-padding w3-margin-top w3-center" style=" font-size: 13px; margin-bottom: 10px;">
          
          <table style="width: 100%; margin-top: 20px; font-size: 14px">
 			<tr style="border: 1px; width: 100%;">
            <td class="w3-center">
            	
           <i class="fa fa-map-marker"></i> ��ġ
          <select name="area_code" class="w3-border" style="width: 10%">
            <option value="20">����</option>
            <option value="32">��õ</option>
            <option value="31">���</option>
            <option value="33">������</option>
            <option value="42">����</option>
            <option value="53">�뱸</option>
            <option value="51">�λ�</option>
            <option value="62">����</option>
            <option value="64">����</option>
          </select>
            	
           <i class="fa fa-male"></i> �ο�
            <input class="w3-border" style="width: 10%" type="number" value="${gd.guest }" name="guest" min="1" max="10">
          
            	
            <i class="fa fa-calendar-o"></i> üũ��
            	<input class="w3-border" style="width: 12%" type="date" value="${gd.sdate }" name="sdate" id="datepicker" onchange="chancal()" readonly>
            	
            	<i class="fa fa-calendar-o"></i> üũ�ƿ�
            	<input class="w3-border" style="width: 12%" type="date" value="${gd.edate }" name="edate" id="datepicker1" readonly>
            	<b><input type="submit" class="w3-button w3-black" style="width: 100px; height: 30px; font-size: 12px; margin-bottom: 5px" value="�˻�"></b>
            </td>
        	</tr>
        </table> 
        </div>
      </form>
<div>
<div style="border-bottom: 1px solid black; border-top: 1px solid black;">
<form action="<%=request.getContextPath() %>/hotel/hotelForm" method="post">
<input type="hidden" name="area_code" value="${area_code}"><!-- ���ε�� ���簴ü -->
<input type="hidden" name="guest" value="${gd.guest}">
<input type="hidden" name="sdate" value="${gd.sdate}">
<input type="hidden" name="edate" value="${gd.edate}">
<input type="hidden" name="cnt" value="2"/>
<table style="width: 100%; margin-left: 70px;">
<colgroup> <col style="width:10%"> <col style="width:10%"> <col style="width:10%"> <col style="width:10%">
<col style="width:10%"> <col style="width:10%"> <col style="width:10%"> <col style="width:10%"> </colgroup>



<tr><td><h4>���� �ü�</h4></td></tr>
<tr>
<td><input type="checkbox" name="hotel_option1" value="������">������</td>
<td><input type="checkbox" name="hotel_option1" value="���뽺��">���뽺��</td>
<td><input type="checkbox" name="hotel_option1" value="����������">����������</td>
<td><input type="checkbox" name="hotel_option1" value="�������">�������</td>
<td><input type="checkbox" name="hotel_option1" value="ī��">ī��</td>
<td><input type="checkbox" name="hotel_option1" value="BBQ">BBQ</td>
<td><input type="checkbox" name="hotel_option1" value="������">������</td>
<td><input type="checkbox" name="hotel_option1" value="������">������</td>
<td><input type="checkbox" name="hotel_option1" value="��簡��">��簡��</td>
</tr>



<tr><td><h4>���ǽü�</h4></td></tr>
<tr>
<td><input type="checkbox" name="hotel_option2" value="��������">��������</td>
<td><input type="checkbox" name="hotel_option2" value="������">������</td>
<td><input type="checkbox" name="hotel_option2" value="����̱�">����̱�</td>
<td><input type="checkbox" name="hotel_option2" value="����">����</td>
<td><input type="checkbox" name="hotel_option2" value="��ǿ�ǰ">��ǿ�ǰ</td>
<td><input type="checkbox" name="hotel_option2" value="TV">TV</td>
<td><input type="checkbox" name="hotel_option2" value="�����">�����</td>
</tr>

<tr>
<td colspan="8"></td>

<td colspan="2" style="margin-left: 20px; font-size: 12px">
<b><input type="submit" value="�����ϱ�" class="w3-button w3-black" style="width: 100px;"></b>
</td>
</tr>

</table>
<div style="float:right; margin-top: 20px;">

<table>
<tr><td><select name="search_option" style="height: 30px; font-size: 12px;" onchange="sendOption(this.form)">
<option value="L_price">��ݳ�����</option>
<option value="H_price">��ݳ�����</option>
<option value="L_grade">����������</option>
<option value="H_grade">����������</option>
</select>
</tr>
</table>
</div>
</form>
</div>



<table id="customers" style="margin-top: 70px; text-align: center;">
  <tr style="font-size: 13px; text-align: center;">
    <th style="width: 10% ">�̹���</th>
    <th style="width: 10% ">���Ҹ�</th>
    <th style="width: 20% ">�ּ�</th>
    <th style="width: 10% ">����(1�ڱ���)</th>
    <th style="width: 10% ">�ִ��ο���</th>
    <th style="width: 10% ">����</th>
    <th style="width: 30% ">���ܼҰ�</th>
  </tr>
  <c:forEach var="h" items="${hotel }">
  <tr style="font-size: 12px;"><!-- ��ü���ý� submit��� -->
  <td style="width: 10%"><a href="#" onclick="sendHotel('${h.hotel_code}')"><img src="<%=request.getContextPath()%>/${h.hotel_img}" style="width: 100%"></a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_name }</a></td>
    <td style="width: 20% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_addr }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.price }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.guest }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">��${h.hotel_grade }</a></td>
    <td style="width: 30% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_intro }</a></td>
  </tr>  
  <tr></tr>
  <tr></tr>
 </c:forEach>
</table>

</div>  
<div style="clear: both;"></div>
</body>
</html>