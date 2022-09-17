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

	// 새글 추가
	public int insert(ReviewVO vo) {
		int res = sqlSession.insert("r.review_insert", vo);
		return res;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("r.update_readhit", idx);
		return res;
	}

	// 내용 수정하기
	public int update(ReviewVO vo) {
		int res = sqlSession.update("r.review_update", vo);
		return res;
	}

}
