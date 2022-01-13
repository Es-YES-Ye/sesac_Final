<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    /*
    	작업순서
    	1. 요청 파라미터에서 조회할 게시글 번호를 추출한다.
    	2. 게시글 번호로 해당 게시글을 DB(tbl_board) 조회
    	3. form에 조회된 게시글을 출력

    */
    
    int boardNo = Integer.parseInt(request.getParameter("no"));
    
    BoardDAO dao = new BoardDAO();
    BoardVO board = dao.selectBoardByNo(boardNo);
    
    pageContext.setAttribute("board", board);
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 페이지</title>
<style>
	hr {
		width: 80%
	}
</style>
<script>
	function doWrite(){
		let f = document.inputForm	
		
		if(f.title.value == ''){
			alert('제목을 입력하세요')
			f.title.focus()
			return false 
		}
		
		if(f.writer.value == ''){
			alert('글쓴이를 입력하세요')
			f.writer.focus()
			return false 
		}
				
		if(f.content.value == ''){
			alert('내용을 입력하세요')
			f.content.focus()
			return false 
		}
		
		return true
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2> 게시글 수정 </h2>
		<hr>
		<br>
		<form action="update.jsp" method="post" onsubmit="return doWrite()">
			<input type="hidden" name="no" value="${ param.no }" />
			<table border="1">
				<tr>
					<th>글 번 호</th>
					<td> ${ board.no }</td>
				</tr>
				<tr> 
					<th width="23%">제목</th>
					<td>
						<input type="text" name="title"
						 value="<c:out value='${ board.title }' />">
					</td> 
				</tr>
				<tr> 
					<th width="23%">글쓴이</th>
					<td>
						<input type="text" name="writer" value="${ board.writer }" required>
					</td> 
				</tr>
				<tr> 
					<th width="23%">내용</th>
					<td>
						<textarea name="content" rows="7" cols="60" required>${ board.content }</textarea>
					</td> 
				</tr>
			
			</table>
			<br>
			<input type="submit" value="수정">
			
		</form >
	</div>
</body>
</html>