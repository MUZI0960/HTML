package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

@WebServlet("/ZipSearch.do")
public class ZipSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 0. 클라이언트 전송 시 데이터 받기
		String sdong = request.getParameter("dong");
		
		// 1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		
		// 2. service 메서드 호출 - 결과값 받기
		 List<ZipVO> res = service.selectByDong(sdong);
		
		// 3. 결과를 request에 저장
		request.setAttribute("value", res);
		 
		// 4. view 페이지 이동
		RequestDispatcher disp = request.getRequestDispatcher("view/zipResult.jsp");
		disp.forward(request, response);
		
		// json데이터를 Gson클래스를 이용하여 자동으로 json데이터를 생성
		//request.getRequestDispatcher("view/zipResultGson.jsp").forward(request, response);
		
	}

}
