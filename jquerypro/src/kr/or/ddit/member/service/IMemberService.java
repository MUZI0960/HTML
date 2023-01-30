package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	// id 중복검사
	public String idCheck(String id);
	
	// 우편번호 검색
	public List<ZipVO> selectByDong(String dong);
	
	// 저장 가입하기 - 저장한 id를 리턴
	public String InsertMember(MemberVO vo);
}
