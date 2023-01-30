package pool.manage.system.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import pool.manage.system.common.MemberDAO;
import pool.manage.system.common.MemberDTO;
import static pool.manage.system.common.Template.getSqlSession;


public class MemberService {
	
	private final MemberDAO memberDAO;
	
	public MemberService() {
		memberDAO = new MemberDAO();
	}

	public List<MemberDTO> selectAllMember() {
		
		SqlSession sqlSession = getSqlSession();
		
		List<MemberDTO> memberList = memberDAO.selectAllMember(sqlSession);
		
		return memberList;
	}

	public MemberDTO selectMemberByCode(int code) {
		
		SqlSession sqlSession = getSqlSession();
		
		MemberDTO member = memberDAO.selectMemberByCode(sqlSession, code);
		
		sqlSession.close();
		
		return member;
	}

	public boolean insertMember(MemberDTO member) {
		
		SqlSession sqlSession = getSqlSession();
		
		int result = memberDAO.insertMember(sqlSession, member);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	public boolean updateMember(MemberDTO member) {
		
		SqlSession sqlSession = getSqlSession();
		
		int result = memberDAO.updateMember(sqlSession, member);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

	public boolean deleteMember(int code) {
		
		SqlSession sqlSession = getSqlSession();
		
		int result = memberDAO.deleteMember(sqlSession, code);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result > 0 ? true : false;
	}

}
