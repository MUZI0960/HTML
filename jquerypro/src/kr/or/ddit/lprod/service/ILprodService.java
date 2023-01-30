package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.vo.LprodVO;

public interface ILprodService {

	// 전체 가져오기
		public List<LprodVO> selectLprod();
	
}
