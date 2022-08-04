<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script>
function ch(){
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.productId.value==""){
		alert("상품번호를 입력하세요.");
		doc.productId.focus();
		return false;
	}if(doc.productName.value==""){
		alert("상품명을 입력하세요.");
		doc.productName.focus();
		return false;
	}else{
		doc.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<h2>상품 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_productProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">상품코드</th>
		<td colspan="3">
			<input type="text" name="productId"  class="in1">
		</td>
</tr>

<tr>
	<th class="th1">상품명</th>
		<td colspan="3">
			<input type="text" name="productName" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">가격</th>
		<td colspan="3">
			<input type="text" name="unitprice" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">상세정보</th>
		<td colspan="3">
			<input type="text" name="description" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">제조사</th>
		<td colspan="3">
			<input type="text" name="manufacturer" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">분류</th>
		<td>
			<input type="text" name="category" class="in2">
		</td>
	<th class="th1">재고수</th>
		<td>
			<input type="text" name="unitsInstock" class="in2">
		</td>
</tr>

<tr>
	<th class="th1">상태</th>
		<td colspan="3">
			<input type="radio" name="condition" checked><sub>신규제품</sub>
			<input type="radio" name="condition"><sub>중고제품</sub>
			<input type="radio" name="condition"><sub>재생제품</sub>
		</td>
</tr>

<tr>
	<td colspan="4" class="td1">
		<input type="button" value="상품등록" onclick="check()" class="bt1">
		<input type="reset" value="다시작성"  class="bt1">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>