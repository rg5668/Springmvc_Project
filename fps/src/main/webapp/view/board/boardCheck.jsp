<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<head>

<script>
function boardChk() {
 var password = "${password}"
 var pass = prompt("�Խñ��� ��й�ȣ�� �Է��ϼ���")
 if(password == pass){
	 location.href="info?board_seq=${board_seq}&board_code=${board_code}";
 }
 else {
	 alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
	 history.back();
 }
}
boardChk();
</script>