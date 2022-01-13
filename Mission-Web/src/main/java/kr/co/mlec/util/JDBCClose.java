package kr.co.mlec.util;

import java.sql.Connection;
import java.sql.Statement;

public class JDBCClose {
	
	public static void close(Statement stmt, Connection conn) { // 클로즈할 애를 끌어오기
//자기가 객체 자원을 만드는 게 아니니까 new 만들 필요 없어서 static
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
