package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

@WebServlet("/ListPage.do")
public class ListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 0. 클라이언트 전송 시 전달 데이터 받기 - page, stype, sword
		int spage = Integer.parseInt(request.getParameter("page"));
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		// 1. service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// 2-1. service 메서드 호출 - start, end, startpage, endpage, totalpage
		PageVO vo = service.pageInfo(spage, stype, sword);
		
		// 2-2 service 메서드 호출 - list 목록 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		List<BoardVO> list = service.selectByPage(map);
		
		// 3. 결과값을 request에 저장
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		
		// 4. view 페이지로 이동
		request.getRequestDispatcher("view/list.jsp").forward(request, response);
		
		
	}

}
