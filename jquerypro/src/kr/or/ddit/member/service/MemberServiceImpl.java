package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/*
 * dao객체가 필요 - 생성자에서 실행 - dao클래스에서 얻어오기
 * 자신의 객체를 생성하고 리턴하는 메서드
*/

public class MemberServiceImpl implements IMemberService {

	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}
	
	public static IMemberService getService() {
		if(service==null) service = new MemberServiceImpl();
		
		return service;
	}
	
	@Override
	public String idCheck(String id) {
//		String res = null;
//		
//		res = dao.idCheck(id);
//		
//		return res;
		
		return dao.idCheck(id);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> res = null;
		
		res = dao.selectByDong(dong);
		
		return res;
	}

	@Override
	public String InsertMember(MemberVO vo) {
		String res = null;
		
		res = dao.InsertMember(vo);
		
		return res;
	}

}
