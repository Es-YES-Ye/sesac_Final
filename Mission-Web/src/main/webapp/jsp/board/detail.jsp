<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=3

작업순서
1.요청 URL의 파라미터 분석 => 게시글 번호 추출
2.DB tbl_board에서 추출된 게시글 번호의 게시물을 조회
3.HTML 화면 구성해서 사용자 화면에 조회한 내용을 연결
4. 종료

 --%>
<%
	//1.
	int boardNo = Integer.parseInt(request.getParameter("no"));

	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectBoardByNo(boardNo);
	
	//공유영역 등록(JSP 에서 EL, )
	pageContext.setAttribute("board", board);

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">
<script>
	function doAction(type){
		
		switch(type) {
			case 'U' :
				location.href = "updateForm.jsp?no=${ param.no }"
				break
			
			case 'D' :
				break
			
			case 'L' :
				location.href = "list.jsp"
				break
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>게시글 상세</h2>
		<hr>
		<br>
		<table border = "1">
			<tr>
				<th width="25%">글 번호</th>
				<td>${ board.no}</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${ board.title} </td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer}</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content}</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt}</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate}</td>
			</tr>
		</table>
		<br>
		<button onclick="doAction('U')">수정</button>
		<button onclick="doAction('D')">삭제</button>
		<button onclick="doAction('L')">목록으로</button>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>

