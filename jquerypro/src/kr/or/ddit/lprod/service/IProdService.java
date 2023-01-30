package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.vo.ProdVO;

public interface IProdService {

	// prod_lgu에 따른 제품 리스트
		public List<ProdVO> selectByLgu(String lprod_gu);
		
		// prod_id에 따른 상세 보기
		public ProdVO selectByIdDetail(String prod_id);
	
}
