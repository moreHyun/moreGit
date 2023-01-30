package pool.manage.system.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


public class MemberDAO {
	
	public List<MemberDTO> selectAllMember(SqlSession sqlSession) {
		return sqlSession.selectList("MemberMapper.selectAllMember");
	}

	public MemberDTO selectMemberByCode(SqlSession sqlSession, int code) {
		return sqlSession.selectOne("MemberMapper.selectMemberByCode", code);
	}

	public int insertMember(SqlSession sqlSession, MemberDTO member) {
		return sqlSession.insert("MemberMapper.insertMember", member);
	}
	
	public int updateMember(SqlSession sqlSession, MemberDTO member) {
		return sqlSession.update("MemberMapper.selectAllMember", member);
	}
	
	public int deleteMember(SqlSession sqlSession, int code) {
		return sqlSession.delete("MemberMapper.deleteMember", code);
	}
}
