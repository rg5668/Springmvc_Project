<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
   img = opener.document.getElementById("pic");
   img.src = "<%=request.getContextPath()%>/himg/${filename}";  //���ε�� �̹��� ȸ������ ȭ�鿡 ���
   opener.document.f.room_img.value="${filename}"; //�Ķ���Ϳ� �����̸� ����
   
   self.close();
</script>