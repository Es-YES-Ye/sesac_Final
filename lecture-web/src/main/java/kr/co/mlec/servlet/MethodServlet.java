package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet{
//http://localhost:9999/lecture-web/method?id=aaa
	//지금 이렇게 날아오고 있는데 사용자가 요청한 거... 
	//request 변수와 상관이 있다 id=aaa 이거....
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//request.getMethod(); // 어떤 방식으로 가져왔는지 물어보는 메소드
		String method = request.getMethod(); // 그 메소드의 값이 method 변수로 들어간다.
		String uri = request.getRequestURI(); //포트 ip 빼고 가지고 오는 게 uri... 
		String id = request.getParameter("id"); //이게 변수 id 에 들어가게 된다.
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(" <HTML> ");
		out.println(" 	<HEAD> ");
		out.println(" 		<TITLE>메소드 호출결과</TITLE> ");
		out.println(" 	<HEAD> ");
		out.println(" 	<BODY> ");
		out.println("=======================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출 력 결 과 <br>");
		out.println("=======================================<br>");
		out.println("요청 메소드 : " + method + "<br>");
		out.println("요청 URI : " + uri + "<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("=======================================<br>");
		out.println("=======================================<br>");
		out.println(" 	</BODY> ");
		out.println(" </HTML> ");
		
		out.flush();
		out.close();
		/*		System.out.println("요청 메소드 : " + method);
 * 
		System.out.println("요청 URI : " + uri);
		System.out.println("id : " + id);
*/	
		}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String method = request.getMethod(); // 그 메소드의 값이 method 변수로 들어간다.
		String uri = request.getRequestURI(); //포트 ip 빼고 가지고 오는 게 uri... 
		String id = request.getParameter("id"); //이게 변수 id 에 들어가게 된다.
	
		System.out.println("요청 메소드 : " + method);
		System.out.println("요청 URI : " + uri);
		System.out.println("id : " + id);
		
	}

}
