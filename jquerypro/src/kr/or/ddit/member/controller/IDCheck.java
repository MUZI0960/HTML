package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/IDCheck.do")
public class IDCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IDCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 클라이언트 전송 시 데이터 받기 - 입력한 id
		String inputId = request.getParameter("id");
		
		// 1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		
		// 2. service 메서드 호출 - 결과값 받기
		String res = service.idCheck(inputId);
		
		// 3. 결과값을 request에 저장
		request.setAttribute("value", res);
		
		// 4. view페이지로 이동 - 출력 (json생성)
		//request.getRequestDispatcher("").forward(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher("view/idCheck.jsp");
		disp.forward(request, response);
		
	}

}
