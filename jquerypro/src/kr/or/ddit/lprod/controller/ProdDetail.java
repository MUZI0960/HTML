package kr.or.ddit.lprod.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.IProdService;
import kr.or.ddit.lprod.service.ProdServiceImpl;
import kr.or.ddit.lprod.vo.ProdVO;

/**
 * Servlet implementation class ProdDetail
 */
@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 클라이언트 전송 시 데이터를 받는다.
		String prodId = request.getParameter("id");
		
		// 1. service 객체를 얻어온다.
		IProdService service = ProdServiceImpl.getService();
		
		// 2. service메서드 호출 - 결과를 리턴 받는다.
		ProdVO vo = service.selectByIdDetail(prodId);
		
		// 3. 결과를 request에 저장
		request.setAttribute("list", vo);
		
		// 4. view 페이지로 이동 (forward) = html을 이용하여 출력 또는 json데이터를 생성
		RequestDispatcher disp =  request.getRequestDispatcher("view/prodDetail.jsp");
		disp.forward(request, response);
	}

}
