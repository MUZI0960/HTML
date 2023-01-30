package kr.or.ddit.board.vo;

public class PageVO {
	private int start;	// 출력 시작번호
	private int end;	// 출력 끝번호
	
	private int startPage;	// 출력 페이지 시작번호
	private int endPage;	// 출력 페이지 끝번호
	
	private static int perList =3 ;	// 한 화면에 출력 할 글 리스트 수
	private static int perPage =2 ;	// 한 화면에 출력 할 페이지 수
	
}
