package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 0. 클라이언트 전송 시 데이터 받기 - 9개
		
		MemberVO vo = new MemberVO();
		
//		String mid = request.getParameter("mem_id");
//		vo.setMem_id(mid);
		
		// BeanUtils 이용
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 1. service 객체 얻어오기
		IMemberService service = MemberServiceImpl.getService();
		
		// 2. service 메서드 호출 - 결과값 받기
		String resid = service.InsertMember(vo);
		
		// 3. 결과값을 request에 저장
		request.setAttribute("value", resid); 				// insert후 결과
		request.setAttribute("inputid", vo.getMem_id());	// 입력한 아이디
		
		// view 페이지로 이동 - 출력 (json 데이터 생성)
		request.getRequestDispatcher("view/insert.jsp").forward(request, response);
	}

}
