package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 조회
	public List<ReviewVO> selectList() {
		List<ReviewVO> list = sqlSession.selectList("r.review_list");
		return list;
	}

	// 상세보기를 위한 게시물 한 건 조회
	public ReviewVO selectOne(int idx) {

		ReviewVO vo = sqlSession.selectOne("r.review_one", idx);
		return vo;
	}

}
