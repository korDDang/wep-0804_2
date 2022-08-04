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
	if(doc.id.value==""){
		alert("상품코드를 입력하세요.");
		doc.id.focus();
		return false;
	}if(doc.name.value==""){
		alert("주문자이름을 입력하세요.");
		doc.name.focus();
		return false;
	}if(doc.addr.value==""){
		alert("주문자주소를 입력하세요.");
		doc.addr.focus();
		return false;	
	}else{
		form.action="insert_orderProcess.jsp";
		doc.submit();
	}
}
function ch1(){
	var doc=document.form;
	var chk=document.getElementsByName("pay");
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			if(chk[i].value=="현금"){
				doc.cardno.disabled=true;
		}else if(chk[i].value=="카드"){
			alert("카드번호를 입력하세요");
			doc.cardno.value="";
			doc.cardno.focus();
		}
	}
}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec2">
<%
int pro=0;
String name=request.getParameter("name");
String orderdate=request.getParameter("orderdate");
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");
String pay=request.getParameter("pay");
String cardno=request.getParameter("cardno");
if(cardno==null){
	cardno="";
}
String prodcount=request.getParameter("prodcount");
if(prodcount==null){
	prodcount="0";}else{
		pro=Integer.parseInt(prodcount);
	}
int total=0;






int unitprice=0;
String productId=request.getParameter("productId");
if(productId==null){
	productId="";
}else{
try{
	String sql="select productId,unitprice from product0804 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	if(rs.next()){
		productId=rs.getString(1);
		unitprice=rs.getInt(2);
		total=unitprice*pro;
	}else{
		%>
		<script>
		alert("등록되지 않은 코드입니다.");
		</script>
		<% 
	}
}catch(SQLException e){
	e.printStackTrace();
}
}
%>
<br>
<br>
<br>
<h3 class="h3_center">주문정보 등록</h3>
<form name="form" method="post" action="insert_order.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th2">상품코드</th>
		<td>
			<input type="text" name="productId"  value="<%=productId%>"class="in2" onchange="ch()">
		</td>
	<th class="th2">주문자 이름</th>
		<td>
			<input type="text" name="name"  class="in2" value="<%=name%>">
		</td>
</tr>

<tr>
	<th class="th2">주문 날짜</th>
		<td>
			<input type="text" name="orderdate" value="<%=orderdate%>" class="in2">
		</td>
	<th class="th2">전화번호</th>
		<td>
			<input type="text" name="tel" value="<%=tel%>" class="in2">
		</td>
</tr>

<tr>
	<th class="th2">배달주소</th>
		<td colspan="3">
			<input type="text" name="addr" value="<%=addr%>" class="in1">
		</td>
</tr>

<tr>
	<th class="th2">결제방법</th>
		<td>
			<input type="radio" name="pay" value="현금" onclick="ch1()">현금
			<input type="radio" name="pay" value="카드" onclick="ch1()">카드
		</td>
		<th class="th2">카드번호</th>
		<td>
			<input type="text" name="cardno"  value="<%=cardno%>" class="in2">
		</td>
</tr>

<tr>
	<th class="th2">주문상품수</th>
		<td>
			<input type="text" name="prodcount" value="<%=prodcount%>" onchange=ch() class="in2">
		</td>
	<th class="th2">주문금액</th>
		<td>
			<input type="text" name="total" value="<%=total%>" class="in2">
		</td>
</tr>

<tr>
	<td colspan="4" class="td1">
		<input type="button" value="목록" onclick="location.href='select_order.jsp'" class="bt2">
		<input type="button" value="저장" onclick="check()" class="bt2">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>