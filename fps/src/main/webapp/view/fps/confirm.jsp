<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript">
var result=confirm("������ �Ϸ�Ǿ����ϴ�,\n�߰��� �������� �Ͻðڽ��ϱ�?");
if(result)
{
	function sendRoom()
	{
	var form = document.createElement('form'); // ����ü ����
    var parm = new Array();
    var input = new Array();
    parm.push( ['room_code', '${hj.room_code}'] );
    parm.push( ['guest',${gd.guest}] );
    parm.push( ['sdate','${gd.sdate}']  );
    parm.push( ['edate', '${gd.edate}'] );
    parm.push( ['user_id', '${res.user_id}'] );
    parm.push( ['name', '${res.name}'] );
    parm.push( ['tel', '${res.tel}'] );
    parm.push( ['res_seq', ${res.res_seq}] );


    for (var i = 0; i < parm.length; i++) {
        input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', parm[i][0]);
        input[i].setAttribute("value", parm[i][1]);
        form.appendChild(input[i]);
    }
	
	form.setAttribute('method', 'post'); //get,post ����
	form.setAttribute('action', "<%=request.getContextPath()%>/hotel/paymentForm"); //������ url
	document.body.appendChild(form);
	form.submit();
	}
}
else
{
	location.href="<%=request.getContextPath()%>/mainForm";
}
sendRoom();
</script>
</head>
<body>
</body>
</html>