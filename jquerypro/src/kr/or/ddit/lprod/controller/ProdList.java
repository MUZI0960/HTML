package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ProdList
 */
@WebServlet("/ProdList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      // 0. 클라이언트 전송시 데이터를 받는다
	      String lgu = request.getParameter("gu");

	      // 1. service객체를 얻어온다.
	      IProdService prodService = ProdServiceImpl.getService();

	      // 2. service메서드를 호출한다. -> 결과를 리턴 받는다.
	      List<ProdVO> list = prodService.selectByLgu(lgu);

	      // 3. 결과를 출력한다. -> view페이지로 이동
	      request.setAttribute("list", list);

	      // 4. view페이지로 이동(forward) = html를 이용하여 출력하거나 또는 json데이터를 생성
	      RequestDispatcher disp = request.getRequestDispatcher("view/prodList.jsp");
	      disp.forward(request, response);
	   }

	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      // TODO Auto-generated method stub
	      doGet(request, response);
	   }

}
