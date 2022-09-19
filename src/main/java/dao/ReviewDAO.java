package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 조회
	public List<ReviewVO> selectList(Map<String, Integer> map) {

		System.out.println("여긴 dao");
		System.out.println("map start : " + map.get("start"));
		System.out.println("map end : " + map.get("end"));

		List<ReviewVO> list = sqlSession.selectList("r.review_list", map);
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

	// 게시글 삭제
	public int delete(int idx) {
		// idx는 파라미터 값이다.
		int res = sqlSession.update("r.review_delete", idx);
		return res;
	}

	// 전체 게시물 수 조회
	public int getRowTotal() {
		int res = sqlSession.selectOne("r.review_count");
		return res;
	}

}
