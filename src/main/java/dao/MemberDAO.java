package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public MemberVO selectOne(String id) {

		MemberVO vo = sqlSession.selectOne("member.member_selectOne", id);

		return vo;
	}

	public int insert(String name, String id, String pwd, String email, String tel, String addr) {
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setAddr(addr);
		int res = sqlSession.insert("member.member_insert", vo);

		return res;
	}
}
