package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.IProdDao;
import kr.or.ddit.lprod.dao.ProdDaoImpl;
import kr.or.ddit.lprod.vo.ProdVO;

/*
 * Dao객체가 필요하다 - Dao클래스 메서드 호출 - Dao클래스로부터 얻어온다. - 생성자에서 실행
 * 자신의 객체를 만들어서 리턴하는 메서드 
 * */
public class ProdServiceImpl implements IProdService {

	private IProdDao dao;
	private static IProdService service;
	
	public ProdServiceImpl() {
		dao = ProdDaoImpl.getDao();
	
	}
	
	public static IProdService getService() {
		if(service ==null) service = new ProdServiceImpl();
		
		return service;
	}
	
	@Override
	public List<ProdVO> selectByLgu(String lprod_gu) {
		List<ProdVO> list = null;
		
		list = dao.selectByLgu(lprod_gu);
		
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String prod_id) {

		return dao.selectByIdDetail(prod_id);
	}

}
