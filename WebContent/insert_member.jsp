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
		alert("아이디를 입력하세요.");
		doc.id.focus();
		return false;
	}if(doc.name.value==""){
		alert("이름을 입력하세요.");
		doc.name.focus();
		return false;
	}if(doc.password.value==""){
		alert("비밀번호를 입력하세요.");
		doc.password.focus();
		return false;	
	}else{
		form.action="insert_memberProcess.jsp";
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
<%
String nickname=request.getParameter("nickname");
if(nickname==null){
	nickname="";}

String address=request.getParameter("address");
if(address==null){
	address="";}

String birth=request.getParameter("birth");
if(birth==null){
	birth="";}

String mail=request.getParameter("mail");
if(mail==null){
	mail="";}
String mail1=request.getParameter("mail1");
if(mail1==null){
	mail1="";}

String phone=request.getParameter("phone");
if(phone==null){
	phone="";}
String phone1=request.getParameter("phone1");
if(phone1==null){
	phone1="";}
String phone2=request.getParameter("phone2");
if(phone2==null){
	phone2="";}

String gender=request.getParameter("gender");
if(gender==null){
	gender="";}

String name=request.getParameter("name");
if(name==null){
	name="";}

String password=request.getParameter("password");
if(password==null){
	password="";}

String id=request.getParameter("id");
if(id==null){
	id="";
}else{
try{
	String sql="select id from member0804 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		id=rs.getString(1);
		%>
		<script>
		alert("이미 등록된 아이디입니다.");
		</script>
		<% 
	}else{
		System.out.println("사용 가능한 아이디입니다.");
	}
}catch(SQLException e){
	e.printStackTrace();
}
}
%>
<h2>회원 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_member.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">아이디</th>
		<td>
			<input type="text" name="id" value="<%=id %>" class="in1" onchange="ch()">
		</td>
</tr>

<tr>
	<th class="th1">이름</th>
		<td>
			<input type="text" name="name" value="<%=name %>" class="in1">
		</td>
</tr>
<tr>
	<th class="th1">비밀번호</th>
		<td>
			<input type="password" name="password" value="<%=password %>" class="in1">
		</td>
</tr>
<tr>
	<th class="th1">성별</th>
		<td>
			<input type="radio" name="gender" value="남성" checked><sub>남</sub>
			<input type="radio" name="gender" value="여성"><sub>여</sub>
		</td>
</tr>

<tr>
	<th class="th1">생년월일</th>
		<td>
			<input type="text" name="birth" value="<%=birth %>" class="in1">
		</td>
</tr>
<tr>
	<th class="th1">이메일</th>
		<td>
			<input type="text" name="mail" value="<%=mail %>" class="in1">@
			<select name="mail1" class="in1">
				<option value="naver.com" <%=mail1.equals("naver.com")?"selected":"" %>>naver.com</option>
				<option value="kor.com" <%=mail1.equals("kor.com")?"selected":"" %>>kor.com</option>
			</select>
		</td>
</tr>

<tr>
	<th class="th1">핸드폰</th>
		<td>
			<select name="phone">
			<option value="010" <%=phone.equals("010")?"selected":"" %>>010</option>
			<option value="070"  <%=phone.equals("070")?"selected":"" %>>070</option>
			</select>
			<input type="text" name="phone1" value="<%=phone1%>">
			<input type="text" name="phone2" value="<%=phone2%>">
		</td>
</tr>

<tr>
	<th class="th1">주소</th>
		<td>
			<input type="text" name="address" value="<%=address%>" class="in1">
		</td>
</tr>

<tr>
	<th class="th1">닉네임</th>
		<td>
			<input type="text" name="nickname" value="<%=nickname%>">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="회원등록" onclick="check()" class="bt1">
		<input type="reset" value="다시작성"  class="bt1">
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>