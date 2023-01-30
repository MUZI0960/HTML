package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

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
		list = service.selectByPage(map);
		return list;
	}

	@Override
	public int deleteBoard(int num) {
		int no = 0;
		no = service.deleteBoard(num);
		return no;
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		int num = 0;
		num = service.modifyBoard(vo);
		return num;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		int num = 0;
		num = service.insertBoard(vo);
		return num;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		int num = 0;
		num = service.totalCount(map);
		return num;
	}

	@Override
	public int updateHit(int num) {
		int no = 0;
		no = service.updateHit(num);
		return no;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int num = 0;
		num = service.insertReply(vo);
		return num;
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		int num = 0;
		num = service.modifyReply(vo);
		return 0;
	}

	@Override
	public int deleteReply(int renum) {
		int num = 0;
		num = service.deleteReply(renum);
		return num;
	}

	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
