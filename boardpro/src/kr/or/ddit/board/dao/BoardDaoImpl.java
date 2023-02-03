package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BoardDaoImpl implements IBoardDao{

	private SqlMapClient client;
	private static IBoardDao dao;
	
	private BoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return dao;
		}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		List<BoardVO> list = null;
		
		try {
			list = client.queryForList("board.selectByPage",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int deleteBoard(int num) {
		int no = 0;
		
		try {
			no = client.delete("board.deleteBoard", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return no;
	}


	@Override
	public int insertBoard(BoardVO vo) {
		int num = 0;
		
		try {
			num = (int) client.insert("board.insertBoard", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		int num = 0;
		
		try {
			num = (int) client.queryForObject("board.totalCount",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public int updateHit(int num) {
		int no = 0;
		
		try {
			no = client.update("board.updateHit", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return no;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int num = 0;
		
		try {
			num = (int) client.insert("reply.insertReply", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}


	@Override
	public int deleteReply(int renum) {
		int num = 0;
		
		try {
			num = client.delete("reply.deleteReply", renum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}


	@Override
	public int modifyReply(ReplyVO vo) {
		int num = 0;
		
		try {
			num = client.update("reply.modifyReply", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		int num = 0;
		
		try {
			num = client.update("board.modifyBoard", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public List<ReplyVO> selectReply(int bonum) {
		List<ReplyVO> list = null;
		
		try {
			list = client.queryForList("reply.selectReply", bonum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	
	
	
	
}
