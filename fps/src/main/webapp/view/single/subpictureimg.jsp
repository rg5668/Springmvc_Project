<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
   img = opener.document.getElementById("pic");
   img.src = "<%=request.getContextPath()%>/himg/${filename}";  //업로드된 이미지 회원가입 화면에 출력
   opener.document.f.room_img.value="${filename}"; //파라미터에 파일이름 설정
   
   self.close();
</script>