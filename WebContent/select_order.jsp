
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec2">
<h3 class="h3_center">상품 목록</h3>
<br>
<table border="1" class="tab1">
<tr>
	<th>상품코<br>드</th>
	<th>주문자이름</th>
	<th>주문날짜</th>
	<th>배달주소</th>
	<th>전화번호</th>
	<th>결제방법</th>
	<th>카드번호</th>
	<th>주문상품수</th>
	<th>판매가격</th>
	<th>총금액</th>
	<th>구분</th>
</tr>
<%
try{
	String sql="select o.id,o.name,o.orderdate,o.addr,o.tel,o.pay,o.cardno,o.prodcount,p.unitprice,o.total from order0804 o,product0804 p where p.productId=o.id order by o.tel";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String orderdate=rs.getString(2);
		String addr=rs.getString(4);
		String tel=rs.getString(5);
		String pay=rs.getString(6);
		String cardno=rs.getString(7);
		String prodcount=rs.getString(8);
		String unitprice=rs.getString(9);
		String total=rs.getString(10);
%>
<tr>
	<td class="td1"><%=id %></td>
	<td class="td1"><%=name %></td>
	<td class="td1"><%=orderdate %></td>
	<td class="td1"><%=addr %></td>
	<td class="td1"><%=tel %></td>
	<td class="td1"><%=pay %></td>
	<td class="td1"><%=cardno %></td>
	<td class="td1"><%=prodcount %></td>
	<td class="td1"><%=unitprice %></td>
	<td class="td1"><%=total%></td>
	<td class="td1">
	<a href="update_order.jsp?id=<%=id %>&&name=<%=name %>">수정</a> /
	<a href="delete_order.jsp?id=<%=id %>&&name=<%=name %>">삭제</a>
	</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_order.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>