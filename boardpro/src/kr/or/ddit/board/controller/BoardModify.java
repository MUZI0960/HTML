package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/BoardModify.do")
public class BoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 0. 전송 데이터 받기 - writer, subject, mail, password, content, num
		BoardVO vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setWip(request.getRemoteAddr());
		
		// 1. service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// 2. 메서드 호출 - 결과값 받기
		int res = service.modifyBoard(vo);
		
		// 3. request에 결과값 저장
		request.setAttribute("result", res);
		
		// 4. view 페이지로 이동
		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
		
	}

}
