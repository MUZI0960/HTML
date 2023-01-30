package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/*
 * SqlMapClient객체 필요 - 생성자에서 실행
 * 자신의 객체를 생성해서 리턴하는 메서드
 * 
 * */
public class MemberDaoImpl implements IMemberDao{

	private SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	
	@Override
	public String idCheck(String id) {
		String res = null;
		
		try {
			res = (String) client.queryForObject("member.idCheck", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> res = null;
		
		try {
			res = client.queryForList("member.selectByDong", dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String InsertMember(MemberVO vo) {
		String res = null;
		
		try {
			res = (String) client.insert("member.InsertMember", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

}
