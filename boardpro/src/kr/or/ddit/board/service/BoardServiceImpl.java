package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.http.fileupload.ThresholdingOutputStream;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public class BoardServiceImpl implements IBoardService{

	private IBoardDao dao;
	private static IBoardService service;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	
	public static IBoardService getService() {
		if(service == null) service = new BoardServiceImpl();
		
		return service;
	}
	
	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		List<BoardVO> list = null;
		list = dao.selectByPage(map);
		return list;
	}

	@Override
	public int deleteBoard(int num) {
		int no = 0;
		no = dao.deleteBoard(num);
		return no;
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		int num = 0;
		num = dao.modifyBoard(vo);
		return num;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		int num = 0;
		num = dao.insertBoard(vo);
		return num;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		int num = 0;
		num = dao.totalCount(map);
		return num;
	}

	@Override
	public int updateHit(int num) {
		int no = 0;
		no = dao.updateHit(num);
		return no;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int num = 0;
		num = dao.insertReply(vo);
		return num;
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		int num = 0;
		num = dao.modifyReply(vo);
		return 0;
	}

	@Override
	public int deleteReply(int renum) {
		int num = 0;
		num = dao.deleteReply(renum);
		return num;
	}

	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		
		int count = this.totalCount(map);
		
		// 전체 페이지 수 구하기 - totalPage
		int perList = PageVO.getPerList();
		int totalPage = (int) (Math.ceil((double) count / perList));
		
		// start, end 구하기 - page를 기준
		int start = (page-1) * perList + 1;
		int end = start + perList -1;
		if(end > count) end = count;
		
		// startPage, endPage 구하기 - page를 기준
		int perPage = PageVO.getPerPage();
		int startPage = ((page - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		// PageVO에 저장 - 
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
}
