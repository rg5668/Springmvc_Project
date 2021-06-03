<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<title>My page</title>
<body>

	<table style="font-size: 14px" align="center">
		<tr>
			<td><h2>내정보</h2></td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>이름</b>
				</h6></td>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>아이디</b>
				</h6></td>
			<td>${mem.user_id}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>생년월일</b>
				</h6></td>
			<td>${mem.birth}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>이메일</b>
				</h6></td>
			<td>${mem.email}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>전화번호</b>
				</h6></td>
			<td>${mem.tel}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>주소</b>
				</h6></td>
			<td>${mem.addr}</td>
		</tr>
		<tr>
			<td style="width: 120px;"><h6>
					<b>보유쿠폰</b>
				</h6></td>
			<td><select>
			<c:if test="${empty cpn}">
			<option>보유쿠폰없음</option>
			</c:if>
			<c:forEach var="c" items="${cpn}">
			<option>${c.cpn_content }</option>
			</c:forEach>
			</select></td><td><a
				href="addcpnForm"><input type="button"
					class="w3-button w3-black" style="width: 120px;" name="update"
					value="쿠폰 등록하기"></a></td>
		</tr>
		<%-- <tr>
			<td style="width: 120px;"><h6>
					<b>등록된 카드</b>
				</h6></td>
			<td><select name="card_num">
			<c:if test="${empty card}">
			<option>등록된 카드 없음</option>
			</c:if>
			<c:forEach var="c" items="${card}">
			<option value=${c.card_num }>${c.company }-${c.card_num }</option>
			</c:forEach>
			</select></td><td><a
				href="addcardForm"><input type="button"
					class="w3-button w3-black" style="width: 120px;" name="update"
					value="카드 등록하기"></a></td>
					<td><a
				href="addcardForm"><input type="button"
					class="w3-button w3-black" style="width: 120px;" name="update"
					value="카드 삭제하기"></a></td>
		</tr> --%>
		<tr>
			<td colspan="2" align="center"><a
				href="updateForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="update"
					value="회원 정보 수정하기"></a>
			<td colspan="2" align="center"><a
				href="deleteForm?user_id=${login}"><input type="button"
					class="w3-button w3-black" style="width: 200px;" name="delete"
					value="회원 탈퇴"></a>
		</tr>
	</table>
</body>
</html>
