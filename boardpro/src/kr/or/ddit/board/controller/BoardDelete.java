package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 클라이언트 전송 시 데이터 받기
		int bnum = Integer.parseInt(request.getParameter("num"));
		
		// 1. service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// 2. service 메서드 호출 - 결과값 받기
		int res =  service.deleteBoard(bnum);
		
		// 3. 결과값을 request에 저장
		request.setAttribute("result", res);
		
		// 4. view 페이지 이동
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
	}

}
