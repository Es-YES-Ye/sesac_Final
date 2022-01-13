<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr, type, reg_date ");
	sql.append(" from tbl_member  ");
	sql.append(" order by id desc " );
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>전체회원목록</title>
<style>
	hr, table {
		width : 80%
	}
</style>
<script>
	function goMemberForm(){
		location.href = "memberForm.jsp"
	}
</script>
</head>
<body>
	<div align = "center">
		<hr width="80%">
		<h2>회원 목록</h2>
		<hr width="80%">
		<br>
		<table border ="1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>PASSWORD</th>
				<th>EMAIL_ID</th>
				<th>EMAIL_DOMAIN </th>
				<th>TEL1</th>
				<th>TEL2</th>
				<th>TEL3</th>
				<th>POST</th>
				<th>BASIC_ADDR</th>
				<th>DETAIL_ADDR</th>
				<th>TYPE</th>
				<th>REG_DATE</th>
		</tr>	
		<%
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String email_id = rs.getString("email_id");
				String email_domain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basic_addr = rs.getString("basic_addr");
				String detail_addr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String reg_date = rs.getString("reg_date");
		%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=password%></td>
				<td><%=email_id%></td>
				<td><%=email_domain%></td>
				<td><%=tel1%></td>
				<td><%=tel2%></td>
				<td><%=tel3%></td>
				<td><%=post%></td>
				<td><%=basic_addr%></td>
				<td><%=detail_addr%></td>
				<td><%=type%></td>
				<td><%=reg_date%></td>
			</tr>      		
		<%
			}
		%>
	</table>
	<br>
	<button onclick = "goMemberForm()">회원 등록</button>
	</div>
</body>
</html>
<%
JDBCClose.close(pstmt, conn);
%>