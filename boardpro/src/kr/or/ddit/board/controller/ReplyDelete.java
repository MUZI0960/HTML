package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0.
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		// 1.
		IBoardService service = BoardServiceImpl.getService();
	
		
		// 2.
		int res = service.deleteReply(renum);
		
		// 3.
		request.setAttribute("result", res);
		
		// 4.
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
	}

}
