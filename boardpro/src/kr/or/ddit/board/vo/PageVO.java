package kr.or.ddit.board.vo;

public class PageVO {
	private int start;	// 출력 시작번호
	private int end;	// 출력 끝번호
	
	private int startPage;	// 출력 페이지 시작번호
	private int endPage;	// 출력 페이지 끝번호
	
	private int totalPage; 	// 총 페이지 수
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	private static int perList = 3 ;	// 한 화면에 출력 할 글 리스트 수
	private static int perPage = 3 ;	// 한 화면에 출력 할 페이지 수
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	
	
	
}
