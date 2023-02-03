package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;

@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 0.
		int bnum = Integer.parseInt(request.getParameter("bonum"));
		
		// 1. service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// 2. service 메서드 호출 - 결과값 받기
		List<ReplyVO> list =  service.selectReply(bnum);
		
		// 3. 저장
		request.setAttribute("list", list);

		// 4. view 페이지로 이동
		request.getRequestDispatcher("view/replyList.jsp").forward(request, response);
		
		
	}

}
