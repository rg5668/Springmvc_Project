<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<head>

<script>
function boardChk() {
 var password = "${password}"
 var pass = prompt("게시글의 비밀번호를 입력하세요")
 if(password == pass){
	 location.href="info?board_seq=${board_seq}&board_code=${board_code}";
 }
 else {
	 alert("비밀번호가 일치하지 않습니다.")
	 history.back();
 }
}
boardChk();
</script>