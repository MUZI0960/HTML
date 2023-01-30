package kr.or.ddit.lprod.dao;

import java.util.List;


import kr.or.ddit.lprod.vo.LprodVO;

public interface ILprodDao {

	// 전체 가져오기
	public List<LprodVO> selectLprod();
	
}
