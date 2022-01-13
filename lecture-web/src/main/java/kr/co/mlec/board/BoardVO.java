package kr.co.mlec.board;
/*자바빈즈 클래스 
 * 1. 패키지 존재
 * 2. 클래스의 접근제한자 public
 * 3. 멤버변수의 접근제한자 private
 * 4. getter/setter 구현
 * 5. 기본 생성자
 * 
 * 기본 생성자 alt+shift+s 누른 후 c 선택
 * 매개변수 생성자 alt+shift+s 누른 후 o 선택
 * getter/setter alt+shift+s 누른 후 r 선택
 * toString() alt+shift+s 누른 후 s 선택
 * override alt+shift+s 누른 후 v 선택
 * 
 */

public class BoardVO {
	private int no;
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BoardVO(int no, String title) {
		super();
		this.no = no;
		this.title = title;
	}
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String title;
}
