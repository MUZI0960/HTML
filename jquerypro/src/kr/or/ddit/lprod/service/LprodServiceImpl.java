package kr.or.ddit.lprod.service;

import java.util.List;


import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

/*
 	- dao메서드 호출하여 결과를 리턴 받는다. => dao객체가 필요 (생성자에서 실행)
 	- 자신의 객체를 생성해하여 리턴하는 메서드 
 	
*/
public class LprodServiceImpl implements ILprodService {

	private ILprodDao dao;
	private static ILprodService service;
	
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getDao();
	}
	
	public static ILprodService getService() {
		if(service == null) service = new LprodServiceImpl();
		
		return service;
	}
	
	@Override
	public List<LprodVO> selectLprod() {
		List<LprodVO> list = null;
		list = dao.selectLprod();
		return list;
		
		
		
	}

}
